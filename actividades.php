<?php
include 'conexion.php';

$ciclistaID = 1;
$titulo = "Actividad de ejemplo";
$distancia = 20.5;
$duracion = "02:30:00";
$velocidadPromedio = 8.2;

$sql = "INSERT INTO Actividades (CiclistaID, Titulo, Distancia, Duracion, VelocidadPromedio) VALUES ($ciclistaID, '$titulo', $distancia, '$duracion', $velocidadPromedio)";

if ($conn->query($sql) === TRUE) {
    echo "Nueva actividad insertada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
