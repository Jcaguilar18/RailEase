    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
         <link href="https://fonts.googleapis.com/css?family=Raleway:300,700" rel="stylesheet">
         <link href="css/maxError.css" rel="stylesheet" type="text/css"/>
        <title>Login Failed</title>
    </head>
    <body>
        <div class="container">
            <img src="images/timeout.png" id="Pic">
            <h1>Timeout</h1>
            <h2>You have reached the limit of 3 tries</h2>
            
            <button onclick="window.location.href='loginSignup.jsp';" class="myButton">Try Again</button>
        </div>
    </body>
</html>
