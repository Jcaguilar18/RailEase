/*
 * Juan Carlos M. Aguilar
 * 1CSC
 * Description
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author juanc
 */
public class AddStationServlet extends HttpServlet {

    Connection conn;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        try {
            Class.forName(getServletContext().getInitParameter("jdbcClassName"));

            String username = getServletContext().getInitParameter("dbUserName");
            String password = getServletContext().getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(getServletContext().getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(getServletContext().getInitParameter("dbHostName"))
                    .append(":")
                    .append(getServletContext().getInitParameter("dbPort"))
                    .append("/")
                    .append(getServletContext().getInitParameter("databaseName"));
            conn = DriverManager.getConnection(url.toString(), username, password);

        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String priceString = request.getParameter("price");
            double price = Double.parseDouble(priceString);
            if (conn != null) {
                String station = request.getParameter("station").toUpperCase();
                String query = "SELECT * FROM price WHERE STATION = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, station);
                if (ps.executeQuery().next()) {
                    // Station already exists in the database
                    request.setAttribute("errorAddS", "Adding Error! Station already exists!");
                    RequestDispatcher rs = request.getRequestDispatcher("StationServlet");
                    rs.forward(request, response);
                    return;
                } else {
                    // Station doesn't exist, insert new record
                    query = "INSERT INTO price(STATION,PRICE) VALUES (?,?)";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, station);
                    ps.setDouble(2, price);
                    ps.executeUpdate();
                    response.sendRedirect("StationServlet");
                }
            }
        } catch (SQLException sqle) {
            response.sendRedirect("error.jsp");
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
        processRequest(request, response);
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
