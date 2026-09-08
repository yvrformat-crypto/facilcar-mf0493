<?php
session_start();

include_once 'connection.php';

// Forma de conexión alternativa 
// require_once('connection.php')


// echo "<pre>";
// echo "POST:";
// var_dump($_POST);
// echo "</pre>";

$id = $_POST['id'];
$marca = htmlspecialchars($_POST['marca']);
$modelo = htmlspecialchars($_POST['modelo']);
$tipo = $_POST['tipo'];
$puertas = $_POST['puertas'];
$plazas = $_POST['plazas'];
$precio = $_POST['precio'];
$stock = $_POST['stock'];

if (isset($_POST['automatico'])) {
    $automatico = 1;
} else {
    $automatico = 0;
}

$update = "UPDATE vehiculos SET marca = ?, modelo = ?, tipo = ?, numero_puertas = ?, plazas = ?, precio_dia = ?, stock = ?, automatico = ? WHERE id_vehiculo = ?" ;

try {
    $query = $conn->prepare($update);
    $query->execute([$marca, $modelo, $tipo, $puertas, $plazas, $precio, $stock, $automatico, $id ]);
    $_SESSION['update'] = "ok";
    // echo "OK";

} catch (PDOException $e) {
    echo "Error";
}

$conn = null;
$query = null;

header('location: index.php');
exit();