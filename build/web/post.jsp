<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    User loginuser = (User) session.getAttribute("currentuser");

    if (loginuser == null) {
        response.sendRedirect("login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Post</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <%@include file="css/css.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>
    <body style="background-color: gainsboro">
        <%@include file="normal_navbar.jsp" %>
        <div class="container my-5">
            <form id="create-post" method="Post" action="createpost" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-8 form-group offset-lg-2 card px-5 py-3 rounded">
                        <div class="accordion-header bg-dark text-light text-center rounded mb-4"><h1>CREATE POST</h1></div> 
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Select Category</label>
                            <select class="form-control" name="category" id="category">
                                <option  selected disabled>---- Select category ----</option>
                                <%
//                                    CategoryDao dao = new CategoryDao(ConnectionProvider.getConnection());
//                                    List<Category> categories = dao.getCategories();
                                    for (Category cat : categories) {

                                %>
                                <option value="<%= cat.getId()%>"><%= cat.getName()%></option>

                                <%  }%>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Post Title</label>
                            <input name="title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Enter post title">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Select Image</label>
                            <input name="image" type="file" class="form-control" id="exampleFormControlInput1" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Content</label>
                            <script>
                                $(document).ready(function () {
                                    CKEDITOR.replace('content');
                                });
                            </script>
                            <textarea id="content" name="content" type="text" rows="5" class="form-control" placeholder="Enter Content..."></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Code</label>
                            <textarea name="code" type="text" rows="4" class="form-control" placeholder="Enter code (if any)"></textarea>

                        </div>

                        <div class="mt-3 text-center">
                            <input type="submit" value="POST" class="px-5 btn btn-outline-success">
                            <input type="reset" id="configreset" style="display: none">
                        </div>
                    </div>
                </div>
            </form>
        </div>


        <script src="js/ckeditor/ckeditor.js"></script>
        <script>

                                $(document).ready(function () {
                                    console.log("loadded");
                                    $('#create-post').on('submit', function () {
                                        event.preventDefault();
                                        let form = new FormData(this);

                                        $.ajax({
                                            url: "createpost",
                                            type: 'POST',
                                            data: form,
                                            success: function (data, textStatus, jqXHR) {
                                                console.log(data);

                                                if (data == 'success') {
                                                    swal("Blog posted successfully!", "", "success", {
                                                        timer: 2000
                                                    }).then(() => {
                                                        $('#configreset').click();
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
