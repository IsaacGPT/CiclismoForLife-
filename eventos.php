<?php
include 'conexion.php';

$nombre = "Evento de ejemplo";
$cantidadParticipantes = 100;
$fecha = "2024-07-01";
$horarioInicio = "09:00:00";
$horaFinalizacion = "12:00:00";
$modalidad = "Competencia";
$clasificacion = "A";
$idRuta = 1;
$idCarrera = 1;

$sql = "INSERT INTO Eventos (idEvento, nombre, cantidadParticipantes, fecha, horarioInicio, horaFinalizacion, modalidad, clasificacion, idRuta, idCarrera) VALUES (1, '$nombre', $cantidadParticipantes, '$fecha', '$horarioInicio', '$horaFinalizacion', '$modalidad', '$clasificacion', $idRuta, $idCarrera)";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo evento insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
