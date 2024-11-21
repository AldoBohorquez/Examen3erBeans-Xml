<%-- 
    Document   : datoXML
    Created on : 13/11/2024, 07:38:22 PM
    Author     : swoke
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Pelicula" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de Película</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            max-width: 700px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #343a40;
            font-size: 2rem;
            margin-bottom: 20px;
        }
        .details p {
            font-size: 1.1rem;
            margin-bottom: 10px;
        }
        .details strong {
            color: #555;
        }
        .no-data {
            text-align: center;
            color: #dc3545;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .icon {
            color: #007bff;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-film icon"></i> Detalles de la Película</h1>
        
        <jsp:useBean id="peliculaBean" class="model.Pelicula" scope="request" />
        
        <div class="details">
        <%
            if (peliculaBean != null) {
        %>
            <p><strong>ID:</strong> <%= peliculaBean.getId() %></p>
            <p><strong>Nombre:</strong> <%= peliculaBean.getNombre() %></p>
            <p><strong>Sinopsis:</strong> <%= peliculaBean.getSynopsis() %></p>
            <p><strong>Fecha:</strong> <%= peliculaBean.getFecha() %></p>
            <p><strong>Hora:</strong> <%= peliculaBean.getHora() %></p>
            <p><strong>Precio:</strong> <span class="text-success">$<%= peliculaBean.getPrecio() %></span></p>
        <%
            } else {
        %>
            <p class="no-data">No se encontró la información de la película.</p>
        <%
            }
        %>
        </div>

        <div class="text-center mt-4">
            <a href="javascript:history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Volver
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
