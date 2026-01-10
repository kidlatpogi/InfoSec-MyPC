import mysql.connector
import random
import string
from datetime import datetime

# Database connection details
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'mypc_db'
}

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

def main():
    try:
        # Connect to database
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        
        # Lists to store credentials
        credentials = []
        
        print("Generating 150 users...")
        
        # Generate and insert users
        for i in range(1, 151):
            first_name = random.choice(first_names)
            last_name = random.choice(last_names)
            email = generate_email(first_name, last_name, i)
            password = generate_password()
            
            # Hash the password using PHP's password_hash equivalent (bcrypt)
            # For now, we'll use a simple hash. In production, use proper bcrypt
            import hashlib
            password_hash = hashlib.sha256(password.encode()).hexdigest()
            
            # For proper bcrypt compatibility with PHP, we'll store plaintext temporarily
            # and PHP will hash it, or use the proper bcrypt library
            try:
                from bcrypt import hashpw, gensalt
                password_hash = hashpw(password.encode('utf-8'), gensalt()).decode('utf-8')
            except ImportError:
                # Fallback if bcrypt not available - use argon2 or just sha256
                # PHP's password_hash uses bcrypt by default
                # For now, we'll use a simple approach - store plaintext and hash on PHP side
                password_hash = password  # Will be hashed by a PHP script
            
            # Insert user into database
            sql = """
            INSERT INTO users (email, password_hash, first_name, last_name, role, is_admin, created_at, updated_at)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            
            values = (email, password_hash, first_name, last_name, 'user', 0, datetime.now(), datetime.now())
            cursor.execute(sql, values)
            
            # Store credentials for output file
            credentials.append((email, password))
            
            if i % 30 == 0:
                print(f"  Created {i} users...")
        
        conn.commit()
        cursor.close()
        conn.close()
        
        # Save credentials to file
        with open('user_credentials.txt', 'w') as f:
            f.write("=" * 60 + "\n")
            f.write("MyPC User Credentials - 150 Test Users\n")
            f.write("=" * 60 + "\n\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            
            for email, password in credentials:
                f.write(f"Email: {email}\n")
                f.write(f"Password: {password}\n")
                f.write("-" * 60 + "\n")
        
        print(f"\n✓ Successfully created 150 users!")
        print(f"✓ Credentials saved to: user_credentials.txt")
        print(f"\nFirst 5 users:")
        for i, (email, password) in enumerate(credentials[:5], 1):
            print(f"  {i}. {email} / {password}")
        
    except mysql.connector.Error as err:
        print(f"Database Error: {err}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
