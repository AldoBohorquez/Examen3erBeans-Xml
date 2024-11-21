<%-- 
    Document   : datoXML
    Created on : 13/11/2024, 07:32:06 PM
    Author     : swoke
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Películas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            h1 {
                color: #343a40;
                font-size: 2.5rem;
                font-weight: bold;
            }
            .action-buttons a {
                width: 180px;
                text-align: center;
            }
            .action-buttons a i {
                margin-right: 8px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center mb-4">
                <i class="fas fa-film"></i> Gestión de Películas
            </h1>
            
            <div class="d-flex justify-content-center gap-3 action-buttons">
                <a href="${pageContext.request.contextPath}/jsp/formulario.jsp" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Agregar Película
                </a>
                <a href="${pageContext.request.contextPath}/peliculas_servlet" class="btn btn-secondary">
                    <i class="fas fa-list"></i> Mostrar Películas
                </a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
