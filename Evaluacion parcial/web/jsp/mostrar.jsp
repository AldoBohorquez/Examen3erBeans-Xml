<%-- 
    Document   : datoXML
    Created on : 13/11/2024, 07:35:20 PM
    Author     : swoke
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pelicula"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Películas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            h1 {
                margin-top: 20px;
                margin-bottom: 20px;
                text-align: center;
                color: #343a40;
            }
            .table-container {
                margin-top: 30px;
            }
            .btn i {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container table-container">
            <h1>🎥 Lista de Películas 🎬</h1>
            <table class="table table-hover table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th style="text-align: center;">ID</th>
                        <th>Nombre</th>
                        <th style="text-align: center;">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Pelicula> peliculasList = (ArrayList<Pelicula>) request.getAttribute("peliculasList");
                        if (peliculasList != null && !peliculasList.isEmpty()) {
                            for (Pelicula pelicula : peliculasList) {
                    %>
                    <tr>
                        <td style="text-align: center;"><%= pelicula.getId()%></td>
                        <td><%= pelicula.getNombre()%></td>
                        <td style="text-align: center;">
                            <a href="peliculas_servlet?id=<%= pelicula.getId()%>" class="btn btn-info btn-sm">
                                <i class="fas fa-eye"></i> Mostrar Bean
                            </a>
                            <a href="peliculasXML?id=<%= pelicula.getId()%>" class="btn btn-warning btn-sm">
                                <i class="fas fa-file-alt"></i> Mostrar XML
                            </a>
                            <a href="peliculasXML?id=<%= pelicula.getId()%>" class="btn btn-success btn-sm" download="pelicula_<%= pelicula.getId()%>.xml">
                                <i class="fas fa-download"></i> Descargar XML
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="3" style="text-align: center;">No hay películas para mostrar.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="d-flex justify-content-center">
                <a href="formulario.jsp" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Agregar Nueva Película
                </a>
            </div>
        </div>
    </body>
</html>
