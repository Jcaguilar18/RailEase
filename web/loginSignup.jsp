<html>
    <head>
        <title>Account</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">

        <link href="css/loginSignupStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="section">
            <div class="container">
                <div class="row full-height justify-content-center">
                    <div class="col-12 text-center align-self-center py-5">
                        <div class="section pb-5 pt-5 pt-sm-2 text-center">
                            <h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
                            <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                            <label for="reg-log"></label>
                            <div class="card-3d-wrap mx-auto">
                                <div class="card-3d-wrapper">
                                    <div class="card-front">
                                        <div class="center-wrap">
                                            <div class="section text-center">
                                                <h4 class="mb-4 pb-3">Log In</h4>

                                                <div class="form-group">
                                                    <form action="LoginServlet" method="post">
                                                        <input type="email" name="username" class="form-style" placeholder="Email">

                                                        </div>	
                                                        <div class="form-group mt-2">
                                                            <input type="password" name="password" class="form-style" placeholder="Password">

                                                        </div>

                                                        <input type="submit"class="btn mt-4" value="Login">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-back">
                                            <div class="center-wrap">
                                                <div class="section text-center">
                                                    <h4 class="mb-3 pb-3">Sign Up</h4>
                                                    <div id="errorMsg">${errorMsg}</div>
                                                    <div id="errorMsg">${errorPass}</div>

                                                    <form action="SignupServlet" method="post">

                                                        <div class="form-group mt-2">
                                                            <input type="email" class="form-style" name="username" placeholder="Email" required>

                                                        </div>
                                                        <div class="form-group mt-2">
                                                            <input type="password" name="password" class="form-style" placeholder="Password" required>

                                                        </div>
                                                        <div class="form-group mt-2">
                                                            <input type="password" name="password2" class="form-style" placeholder="Confirm Password">

                                                        </div>	

                                                        <input type="submit" class="btn mt-4" value="Register">
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>