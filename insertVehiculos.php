<?php
session_start();

include_once 'connection.php';

// Forma de conexión alternativa 
// require_once('connection.php')


// echo "<pre>";
// echo "POST:";
// var_dump($_POST);
// echo "</pre>";

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

$insert = "INSERT INTO vehiculos(marca, modelo, tipo, numero_puertas, plazas, precio_dia, stock, automatico) 
VALUES (?, ?, ?, ?, ?, ?, ?, ? ) ";

try {
    $sql_insert = $conn->prepare($insert);
    $sql_insert->execute([$marca, $modelo, $tipo, $puertas, $plazas, $precio, $stock, $automatico ]);
    $_SESSION['ok'] = "ok";
    // echo "OK";

} catch (PDOException $e) {
    echo "Error";
}

$conn = null;
$sql_insert = null;

header('location: index.php');
exit();
/* 
Comentario
multilínia
*/

// echo "<pre>";
// echo "GET:";
// var_dump($_GET);
// echo "</pre>";
// echo "<pre>";
// echo "POST:";
// var_dump($_POST);
// echo "</pre>";
