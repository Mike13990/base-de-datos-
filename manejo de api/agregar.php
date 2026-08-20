<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar productos</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header>
        <h1>Productos</h1>
        <p>Agregar productos</p>
    </header>
    <nav>
        <a href="index.php">Inicio</a>
        <a href="listar.php">Listar</a>
        <a href="agregar.php">Agregar</a>
        <a href="editar.php">Editar</a>
        <a href="eliminar.php">Eliminar</a>
    </nav>
    <main>
        <div class="formulario">
            <h2>Agregar producto</h2>
            <form id="formProducto">
                <label>Nombre del producto:</label>
                <input type="text" id="nombre" required>
                
                <label>Marca:</label>
                <input type="text" id="marca" required>
                
                <label>Tipo:</label>
                <select id="tipo" required>
                    <option value="">Seleccione</option>
                    <option value="Perfume">Perfume</option>
                    <option value="Locion">Locion</option>
                </select>
                
                <label>Precio:</label>
                <input type="number" id="precio" step="0.01" required>
                
                <label>Cantidad:</label>
                <input type="number" id="cantidad" required>
                
                <label>URL de imagen:</label>
                <input type="text" id="imagen" placeholder="img/perfume.jpg" required>
                
                <button type="submit">Guardar productos</button>
            </form>
            <p id="mensaje"></p>
        </div>
    </main>
    <script>
        document.getElementById("formProducto").addEventListener("submit", function(e){
            e.preventDefault();
            
            const producto = {
                nombre: document.getElementById("nombre").value, 
                marca: document.getElementById("marca").value,
                tipo: document.getElementById("tipo").value, 
                precio: document.getElementById("precio").value,
                cantidad: document.getElementById("cantidad").value, 
                imagen: document.getElementById("imagen").value
            };
            
            fetch("api.php", {
                method: "POST", 
                headers: {"Content-Type": "application/json"}, 
                body: JSON.stringify(producto)
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById("mensaje").innerText = data.mensaje; 
                document.getElementById("formProducto").reset();
            })
            .catch(error => {
                console.error(error);
            });
        });
    </script>
</body>
</html>