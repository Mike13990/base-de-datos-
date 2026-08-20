<?php
    header("Content-Type: application/json");
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
    header("Access-Control-Allow-Headers: Content-Type");
    
    require_once "conexion.php";
    $metodo = $_SERVER['REQUEST_METHOD'];
    if($metodo == "GET") {
        $sql = "SELECT * FROM productos";
        $resultado = $conexion->query($sql);
        $productos = [];
        while ($fila = $resultado->fetch_assoc()) {
            $productos[] = $fila;
        }
        echo json_encode($productos);
    }
    elseif($metodo == "POST") {
        $datos = json_decode(file_get_contents("php://input"), true);
        
        $nombre = $datos['nombre'];
        $tipo = $datos['tipo'];
        $precio = $datos['precio'];
        $cantidad = $datos['cantidad'];
        $imagen = $datos['imagen'];
        $sku = uniqid('SKU-'); 
        
        $sql = "INSERT INTO productos (codigo_sku, nombre_producto, tipo, precio_unitario, stock_disponible, url_imagen) 
                VALUES ('$sku', '$nombre', '$tipo', '$precio', '$cantidad', '$imagen')";
                
        if($conexion->query($sql)){
            echo json_encode(["mensaje" => "Producto agregado correctamente"]);
        } else {
            echo json_encode(["Error" => $conexion->error]);
        }
    }
    elseif($metodo == "PUT") {      
        $datos = json_decode(file_get_contents("php://input"), true);
        $id = $datos['id_producto']; 
        $nombre = $datos['nombre'];
        $tipo = $datos['tipo'];
        $precio = $datos['precio'];
        $cantidad = $datos['cantidad'];
        $imagen = $datos['imagen'];
        
        $sql = "UPDATE productos SET 
                nombre_producto='$nombre', 
                tipo='$tipo', 
                precio_unitario='$precio', 
                stock_disponible='$cantidad', 
                url_imagen='$imagen'
                WHERE id_producto='$id'";
                
        if($conexion->query($sql)){
            echo json_encode(["mensaje" => "Producto actualizado correctamente"]);
        } else {
            echo json_encode(["Error" => $conexion->error]);
        }
    }
    elseif($metodo == "DELETE") {
        $datos = json_decode(file_get_contents("php://input"), true);
        $id = $datos['id_producto'];
        
        $sql = "DELETE FROM productos WHERE id_producto = '$id'";
        
        if($conexion->query($sql)){
            echo json_encode(["mensaje" => "Producto eliminado correctamente"]);
        } else {
            echo json_encode(["Error" => $conexion->error]);
        }
    }
    else {
        echo json_encode(["Error" => "Método no permitido"]);
    }
    
    $conexion->close();
?>