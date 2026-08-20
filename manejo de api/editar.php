<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de productos</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header>
        <h1>Editar productos</h1>
    </header>
    <nav>
        <a href="index.php">Inicio</a><a href="listar.php">Listar</a><a href="agregar.php">Agregar</a>
        <a href="editar.php">Editar</a><a href="eliminar.php">Eliminar</a>
    </nav>
    <main>
        <div class="formulario">
            <h2>Buscar producto</h2>
            <input type="number" id="buscarId" placeholder="Código del producto">
            <button type="button" onclick="buscarProducto()">Buscar</button>
            <hr>
            <form id="formEditar" style="display: none;">
                <input type="hidden" id="id_producto">
                <label>Nombre del producto:</label><input type="text" id="nombre" required>
                <label>Marca:</label><input type="text" id="marca" required>
                <label>Tipo:</label>
                    <select id="tipo" required>
                        <option value="Perfume">Perfume</option>
                        <option value="Locion">Locion</option>
                    </select>
                <label>Precio:</label><input type="number" id="precio" step="0.01" required>
                <label>Cantidad:</label><input type="number" id="cantidad" required>
                <label>URL de imagen:</label><input type="text" id="imagen" placeholder="img/perfume.jpg" required>
                <button type="submit">Actualizar producto</button>
            </form>
            <p id="mensaje"></p>
        </div>
    </main>
    <script>
        //Buscar producto
        function buscarProducto()
        {
            const id= document.getElementById("buscarId").value;
            fetch("api.php")
            .then(response => response.json())
            .then(data =>{
                const producto = data.find(p=> p.id_producto == id);
                if(!producto){Document.getElementById("mensaje").innerText="Producto no encontrado"; return;}
                document.getElementById("formEditar").style.display="block";
                document.getElementById("id_producto").value=producto.id_producto;
                document.getElementById("nombre").value=producto.nombre;
                document.getElementById("marca").value=producto.marca;
                document.getElementById("tipo").value=producto.tipo;
                document.getElementById("precio").value=producto.precio;
                document.getElementById("cantidad").value=producto.cantidad;
                document.getElementById("imagen").value=producto.imagen;
            });
        }
        document.getElementById("formEditar").addEventListener("submit",function(e){e.preventDefault();
            const producto={id_producto: document.getElementById("id_producto").value,
                nombre: document.getElementById("nombre").value, marca: document.getElementById("marca").value,
                tipo: document.getElementById("tipo").value, precio: document.getElementById("precio").value,
                cantidad: document.getElementById("cantidad").value, imagen: document.getElementById("imagen").value
            };
            fetch("api.php",{method: "PUT", headers: {"Content-Type":"application/json"}, body:JSON.stringify(producto)})
            .then(response => response.json())
            .then(data => {document.getElementById("mensaje").innerText = data.mensaje;})
            .catch(error => {console.error(error);});
        });
    </script>
</body>
</html>