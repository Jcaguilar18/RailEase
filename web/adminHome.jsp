<html>
    <head>
        <title>Admin Home</title>
        <!-- Add your CSS and JavaScript files here -->
        <link rel="stylesheet" href="css/adminHomeStyle.css">

    </head>
    <body>
        <div class="navbar">
            <ul class="navbar-left">
                <li><a href="#home"><img src="images/logoNav.png" class="logoPic"></a></li>
            </ul>
            <ul class="navbar-right">
               <li><a href="about.jsp">About Us</a></li>
                <li><a href="LogoutServlet">Log Out</a></li>
            </ul>
        </div>

        <section id="home">
            <h1>Welcome Back <%= session.getAttribute("user")%>!</h1>
            <h2>What do you want to do?</h2>
            <div class="outsideBox">
                <div class="outsideBox">
                    <a href="UseraccServlet">
                        <div class="homeChoices">
                            <img src="images/user.png" class="choicePic">
                            <h3>User Accounts</h3>
                        </div>
                    </a>
                    <a href="PriceServlet">
                        <div class="homeChoices">
                            <img src="images/price.png" class="choicePic">
                            <h3>Pricing</h3>
                        </div>
                    </a>
                    <a href="StationServlet">
                        <div class="homeChoices">
                            <img src="images/train.png" class="choicePic">
                            <h3>Railways</h3>
                        </div>
                    </a>
                    
                    <a href="TransactionServlet">
                        <div class="homeChoices">
                            <img src="images/ticket.png" class="choicePic">
                            <h3>Transactions</h3>
                        </div>
                    </a>
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