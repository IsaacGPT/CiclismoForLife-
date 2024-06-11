<?php
include 'conexion.php';

$nombre = "Ruta de ejemplo";

$sql = "INSERT INTO Rutas (idRuta, nombre) VALUES (1, '$nombre')";

if ($conn->query($sql) === TRUE) {
    echo "Nueva ruta insertada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
