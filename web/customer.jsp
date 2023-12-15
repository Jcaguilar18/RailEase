<%-- 
    Document   : customer
    Created on : 04 14, 23, 11:42:15 AM
    Author     : juanc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>customer Page</title>
        <link href="css/customerStyles.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
        <div class="navbar">
            <ul class="navbar-left">
                <li><a href="StationlistServlet"><img src="images/logoNav.png" class="logoPic"></a></li>
            </ul>
            <ul class="navbar-right">
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="LogoutServlet">
                        <form action="LogoutServlet">
                            <input type="submit" value="Logout" class="logout">
                        </form>
                    </a>
                </li>
            </ul>
        </div>
        <section id="home">
            
            
            <h1>Welcome, <%= session.getAttribute("user")%>!</h1>
            <h2> Create a ticket</h2>

            <div class="wrapper">
                <div class="headerBox">
                    <input type="checkbox" id="collapsible-head" class="chkbox">
                    <label for="collapsible-head" class="headerLabl">
                        Railway Informations 
                        <i class="fa-solid fa-arrow-right" id="arrow"></i>
                    </label>

                    <div class="expandedBox">
                        <table class="tableCont">
                            <thead>
                                <tr>
                                    <th>Station</th>
                                    <th>Price</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ResultSet results3 = (ResultSet) request.getAttribute("priceresults2");
                                    while (results3.next()) {%>
                                <tr>
                                    <td><%=results3.getString("station")%></td>
                                    <td><%=results3.getString("price")%></td>

                                </tr>	
                                <%	}
                                %>
                            </tbody> 
                        </table>
                    </div>
                </div>
            </div>

            <div class="wrapper2">
                <div class="headerBox2">
                    <input type="checkbox" id="collapsible-head2" class="chkbox">
                    <label for="collapsible-head2" class="headerLabl">Book your Ticket here!<i class="fa-solid fa-arrow-right" id="arrow"></i></label>

                    <div class="expandedBox2">
                        <h2>Ticket Booking</h2>
                        <div id="errorMsg">${errorSameStaton}</div>
                        <form action="BookingServlet" method="post">
                            <label for="custype">Customer Type:</label>
                            <select id="custype" name="custype" required>
                                <option value="">Select Customer Type</option>
                                <option value="SENIOR">Senior</option>
                                <option value="PWD">PWD</option>
                                <option value="STUDENT">Student</option>
                                <option value="REGULAR">Regular</option>

                            </select>
                            <br>
                            <label for="origin">Origin Station:</label>
                            <select id="origin" name="origin" required>
                                <option value="">Select Origin Station</option><!-- comment -->
                                <% ResultSet results = (ResultSet) request.getAttribute("staresults"); %>
                                <% while (results.next()) {%> 
                                <option value="<%= results.getString("station")%>"><%= results.getString("station")%></option>
                                <% } %>
                            </select>
                            <br>
                            <label for="destination" id="destLbl">Destination Station:</label>
                            <select id="destination" name="destination" required>
                                <option value="">Select Destination Station</option><!-- comment -->
                                <% ResultSet results2 = (ResultSet) request.getAttribute("staresults2"); %>
                                <% while (results2.next()) {%> 
                                <option value="<%= results2.getString("station")%>"><%= results2.getString("station")%></option>
                                <% } %>
                            </select>
                            <br>    

                            <input type="submit" value="Create a ticket" class="myButton">
                        </form>
                    </div>

                </div>

            </div>

        </section>
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
