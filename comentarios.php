<?php
include 'conexion.php';

$texto = "Este es un comentario de ejemplo";

$sql = "INSERT INTO comentarios (texto) VALUES ('$texto')";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo comentario insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
