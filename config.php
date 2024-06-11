<?php
$servername = "DESKTOP-B920RQG\SQLEXPRESS";
$username = "Pale";
$password = "Pale12345";
$dbname = "LongRaceCCC";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
