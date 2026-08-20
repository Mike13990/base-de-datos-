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
        <h1>Productos</h1>
        <p>Lista de perfumes y lociones</p>
    </header>
    <nav>
        <a href="index.php">Inicio</a>
        <a href="listar.php">Listar</a>
        <a href="agregar.php">Agregar</a>
        <a href="editar.php">Editar</a>
        <a href="eliminar.php">Eliminar</a>
    </nav>
    <main>
        <h2 class="titulo">Listado de productos</h2>
        <div id="productos" class="productos"></div>
    </main>

    <script>
        fetch("api.php")
        .then(response => response.json())
        .then(data => {
            const contenedor = document.getElementById("productos");
            
            // CORRECCIÓN 1: forEach con "E" mayúscula
            data.forEach(producto => {
                const tarjeta = document.createElement("div");
                
                // CORRECCIÓN 2: classList con "L" mayúscula
                tarjeta.classList.add("producto");
                
                // CORRECCIÓN 3: Usar los nombres reales de las columnas de la base de datos
                tarjeta.innerHTML = `
                    <img src="${producto.url_imagen}" alt="${producto.nombre_producto}" style="max-width: 100px;">
                    <h2>${producto.nombre_producto}</h2>
                    <p><strong>SKU:</strong> ${producto.codigo_sku}</p>
                    <p><strong>Tipo:</strong> ${producto.tipo}</p>
                    <p><strong>Precio:</strong> $${producto.precio_unitario}</p>
                    <p><strong>Cantidad (Stock):</strong> ${producto.stock_disponible}</p>
                    <p><strong>ID:</strong> ${producto.id_producto}</p>
                `;
                contenedor.appendChild(tarjeta);
            });
        })
        .catch(error => { console.error("Error: ", error); });
    </script>
</body>
</html>