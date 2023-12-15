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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class StationlistServlet extends HttpServlet {

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
        HttpSession session = request.getSession();

        try {
            if (conn != null) {
                Statement stmt = conn.createStatement();
                ResultSet prices = stmt.executeQuery("SELECT station FROM PRICE");
                request.setAttribute("staresults", prices);
                Statement stmt2 = conn.createStatement();
                ResultSet prices2 = stmt2.executeQuery("SELECT station FROM PRICE");
                request.setAttribute("staresults2", prices2);

Statement stmt3 = conn.createStatement();
                ResultSet price = stmt3.executeQuery("SELECT * FROM PRICE");
                request.setAttribute("priceresults2", price);


                request.getRequestDispatcher("customer.jsp").forward(request, response);
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
