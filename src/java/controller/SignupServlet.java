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
public class SignupServlet extends HttpServlet {

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
            String pass = request.getParameter("password");
            String email = request.getParameter("username");
            String pass2 = request.getParameter("password2");
            if (pass.equals(pass2)) {
                if (conn != null) {
                    String query = "SELECT * FROM USERS WHERE EMAIL=?";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, email);
                    if (ps.executeQuery().next()) {
                        // email already exists
                        request.setAttribute("errorMsg", "Email is already Registered!");
                        RequestDispatcher rs = request.getRequestDispatcher("loginSignup.jsp");
                        rs.forward(request, response);
                        return;
                    } else {
                        query = "INSERT INTO USERS(EMAIL,PASSWORD,USERROLE) VALUES (?,?,?)";
                        ps = conn.prepareStatement(query);
                        ps.setString(1, email);
                        ps.setString(2, pass);
                        ps.setString(3, "guest");
                        ps.executeUpdate();
                        response.sendRedirect("loginSignup.jsp");
                    }
                } else {
                    response.sendRedirect("error.jsp");
                    return;
                }
            } else {
                request.setAttribute("errorPass", "Password is not the same!");
                RequestDispatcher rs = request.getRequestDispatcher("loginSignup.jsp");
                rs.forward(request, response);
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
