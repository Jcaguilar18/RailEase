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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class BookingServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Double discount = 0.0;
            Double total = 0.0;
            String des = request.getParameter("destination");
            String org = request.getParameter("origin");
            if (des.equals(org)) {
                // same station validation
                request.setAttribute("errorSameStaton", "Booking Failed! Please pick two different stations!");
                RequestDispatcher rs2 = request.getRequestDispatcher("StationlistServlet");
                rs2.forward(request, response);
                return;
            }

            if (request.getParameter("custype").equals("PWD") || request.getParameter("custype").equals("SENIOR") || request.getParameter("custype").equals("STUDENT")) {
                discount = 0.10;
            }

            if (conn != null) {
                String maxTransnumQuery = "SELECT MAX(TRANSNUM) FROM TRANS_HISTORY";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(maxTransnumQuery);
                int maxTransnum = 0;
                if (rs.next()) {
                    maxTransnum = rs.getInt(1);
                }

                String originStr = request.getParameter("origin");
                String destinationStr = request.getParameter("destination");

// Define the query to retrieve the price for the origin station
                String query2 = "SELECT price FROM PRICE WHERE station = ?";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                ps2.setString(1, originStr);

// Execute the query and retrieve the price value for the origin station
                ResultSet rs1 = ps2.executeQuery();
                double originprice = 0.0; // Initialize originprice to 0.0
                if (rs1.next()) {
                    originprice = rs1.getDouble("price");
                }

// Define the query to retrieve the price for the destination station
                String query3 = "SELECT price FROM PRICE WHERE station = ?";
                PreparedStatement ps3 = conn.prepareStatement(query3);
                ps3.setString(1, destinationStr);

// Execute the query and retrieve the price value for the destination station
                ResultSet rs2 = ps3.executeQuery();
                double destinationprice = 0.0; // Initialize destinationprice to 0.0
                if (rs2.next()) {
                    destinationprice = rs2.getDouble("price");
                }
                total = destinationprice + originprice;
                double minus = discount * total;
                total = total - minus;

// Increment the transnum value
                int newTransnum = maxTransnum + 1;
                session.setAttribute("transnumber", newTransnum);

                String query = "INSERT INTO TRANS_HISTORY(EMAIL,CUSTYPE,ORIGIN,DESTINATION,DISCOUNT,TOTAL,TRANSNUM) VALUES (?,?,?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(query);

                ps.setString(1, (String) session.getAttribute("user"));
                ps.setString(2, request.getParameter("custype"));
                ps.setString(3, request.getParameter("origin"));
                ps.setString(4, request.getParameter("destination"));
                ps.setDouble(5, discount);
                ps.setDouble(6, total);
                ps.setInt(7, newTransnum);

                ps.executeUpdate();
                response.sendRedirect("ReceiptServlet");

            } else {
                response.sendRedirect("error.jsp");
                return;
            }
        } catch (SQLException sqle) {
            response.sendRedirect("errorConnection.jsp");
            return;
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
