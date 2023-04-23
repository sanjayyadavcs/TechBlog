
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 86%, 73% 85%, 48% 92%, 23% 85%, 0 87%, 0% 35%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <%
            Message msg = (Message) session.getAttribute("msg");
            if (msg != null) {
        %>
        <div class="<%= msg.getCssClass()%> m-0 alert-dismissible fade show" role="alert">
            <%= msg.getMessage()%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%
            }
            session.removeAttribute("msg");
        %>
        <div class="container-fluid m-0 p-0 banner-background">
            <div class="row align-items-md-stretch">
                <div class="col-md-12">
                    <div class="h-100 p-5 text-white bg-dark">
                        <div class="container p-5 text-center">
                            <h1 class="fw-bold" style="font-size: 100px">About Us</h1>
                            <p class="justify-content-center text-center">Computer programming is the process of performing particular computations (or more generally, accomplishing specific computing results),usually by designing and building executable computer programs.usually by designing and building executable computer programs</p>
<!--                            <a href="registration.jsp" class="btn btn-outline-light" type="button">Stat it's Free</a>
                            <a href="login.jsp" class="btn btn-outline-light ms-2" type="button">Login</a>-->
                        </div>
                    </div>
                </div>
            </div>  
        </div>


        <div class="container-fluid text-center m-0">

            <p>
                ToyFight’s about page is super creative, which makes perfect sense for an award-winning design agency. 

                This about us page example is a little different than the rest on this list. It has very little content on it because after all, it’s all about the design. 

                The co-founders, Jonny and Leigh, are represented by action figures. Each of them has their own bio where you can learn more about them:

                ToyFight’s about page is super creative, which makes perfect sense for an award-winning design agency. 

                This about us page example is a little different than the rest on this list. It has very little content on it because after all, it’s all about the design. 

                The co-founders, Jonny and Leigh, are represented by action figures. Each of them has their own bio where you can learn more about them:

                ToyFight’s about page is super creative, which makes perfect sense for an award-winning design agency. 

                This about us page example is a little different than the rest on this list. It has very little content on it because after all, it’s all about the design. 

                The co-founders, Jonny and Leigh, are represented by action figures. Each of them has their own bio where you can learn more about them:


                ToyFight’s about page is super creative, which makes perfect sense for an award-winning design agency. 

                This about us page example is a little different than the rest on this list. It has very little content on it because after all, it’s all about the design. 

                The co-founders, Jonny and Leigh, are represented by action figures. Each of them has their own bio where you can learn more about them:
            </p>

        </div>














        <%@include file="profile_modal.jsp" %>

        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>

