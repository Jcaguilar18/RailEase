<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <title>Railways</title>
        <!-- Add your CSS and JavaScript files here -->
        <link href="css/railwaysStyles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/railwaysStyles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="navbar">
            <ul class="navbar-left">
                <li><a href="adminHome.jsp"><img src="images/logoNav.png" class="logoPic"></a></li>
            </ul>
            <ul class="navbar-right">
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="LogoutServlet">Log Out</a></li>
            </ul>
        </div>

        <input type="checkbox" id="check">
        <label for="check">
            <i class="fa-solid fa-bars" id="btn"></i>
            <i class="fas fa-times" id="cancel"></i>
        </label>
        <div class="sidebar">
            <header><%= session.getAttribute("user")%></header>
            <div class="sidePic"><img src="images/admin.png" id="sidePic"/></div>
            <ul>
                <li><a href="adminHome.jsp"><i class="fa-solid fa-house"></i>Home</a></li>
                <li><a href="UseraccServlet"><i class="fa-solid fa-user"></i>User Lists</a></li>
                <li><a href="PriceServlet"><i class="fa-solid fa-money-bill-1-wave"></i>Pricings</a></li>
                <li><a href="StationServlet"><i class="fa-solid fa-train"></i>Railways</a></li>
                <li><a href="TransactionServlet"><i class="fa-solid fa-ticket"></i>Transaction Logs</a></li>
                </li>

            </ul>
        </div>

        <section id="home">
            
            <h1>Railways</h1>
            <div id="errorMsg">${errorUpdateS}</div>
            <table class="tableCont">
                <thead>
                    <tr>
                        <th>Station</th>
                        <th>Price</th>
                        <th>Update</th>
                        <th>Delete</th> <!-- new column for delete button -->
                    </tr>
                </thead>
                <%
                    ResultSet results = (ResultSet) request.getAttribute("priceresults");
                    while (results.next()) {%>
                <tbody>
                    <tr>
                        <td><%=results.getString("station")%></td>
                        <td><%=results.getString("price")%></td>
                        <td>
                            <form action="StationupdateServlet" method="POST">
                                <input type="hidden" name="station" value="<%=results.getString("station")%>">
                                <input type="text" name="newname" placeholder="Enter new name">
                                <input type="submit" value="Update">
                            </form>
                        </td>
                        <td>
                            <form action="DeleteStationServlet" method="POST">
                                <input type="hidden" name="station" value="<%=results.getString("station")%>">
                                <input type="submit" value="Delete">
                            </form>
                        </td> <!-- new cell for delete button -->
                    </tr>
                </tbody>
                <%	}
                %>
                
            </table>
                
            <div id="errorMsg">${errorAddS}</div>
            
            <table class="tableCont table2">
                <thead>
                    <tr>
                        <th colspan="3"><h2 align="center">Create New Station</h2></th>

                    </tr>
                    <tr>
                        <th>Station</th>
                        <th>Price</th>
                        <th>Add</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                <form action="AddStationServlet" method="POST">
                    <td><input type="text" name="station" placeholder="Enter station name"></td>
                    <td><input type="number" name="price" placeholder="Enter price"></td>
                    <td><p align="center"><input type="submit" value="Add"></p></td>
                    </tr>
                    </tbody> 

            </table>

        </form>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0
            response.setHeader("Expires", "0"); // Proxies

            if (session.getAttribute("user") == null) {
                response.sendRedirect("loginSignup.jsp");
            }
        %>
        <div class="buttonCont">
            <a href="adminHome.jsp"><button class="myButton">Go back?</button></a>
        </div>
    </section>
</body>
</html>