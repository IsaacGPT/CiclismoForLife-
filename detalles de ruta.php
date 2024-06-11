<?php
include 'conexion.php';

$distance = 10.5;
$duration = 120;
$elevation = 300;
$terrainType = "Montaña";
$difficulty = "Difícil";
$routeDate = "2024-06-11";
$startTime = "08:00:00";

$sql = "INSERT INTO RouteDetails (Distance, Duration, Elevation, TerrainType, Difficulty, RouteDate, StartTime) VALUES ($distance, $duration, $elevation, '$terrainType', '$difficulty', '$routeDate', '$startTime')";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo detalle de ruta insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
