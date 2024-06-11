<?php
include 'conexion.php';

$corredorID = 1;
$razon = "Razón de la descalificación";

$sql = "INSERT INTO Descalificaciones (CorredorID, Razon) VALUES ($corredorID, '$razon')";

if ($conn->query($sql) === TRUE) {
    echo "Nueva descalificación insertada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
