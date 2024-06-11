<?php
include 'conexion.php';

$idEvento = 1;
$idCiclista = 1;
$fechaInscripcion = "2024-06-01";

$sql = "INSERT INTO Inscripciones (idEvento, idCiclista, fechaInscripcion) VALUES ($idEvento, $idCiclista, '$fechaInscripcion')";

if ($conn->query($sql) === TRUE) {
    echo "Nueva inscripción insertada correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
