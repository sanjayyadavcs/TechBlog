<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%

    User user = (User) session.getAttribute("currentuser");

    if (user != null) {
        response.sendRedirect("profile.jsp");
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <body style="background-color: gray">
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center" style="height: 80vh">

            <div class="container">
                <div class="row">
                    <div class=" card col-lg-4 offset-lg-4">
                        <h3 class="card-title p-1 m-4 d-flex justify-content-center fw-bold f-1">Login</h3>
                        <div class="card-body">
                            <form id="login-form" action="LoginServlet" method="POST">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <button type="submit"  class="btn btn-success">Login</button>
                            </form>

                        </div>

                    </div>



                </div>
            </div>

        </main>


        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
         <script src="js/myjs.js" type="text/javascript"></script>

         <script>
             
             
             $(document).ready(function () {
    console.log("loadded");
    $('#login-form').on('submit', function () {
        event.preventDefault();
        let form = new FormData(this);

        $.ajax({
            url: "LoginServlet",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data);

                if (data == 'done') {
                    swal("Login Successfully !!", "We are redirecting to profile page", "success", {
                        buttons: false,
                        timer: 2000
                    }).then(() => {
                        window.location = 'index.jsp';
                    });
                } else {
                    swal(data, "", "error");
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
            },
            processData: false,
            contentType: false

        });

    });


});
             
             
         </script>
    </body>
</html>
