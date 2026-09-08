<?php
session_start();
include_once 'connection.php';

// echo "SOy delete.php";

$id = $_GET['id'];
// echo $id;

$delete = "DELETE FROM vehiculos WHERE id_vehiculo = ?"; 

try {
    $query = $conn->prepare($delete);
    $query->execute([$id]);
    $_SESSION['delete'] = "ok";
    // echo "Borrado OK";

} catch (PDOException $e) {
    $_SESSION['error'] = "error";
    echo "Error ". $e->getMessage();
}

$conn = null;
$query = null;

header('location: index.php');