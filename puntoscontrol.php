<?php
include 'conexion.php';

$routeID = 1;
$pointName = "Punto de Interés";
$description = "Descripción del punto de interés";

$sql = "INSERT INTO PointsOfInterest (RouteID, PointName, Description) VALUES ($routeID, '$pointName', '$description')";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo punto de interés insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
