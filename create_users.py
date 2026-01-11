import random
import string
import subprocess
from datetime import datetime

# Filipino first names
first_names = [
    'Maria', 'Jose', 'Juan', 'Rosa', 'Pedro', 'Ana', 'Carlos', 'Lucia', 'Antonio', 'Isabella',
    'Miguel', 'Francisca', 'Manuel', 'Elena', 'Francisco', 'Carmen', 'Luis', 'Josefa', 'Fernando', 'Teresa',
    'Rafael', 'Margarita', 'Diego', 'Dolores', 'Jorge', 'Amparo', 'Salvador', 'Pilar', 'Enrique', 'Consuelo',
    'Alejandro', 'Remedios', 'Guillermo', 'Esperanza', 'Roberto', 'Soledad', 'Ricardo', 'Mercedes', 'Eduardo', 'Graciela',
    'Arturo', 'Angelina', 'Ernesto', 'Hortensia', 'Agustin', 'Araceli', 'Domingo', 'Beatrice', 'Benjamin', 'Corazon',
    'Aurelio', 'Delia', 'Bartolome', 'Eloisa', 'Ceferino', 'Fabiola', 'Damaso', 'Genoveva', 'Danilo', 'Heriberta',
    'Estanislao', 'Inocencia', 'Eustaquio', 'Jovita', 'Faustino', 'Karokahan', 'Feliciano', 'Lamberta', 'Flavio', 'Magdalena',
    'Florentino', 'Micaela', 'Gregorio', 'Natividad', 'Hilario', 'Olympia', 'Hipolito', 'Pascuala', 'Ignacio', 'Perpetua',
    'Ilda', 'Quintina', 'Inocencio', 'Rosalinda', 'Isidro', 'Secundina', 'Jacinto', 'Teofila', 'Januario', 'Unidad',
    'Jeronimo', 'Venancia', 'Joaquin', 'Wenceslada', 'Jovino', 'Xylia', 'Joycelito', 'Yolanda', 'Justino', 'Zaida',
    'Kabigting', 'Aaliyah', 'Kamil', 'Beatriz', 'Karim', 'Cecilia', 'Kauri', 'Danita', 'Kavya', 'Emilia',
    'Kazimierz', 'Felisa', 'Keegan', 'Gisela', 'Keizan', 'Herminia', 'Kenneth', 'Isadora', 'Khurram', 'Jacinta'
]

# Filipino last names
last_names = [
    'De La Cruz', 'Santos', 'Garcia', 'Rodriguez', 'Reyes', 'Lopez', 'Gonzalez', 'Fernandez', 'Castillo', 'Morales',
    'Jimenez', 'Rivera', 'Flores', 'Vargas', 'Ortiz', 'Gutierrez', 'Medina', 'Herrera', 'Romero', 'Montoya',
    'Delgado', 'Campos', 'Munoz', 'Dominguez', 'Soto', 'Rojas', 'Miranda', 'Guerrero', 'Aguilar', 'Diaz',
    'Alonso', 'Peralta', 'Salazar', 'Molina', 'Torres', 'Vidal', 'Vega', 'Vasquez', 'Valenzuela', 'Velasco',
    'Valdez', 'Valencia', 'Villarreal', 'Villanueva', 'Villegas', 'Viloria', 'Vincent', 'Vinueza', 'Viola', 'Viramontes',
    'Virgen', 'Visbal', 'Vital', 'Vitarbo', 'Vivas', 'Viveros', 'Vizcarrondo', 'Vizza', 'Vocacio', 'Vodopivec',
    'Voit', 'Voitlexner', 'Volk', 'Volkman', 'Volkmer', 'Vollmer', 'Vollrath', 'Volpe', 'Volta', 'Voltaire',
    'Voltero', 'Volti', 'Voltin', 'Voltura', 'Volturno', 'Voltz', 'Voluta', 'Volume', 'Voluntad', 'Voluntario',
    'Bolisig', 'Cabrera', 'Cacho', 'Cadena', 'Camacho', 'Cambron', 'Cameron', 'Camille', 'Camilleri', 'Camilo',
    'Caminero', 'Campana', 'Campanella', 'Campanero', 'Campanilla', 'Campbell', 'Campero', 'Campion', 'Campisi', 'Campodónico',
    'Solis', 'Soliz', 'Solleder', 'Soller', 'Sollinger', 'Sollman', 'Sollner', 'Solloway', 'Sollus', 'Solly',
    'Solly', 'Solminihac', 'Solms', 'Solnitz', 'Solnon', 'Solntseff', 'Solntsev', 'Solntsevsky', 'Solo', 'Solobay'
]

