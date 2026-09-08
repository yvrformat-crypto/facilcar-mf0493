<?php
require_once __DIR__ . '/vendor/autoload.php';

// Si usas PHPDotenv, se cargará automáticamente del entorno si el archivo .env no existe
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->safeLoad(); // safeLoad evita que falle si no encuentra un archivo .env físico

// Leer variables de entorno (puedes usar $_ENV o getenv())
$dbHost = $_ENV['DB_HOST'] ?? getenv('DB_HOST') ?? 'localhost';
$dbPort = $_ENV['DB_PORT'] ?? getenv('DB_PORT') ?? '3306';
$dbName = $_ENV['DB_NAME'] ?? getenv('DB_NAME');
$dbUser = $_ENV['DB_USER'] ?? getenv('DB_USER');
$dbPass = $_ENV['DB_PASS'] ?? getenv('DB_PASS');

$dsn = "mysql:host=$dbHost;port=$dbPort;dbname=$dbName;charset=utf8mb4";


try {
    $conn = new PDO($dsn, $dbUser, $dbPass);
    // echo "Conexión correcta";

} catch (PDOException $e) {
    echo "¡Error! :".$e->getMessage()."<br>";
}


