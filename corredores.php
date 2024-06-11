<?php
include 'conexion.php';

$nombre = "Nombre del Corredor";
$numero = 1; // Asignar el número correspondiente

$sql = "INSERT INTO Corredores (CorredorID, Nombre, Numero) VALUES (1, '$nombre', $numero)";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo corredor insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
