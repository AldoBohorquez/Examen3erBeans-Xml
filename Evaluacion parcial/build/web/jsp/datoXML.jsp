<%-- 
    Document   : datoXML
    Created on : 13/11/2024, 07:36:26 PM
    Author     : swoke
--%>

<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@page import="been.pelicula"%>
<%@page import="configuration.ConnectionBD"%>
<%@page import="java.sql.*"%>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    pelicula pelicula = null;

    try {
        ConnectionBD conn = new ConnectionBD();
        Connection connection = conn.getConnectionBD();

        String query = "SELECT * FROM Pelicula WHERE id = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            pelicula = new pelicula();
            pelicula.setId(rs.getInt("id"));
            pelicula.setNombre(rs.getString("nombre"));
            pelicula.setSynopsis(rs.getString("sinopsis"));
            pelicula.setFecha(rs.getString("fecha"));
            pelicula.setHora(rs.getString("hora"));
            pelicula.setPrecio(rs.getString("precio"));
        }

        connection.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    if (pelicula != null) {
%>
<?xml version="1.0" encoding="UTF-8"?>
<Pelicula>
    <ID><%= pelicula.getId() %></ID>
    <Nombre><%= pelicula.getNombre() %></Nombre>
    <Sinopsis><%= pelicula.getSynopsis() %></Sinopsis>
    <Fecha><%= pelicula.getFecha() %></Fecha>
    <Hora><%= pelicula.getHora() %></Hora>
    <Precio><%= pelicula.getPrecio() %></Precio>
</Pelicula>
<%
    } else {
%>
<?xml version="1.0" encoding="UTF-8"?>
<Error>No se encontró la película.</Error>
<%
    }
%>
