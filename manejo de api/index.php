<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API - Ventas de Perfumes</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header>
        <h1>🌸 Ventas de Perfumes y Lociones</h1>
        <p>API REST - CRUD de Productos</p>
    </header>
    <nav>
        <a href="index.php">Inicio</a> <a href="listar.php">Productos</a> <a href="agregar.php">Agregar</a>
        <a href="editar.php">Editar</a><a href="eliminar.php">Eliminar</a>
    </nav>
    <main>
        <section class="bienvenida">
            <h2>Administración de Productos</h2>
            <p>Seleccione una opción para administrar los productos de la tienda.</p>
        </section>
        <section class="menu-crud">
            <!-- LISTAR -->
            <div class="card">
                <div class="icono">📄</div>
                <h2>Listar Productos</h2>
                <p>Consultar los perfumes y lociones registrados.</p>
                <a href="listar.php" class="boton">Ver Productos</a>
            </div>
            <!-- AGREGAR -->
            <div class="card">
                <div class="icono">➕</div>
                <h2>Agregar Producto</h2>
                <p>Registrar un nuevo perfume o loción en el catálogo.</p>
                <a href="agregar.php" class="boton">Agregar Producto</a>
            </div>
            <!-- EDITAR -->
            <div class="card">
                <div class="icono">✏️</div>
                <h2>Editar Producto</h2>
                <p>Modificar la información de un producto.</p>
                <a href="editar.php" class="boton">Editar Producto</a>
            </div>
            <!-- ELIMINAR -->
            <div class="card">
                <div class="icono">🗑️</div>
                <h2>Eliminar Producto</h2>
                <p>Eliminar un producto del catálogo.</p>
                <a href="eliminar.php" class="boton eliminar">Eliminar Producto</a>
            </div>
        </section>
        <section class="api-info">
            <h2>API REST</h2>
            <p>
                El sistema utiliza una API desarrollada en PHP para comunicarse con la base de datos.
            </p>
            <div class="metodos">
                <span class="get">GET</span>
                <span class="post">POST</span>
                <span class="put">PUT</span>
                <span class="delete">DELETE</span>
            </div>
        </section>
    </main>
    <footer>
        <p>Sistema de Ventas de Perfumes | PHP + MySQL + API REST | Mike2026©</p>
    </footer>
</body>
</html>