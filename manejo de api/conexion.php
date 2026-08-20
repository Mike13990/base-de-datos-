<?php 
    // Cambiamos localhost por 127.0.0.1 para evitar el error de "Permission denied"
    $servidor = "127.0.0.1"; 
    $usuario = "admin";
    $password = "admin123";
    $base_De_datos = "ventas_perfumes";
    
    $conexion = new mysqli($servidor, $usuario, $password, $base_De_datos);
    
    if ($conexion->connect_error){
        die("error de conexion: " . $conexion->connect_error);
    }
    
    $conexion->set_charset("utf8");
?>