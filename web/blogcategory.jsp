
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>

        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 86%, 73% 85%, 48% 92%, 23% 85%, 0 87%, 0% 35%, 0 0);
            }

            .hide-scrollbar::-webkit-scrollbar {
                display: none;
            }

            .hide-scrollbar {
                scrollbar-width: none; /* Firefox */
                -ms-overflow-style: none; /* IE and Edge */
                overflow: -moz-scrollbars-none; /* Firefox */
                overflow: -ms-scrollbars-none; /* IE and Edge */
                overflow: hidden; /* Chrome and Safari */
            }

        </style>

    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

        <main class="container-fluid mt-3">
            <div class="row">
                <div class="col-md-2">
                    <h4 class="text-center card-footer card">CATEGORIES</h4>
                    <div class="list-group">
                        <button id="all" onclick="getPostByCategory(0, this)" class="cat-link list-group-item list-group-item-action" aria-current="true">All</button>


                        <%
                            for (Category cat : categories) {

                        %>
                        <button onclick="getPostByCategory(<%= cat.getId()%>, this)" class="cat-link list-group-item list-group-item-action"><%= cat.getName()%></button>

                        <%  }%>

                    </div>
                </div>
                <div class="col offset-lg-1">
                    <div class="d-flex justify-content-center">
                        <div id="loader" class="spinner-border mt-5" role="status">
                            <span class="sr-only text-center">Loading...</span>
                        </div>
                    </div>

                    <div id="list-section" class="row"style="height: 100vh; overflow-y: auto;">

                    </div>
                </div>
            </div>
        </main>





        <%@include file="profile_modal.jsp" %>

        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>

                            $(document).ready(function () {
                                getPostByCategory(0, $('#all'));
                            });



                            function getPostByCategory(catId, ref) {
                                $('#loader').show();
                                $("#list-section").hide();
                                $(".cat-link").removeClass("active");
                                $(ref).addClass("active");
                                $.ajax({
                                    url: "postbycategory.jsp",
                                    data: {cId: catId},
                                    success: function (data, textStatus, jqXHR) {
                                        console.log(data);
                                        $('#loader').hide();
                                        $("#list-section").show();
                                        $("#list-section").html(data);
                                    }
                                });

                            }



        </script>

        <script>

            function makeLike(pId, ref) {

                $.ajax({
                    url: "LikeServlet",
                    data: {pId: pId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if (data == "liked") {
                            let c = $(ref).text();
                            c++;
                            $(ref).html('<i class="fa fa-thumbs-up me-2"></i>' + c);
                        } else if (data == "removed-like") {
                            let c = $(ref).text();
                            c--;
                            $(ref).html('<i class="fa fa-thumbs-o-up me-2"></i>' + c);
                        } else if (data == "not-login") {
                            alert("Please login")
                        } else {
                            alert(data)
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }

                });


            }
        </script>

    </body>
</html>
