<%-- 
    Document   : error
    Created on : 04 18, 23, 11:08:52 PM
    Author     : juanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/wrongCredsStyles.css" rel="stylesheet" type="text/css"/>
         <link href="https://fonts.googleapis.com/css?family=Raleway:300,700" rel="stylesheet">
        <title>Wrong Credentials!</title>
    </head>
    <body>
        <div class="container">
            <img src="images/wrongCreds.png" id="Pic">
            <h1>Login Failed!</h1>
            <h2>Wrong Credentials! Check Email and Password!</h2>
            
            <button onclick="window.location.href='loginSignup.jsp';" class="myButton">Try Again</button>
        </div>
    </body>
</html>
