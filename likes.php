<?php
include 'conexion.php';

$publicacion_id = 1;
$texto = "Este es un texto de ejemplo para un like";

$sql = "INSERT INTO likess (publicacion_id, texto) VALUES ($publicacion_id, '$texto')";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo like insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
