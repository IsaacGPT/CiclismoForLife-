<?php
include 'conexion.php';

$nombre = "Nombre del Ciclista";
$fechaNacimiento = "1990-01-01";
$ubicacion = "Ubicación del Ciclista";
$telefono = "1234567890";
$correo = "correo@ejemplo.com";
$grupoSanguineo = "O+";
$condicionesMedicas = "Ninguna";
$contactoEmergencia = "Contacto de Emergencia";

$sql = "INSERT INTO Ciclistass (CiclistaID, Nombre, FechaNacimiento, Ubicacion, Telefono, Correo, GrupoSanguineo, CondicionesMedicas, ContactoEmergencia) VALUES (1, '$nombre', '$fechaNacimiento', '$ubicacion', '$telefono', '$correo', '$grupoSanguineo', '$condicionesMedicas', '$contactoEmergencia')";

if ($conn->query($sql) === TRUE) {
    echo "Nuevo ciclista insertado correctamente";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
