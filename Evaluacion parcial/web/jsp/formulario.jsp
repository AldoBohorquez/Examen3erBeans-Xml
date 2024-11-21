<%-- 
    Document   : datoXML
    Created on : 13/11/2024, 07:40:12 PM
    Author     : swoke
--%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Formulario de Películas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f4f7f6;
            }

            .container {
                margin-top: 50px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 30px;
            }

            h1 {
                color: #343a40;
            }

            .btn-custom {
                background-color: #ff6600;
                color: white;
                border: none;
            }

            .btn-custom:hover {
                background-color: #0056b3;
                color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
            }

            .form-label {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Agregar Película</h1>
            <form action="${pageContext.request.contextPath}/peliculas_servlet" method="post">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre de la Película:</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" 
                           pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s]+" 
                           title="Solo se permiten letras, espacios y caracteres como ñ o acentos." 
                           required>
                </div>
                <div class="mb-3">
                    <label for="synopsis" class="form-label">Sinopsis:</label>
                    <textarea class="form-control" name="synopsis" id="synopsis" rows="3" 
                              pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ\s,.!?]+" 
                              title="La sinopsis solo puede incluir letras, espacios, puntuación y caracteres como ñ o acentos." 
                              required></textarea>
                </div>
                <div class="mb-3">
                    <label for="precio" class="form-label">Precio:</label>
                    <input type="number" class="form-control" name="precio" id="precio" 
                           step="0.01" min="0" 
                           title="El precio debe ser un número mayor o igual a 0." 
                           required>
                </div>
                <div class="mb-3">
                    <label for="fecha" class="form-label">Fecha:</label>
                    <input type="date" class="form-control" name="fecha" id="fecha" required>
                </div>
                <div class="mb-3">
                    <label for="hora" class="form-label">Hora:</label>
                    <input type="time" class="form-control" name="hora" id="hora" required>
                </div>
                <button type="submit" class="btn btn-custom">Agregar Película</button>
            </form>
        </div>
    </body>
</html>
