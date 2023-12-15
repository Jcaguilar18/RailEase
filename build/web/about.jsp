<%-- 
    Document   : about
    Created on : 04 14, 23, 11:15:16 AM
    Author     : juanc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About RailEase</title>

        <link href="css/about.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="landingContents">
            <img src="images/logoNav.png" id="landingPic">
            <h1>About Us</h1>
            <h2>Information</h2>

            <div class="wrapper">
                <div class="headerBox">
                    <input type="checkbox" id="collapsible-head" class="chkbox">
                    <label for="collapsible-head" class="headerLabl">
                        What is RailEase?
                        <i class="fa-solid fa-arrow-right" id="arrow"></i>
                    </label>

                    <div class="expandedBox">
                        <h2>About RailEase.</h2>
                        <p>
                            Welcome to our railway ticketing system! Our system is designed to make your train travel experience easy, convenient, and hassle-free. 
                            Whether you are traveling for business or leisure, our ticketing system offers a variety of options to suit your needs.
                            With our system, you can easily search for train schedules, routes, and fares, and purchase your tickets online. 
                            We offer both one-way and round-trip tickets, and you can choose from a range of classes, including economy, business, and first class.
                            Our system also provides you with real-time updates on train delays or cancellations, ensuring that you are always informed about any changes to your travel plans. 
                            And if you need assistance with your ticket or have any questions, our customer service team is available 24/7 to help you.
                            We are committed to providing you with a seamless and enjoyable train travel experience. 
                            So why wait? Book your train tickets with us today and enjoy the convenience and comfort of traveling by train.
                        </p>

                    </div>
                </div>
            </div>

            <div class="wrapper2">
                <div class="headerBox2">
                    <input type="checkbox" id="collapsible-head2" class="chkbox">
                    <label for="collapsible-head2" class="headerLabl">Our Team<i class="fa-solid fa-arrow-right" id="arrow"></i></label>

                    <div class="expandedBox2">
                        <h2>Creator of RailEase</h2>

                        <div class="outsideBox">

                            <div class="homeChoices">
                                <img src="images/jc.jpg" class="choicePic">
                                <h3>Juan Carlos Aguilar</h3>
                                <h4>Developer</h4>
                                <h4>University of Santo Tomas - CICS</h4>
                            </div>


                            <div class="homeChoices">
                                <img src="images/jerome.png" class="choicePic">
                                <h3>Jerome Anthony Mangalus</h3>
                                <h4>Developer</h4>
                                <h4>University of Santo Tomas - CICS</h4>
                            </div>


                            <div class="homeChoices">
                                <img src="images/micah.jpg" class="choicePic">
                                <h3>Micah Tayco</h3>
                                <h4>Developer</h4>
                                <h4>University of Santo Tomas - CICS</h4>
                            </div>




                        </div>
                    </div>
                </div>
            </div>


            <%--
            <p>Welcome to our railway ticketing system! Our system is designed to make your train travel experience easy, convenient, and hassle-free. Whether you are traveling for business or leisure, our ticketing system offers a variety of options to suit your needs.</p>

            <p>With our system, you can easily search for train schedules, routes, and fares, and purchase your tickets online. We offer both one-way and round-trip tickets, and you can choose from a range of classes, including economy, business, and first class.</p>

            <p>Our system also provides you with real-time updates on train delays or cancellations, ensuring that you are always informed about any changes to your travel plans. And if you need assistance with your ticket or have any questions, our customer service team is available 24/7 to help you.</p>

            <p>We are committed to providing you with a seamless and enjoyable train travel experience. So why wait? Book your train tickets with us today and enjoy the convenience and comfort of traveling by train.</p>
            --%>
            <a href="index.jsp"><button class="myButton">Go back?</button></a>
        </div>
    </body>
</html>
