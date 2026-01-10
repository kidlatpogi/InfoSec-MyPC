<?php
/**
 * Create 150 test users with Filipino names
 */

require_once __DIR__ . '/HTML_PHP/Database.php';

// Filipino first names
$first_names = [
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
];

// Filipino last names
$last_names = [
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
    'Solis', 'Solminihac', 'Solms', 'Solnitz', 'Solnon', 'Solntseff', 'Solntsev', 'Solntsevsky', 'Solo', 'Solobay'
];

function generate_password($length = 12) {
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*';
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $password .= $characters[rand(0, strlen($characters) - 1)];
    }
    return $password;
}

function generate_email($first_name, $last_name, $index) {
    $email = strtolower($first_name) . '.' . str_replace(' ', '', strtolower($last_name)) . $index . '@mypc.com';
    return str_replace(' ', '', $email);
}

try {
    $db = Database::getInstance();
    $conn = $db->getConnection();
    
    $credentials = [];
    echo "Generating 150 users with Filipino names...\n";
    
    for ($i = 1; $i <= 150; $i++) {
        $first_name = $first_names[array_rand($first_names)];
        $last_name = $last_names[array_rand($last_names)];
        $email = generate_email($first_name, $last_name, $i);
        $password = generate_password();
        
        // Use PHP's password_hash for bcrypt
        $password_hash = password_hash($password, PASSWORD_BCRYPT);
        
        $sql = "INSERT INTO users (email, password_hash, first_name, last_name, role, is_admin, created_at, updated_at) 
                VALUES (?, ?, ?, ?, 'user', 0, NOW(), NOW())";
        
        $stmt = $conn->prepare($sql);
        $stmt->execute([$email, $password_hash, $first_name, $last_name]);
        
        $credentials[] = [
            'email' => $email,
            'password' => $password
        ];
        
        if ($i % 30 == 0) {
            echo "  Created $i users...\n";
        }
    }
    
    // Save credentials to file
    $output = "============================================================\n";
    $output .= "MyPC User Credentials - 150 Test Users\n";
    $output .= "============================================================\n\n";
    $output .= "Generated: " . date('Y-m-d H:i:s') . "\n\n";
    
    foreach ($credentials as $cred) {
        $output .= "Email: " . $cred['email'] . "\n";
        $output .= "Password: " . $cred['password'] . "\n";
        $output .= "------------------------------------------------------------\n";
    }
    
    file_put_contents(__DIR__ . '/user_credentials.txt', $output);
    
    echo "\n✓ Successfully created 150 users!\n";
    echo "✓ Credentials saved to: user_credentials.txt\n";
    echo "\nFirst 5 users:\n";
    for ($i = 0; $i < 5; $i++) {
        echo "  " . ($i + 1) . ". " . $credentials[$i]['email'] . " / " . $credentials[$i]['password'] . "\n";
    }
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
