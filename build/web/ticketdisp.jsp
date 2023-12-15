<%--
    Document   : ticket
    Created on : 04 18, 23, 11:25:37 PM
    Author     : juanc
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="css/ticketdispStyles.css" rel="stylesheet" type="text/css"/>
        <title>RailEase Ticket</title>
    </head>
    <body>
        
        <%
                   ResultSet results = (ResultSet) request.getAttribute("receipt");
                    while (results.next()) { %>
                        
        <div class="container">
            <div class="ticket ticket-left">
                <h1>RailEase Railways</h1>
                <div class="cusName">
                    <h2><%=results.getString("email")%></h2>
                    <span>Email</span>
                </div>
                <div class="price">
                    <h2><%=results.getString("total")%></h2>
                    <span>price</span>
                </div>
                
                <div class="time">
                    <%Date current_Date = new Date();%>
                    <h2><%= current_Date%></h2>
                    <span>time</span>
                </div>
                
                <div class="origin">
                    <h2><%=results.getString("origin")%></h2>
                    <span>Origin</span>
                </div>
                
                
                <div class="destination">
                    <h2><%=results.getString("destination")%></h2>
                    <span>Destination</span>
                </div>
            </div>


            <div class="ticket ticket-right">
                <div class="eye">
                    <img src="images/landingPic.png" alt=""/>
                </div>
                <div class="number">
                    <h3><%=results.getString("transnum")%></h3>
                    <span>Transaction Number</span>
                </div>
                <div class="barcode"></div>
            </div>
             <div class="buttonCont">
                <a href="StationlistServlet"><button class="myButton">Book Again</button></a> 
            </div>
                    
                    
        </div>
        <%	}
        %>
         <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies

        if (session.getAttribute("user") == null) {
            response.sendRedirect("loginSignup.jsp");
        }
    %>
    </body>
</html>