def generate_password(length=12):
    """Generate a random password"""
    characters = string.ascii_letters + string.digits + '!@#$%^&*'
    return ''.join(random.choice(characters) for _ in range(length))

def generate_email(first_name, last_name, index):
    """Generate a unique email"""
    email = f"{first_name.lower()}.{last_name.lower().replace(' ', '')}{index}@mypc.com"
    return email.replace(' ', '')

def hash_password_php(password):
    """Hash password using PHP's password_hash function"""
    try:
        result = subprocess.run(
            ['php', '-r', f'echo password_hash("{password}", PASSWORD_BCRYPT);'],
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.strip()
    except Exception as e:
        print(f"Error hashing password: {e}")
        return None

def main():
    try:
        # Lists to store credentials and SQL statements
        credentials = []
        sql_statements = []
        
        print("Generating 150 users...")
        
        # Generate users
        for i in range(1, 151):
            first_name = random.choice(first_names)
            last_name = random.choice(last_names)
            email = generate_email(first_name, last_name, i)
            password = generate_password()
            
            # Hash password using PHP
            password_hash = hash_password_php(password)
            
            if not password_hash:
                print(f"  Failed to hash password for user {i}, skipping...")
                continue
            
            # Create SQL INSERT statement
            sql = f"INSERT IGNORE INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_admin`) VALUES\n('{email}', '{password_hash}', '{first_name}', '{last_name}', 'user', 0);"
            sql_statements.append(sql)
            
            # Store credentials
            credentials.append((email, password))
            
            if i % 30 == 0:
                print(f"  Generated {i} users...")
        
        # Save SQL file
        with open('users_insert.sql', 'w', encoding='utf-8') as f:
            f.write("-- =====================================================\n")
            f.write("-- MyPC Database - 150 Test Users\n")
            f.write("-- =====================================================\n")
            f.write(f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("-- Run this after mypc_complete.sql to add test users\n")
            f.write("-- =====================================================\n\n")
            f.write("USE mypc_db;\n\n")
            f.write("-- Insert 150 test user accounts\n")
            f.write("\n".join(sql_statements))
            f.write("\n\n-- =====================================================\n")
            f.write("-- COMPLETION MESSAGE\n")
            f.write("-- =====================================================\n\n")
            f.write("SELECT '150 test users added successfully!' as message,\n")
            f.write("       'Check user_credentials.txt for login details' as note;\n")
        
        # Save credentials to text file
        with open('user_credentials.txt', 'w', encoding='utf-8') as f:
            f.write("=" * 80 + "\n")
            f.write("MyPC User Credentials - 150 Test Users\n")
            f.write("=" * 80 + "\n\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            f.write("All accounts have role: 'user' (customer accounts)\n")
            f.write("=" * 80 + "\n\n")
            
            for idx, (email, password) in enumerate(credentials, 1):
                f.write(f"User #{idx:03d}\n")
                f.write(f"  Email:    {email}\n")
                f.write(f"  Password: {password}\n")
                f.write("-" * 80 + "\n")
        
        print(f"\n✓ Successfully generated 150 users!")
        print(f"✓ SQL file saved to: users_insert.sql")
        print(f"✓ Credentials saved to: user_credentials.txt")
        print(f"\nFirst 5 users:")
        for i, (email, password) in enumerate(credentials[:5], 1):
            print(f"  {i}. {email}")
            print(f"     Password: {password}")
        
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main()
