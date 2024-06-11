<?php
include 'conexion.php';

$nombre = "Carrera de ejemplo";

$sql = "INSERT INTO Carreras (idCarrera, nombre) VALUES (1, '$nombre')";

if ($conn->query($sql) === TRUE) {
    echo "Nueva carrera insertada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
