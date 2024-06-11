<?php
include 'conexion.php';

$corredorID = 1;
$puntos = 50;
$tiempo = 120;
$puntosCalculados = 41.67;

$sql = "INSERT INTO Registros (CorredorID, Puntos, Tiempo, PuntosCalculados) VALUES ($corredorID, $puntos, $tiempo, $puntosCalculados)";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo registro insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
