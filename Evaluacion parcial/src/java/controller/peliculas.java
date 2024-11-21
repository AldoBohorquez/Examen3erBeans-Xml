/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import configuration.ConnectionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pelicula;

/**
 *
 * @author swoke
 */
@WebServlet(name = "peliculas", urlPatterns = {"/peliculas_servlet"})
public class peliculas extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet peliculas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet peliculas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");

        try {
            ConnectionBD connectionBD = new ConnectionBD();
            Connection connection = connectionBD.getConnectionBD();

            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                Pelicula pelicula = null;

                String sql = "SELECT * FROM Pelicula WHERE id = ?";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setInt(1, id);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    pelicula = new Pelicula();
                    pelicula.setId(rs.getInt("id"));
                    pelicula.setNombre(rs.getString("nombre"));
                    pelicula.setSynopsis(rs.getString("synopsis"));
                    pelicula.setFecha(rs.getString("fecha"));
                    pelicula.setHora(rs.getString("hora"));
                    pelicula.setPrecio(rs.getString("precio"));
                }

                rs.close();
                pstmt.close();
                connection.close();

                if (pelicula != null) {
                    request.setAttribute("peliculaBean", pelicula);
                    request.getRequestDispatcher("/jsp/datoBeen.jsp").forward(request, response);
                } else {
                    response.sendRedirect("mostrar.jsp?error=notfound");
                }
            } else {
                ArrayList<Pelicula> peliculasList = new ArrayList<>();
                String sql = "SELECT * FROM Pelicula";
                PreparedStatement pstmt = connection.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    Pelicula pelicula = new Pelicula();
                    pelicula.setId(rs.getInt("id"));
                    pelicula.setNombre(rs.getString("nombre"));
                    pelicula.setSynopsis(rs.getString("synopsis"));
                    pelicula.setFecha(rs.getString("fecha"));
                    pelicula.setHora(rs.getString("hora"));
                    pelicula.setPrecio(rs.getString("precio"));
                    peliculasList.add(pelicula);
                }

                rs.close();
                pstmt.close();
                connection.close();

                request.setAttribute("peliculasList", peliculasList);
                request.getRequestDispatcher("/jsp/mostrar.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al recuperar la película. Detalles: " + e.getMessage());
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El ID de la película no es válido. Detalles: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inesperado: " + e.getMessage());
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nombre = request.getParameter("nombre");
        String synopsis = request.getParameter("synopsis");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String precio = request.getParameter("precio");

        try ( PrintWriter out = response.getWriter()) {
            ConnectionBD connectionBD = new ConnectionBD();
            Connection connection = connectionBD.getConnectionBD();

            String sql = "INSERT INTO Pelicula (nombre, synopsis, fecha, hora, precio) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setString(2, synopsis);
            pstmt.setString(3, fecha);
            pstmt.setString(4, hora);
            pstmt.setString(5, precio);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<p>Pelicula registrada exitosamente!</p>");
            } else {
                out.println("<p>Error al registrar la película.</p>");
            }

            pstmt.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
