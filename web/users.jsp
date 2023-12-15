<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <title>User Lists</title>
        <!-- Add your CSS and JavaScript files here -->
        <link href="css/userListStyles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/userListStyles.css">
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

            </ul>
        </div>

        <section id="home">
            <h1>User List of RailEase</h1>
            <div id="errorMsg">${errorEmailUpdate}</div>
            <div>
                <table class="tableCont">
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Password</th>
                            <th>User Role</th>

                            <th>Update Email</th>
                            <th>Update Password</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <%
                        ResultSet results = (ResultSet) request.getAttribute("userresults");
                        if (results != null && results.next()) {
                            do {
                    %>
                    <tbody>
                        <tr>
                            <td><%=results.getString("email")%></td>
                            <td><%=results.getString("password")%></td>
                            <td><%=results.getString("userrole")%></td>

                            <td>
                                <form action="UserupdateServlet" method="post">
                                    <input type="hidden" name="email" value="<%=results.getString("email")%>">
                                    <input type="text" name="newemail" placeholder="New Email Address">
                                    <input type="submit" value="Update">
                                </form>
                            </td>
                            <td>
                                <form action="UserpassupdateServlet" method="post">
                                    <input type="hidden" name="email" value="<%=results.getString("email")%>">

                                    <input type="password" name="newpassword" placeholder="New Password">
                                    <input type="submit" value="Update">
                                </form>
                            </td>
                            <td>
                                <form action="UserdeleteServlet" method="post">
                                    <input type="hidden" name="email" value="<%=results.getString("email")%>">
                                    <input type="submit" value="Delete">
                                </form>
                            </td>

                        </tr>
                    </tbody>


                    <%
                        } while (results.next());
                    } else {
                    %>
                    <p>No users found.</p>
                    <%
                        }
                    %>
                </table>
            </div>
            <div class="buttonCont">
                <a href="adminHome.jsp"><button class="myButton">Go back?</button></a>
            </div>

            <%
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
                response.setHeader("Pragma", "no-cache"); // HTTP 1.0
                response.setHeader("Expires", "0"); // Proxies

                if (session.getAttribute("user") == null) {
                    response.sendRedirect("loginSignup.jsp");
                }
            %>
        </section>

    </body>
</html>