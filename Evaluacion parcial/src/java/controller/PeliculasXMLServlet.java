/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import been.pelicula;
import configuration.ConnectionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author swoke
 */
@WebServlet(name = "PeliculasXMLServlet", urlPatterns = {"/peliculasXML"})
public class PeliculasXMLServlet extends HttpServlet {

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
            out.println("<title>Servlet PeliculasXMLServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PeliculasXMLServlet at " + request.getContextPath() + "</h1>");
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
            
            int id = Integer.parseInt(idStr);
            pelicula pelicula = null;

            String sql = "SELECT * FROM Pelicula WHERE id = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                pelicula = new pelicula();
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
                response.setContentType("application/xml");
                PrintWriter out = response.getWriter();
                out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                out.println("<pelicula>");
                out.println("<id>" + pelicula.getId() + "</id>");
                out.println("<nombre>" + pelicula.getNombre() + "</nombre>");
                out.println("<synopsis>" + pelicula.getSynopsis() + "</synopsis>");
                out.println("<fecha>" + pelicula.getFecha() + "</fecha>");
                out.println("<hora>" + pelicula.getHora() + "</hora>");
                out.println("<precio>" + pelicula.getPrecio() + "</precio>");
                out.println("</pelicula>");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Película no encontrada");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al generar XML.");
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
        processRequest(request, response);
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
