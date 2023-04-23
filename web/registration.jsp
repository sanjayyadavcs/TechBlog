<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>



    </head>
    <body style="background-color: gray">
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center my-3">

            <div class="container">
                <div class="row">
                    <div class=" card col-lg-4 offset-lg-4">
                        <h3 class="card-title p-1 m-4 d-flex justify-content-center fw-bold f-1">Register</h3>
                        <div class="card-body">
                            <form id="reg-form" method="POST">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter name" >
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password"">
                                </div>
                                <div class="mb-3">
                                    <label for="gender" class="form-label">Select Gender</label>
                                    <br>
                                    <div class="d-flex">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gender" value="male" id="male">
                                            <label class="form-check-label" for="male">
                                                Male
                                            </label>
                                        </div>
                                        <div class="form-check ms-3">
                                            <input class="form-check-input" type="radio" name="gender" value="female" id="female">
                                            <label class="form-check-label" for="female">
                                                Female
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">About</label>
                                    <textarea name="about" class="form-control" id="name" placeholder="Someting about your self" ></textarea>
                                </div>
                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Accept terms and condition</label>
                                </div>
                                <button id="submitbtn" type="submit" class="btn btn-success">Register</button>
                            </form>

                        </div>

                    </div>



                </div>
            </div>

        </main>


        <!--javascript-->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


        <script>

                                    $(document).ready(function () {
                                        console.log("loadded");
                                        $('#reg-form').on('submit', function () {
                                            event.preventDefault();
                                            let form = new FormData(this);

                                            $.ajax({
                                                url: "RegistrationServlet",
                                                type: 'POST',
                                                data: form,
                                                success: function (data, textStatus, jqXHR) {
                                                    console.log(data);

                                                    if (data === 'done') {
//                                swal("Account created successfully ..we are redirecting to login page")
                                                        swal("Account created successfully!", "we are redirecting to login page!", "success")
                                                                .then((value) => {
                                                                    window.location = 'login.jsp';
                                                                });
                                                    } else {
                                                        swal(data, "", "info");
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

