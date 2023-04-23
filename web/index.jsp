

<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="java.sql.*" %>

<%

    User cUser = (User) session.getAttribute("currentuser");
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
    CommentDao coDao = new CommentDao(ConnectionProvider.getConnection());

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TechBlog | Home Page</title>
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
                        <div class="container p-5">
                            <h1 class="fw-bold">Welcome to TechBlog</h1>
                            <p>Computer programming is the process of performing particular computations (or more generally, accomplishing specific computing results), usually by designing and building executable computer programs.</p>
                            <% if(cUser==null){ %>
                            <a href="registration.jsp" class="btn btn-outline-light" type="button">Stat it's Free</a>
                            <a href="login.jsp" class="btn btn-outline-light ms-2" type="button">Login</a>
                            <% }else{ %>
                            <a href="#blog" class="btn btn-outline-light" type="button">Stat it's Free</a>
                            <% } %>

                        </div>
                    </div>
                </div>
            </div>  
        </div>




        <div class="container-fluid mt-2 d-flex">

            <div id="blog" class="row justify-content-center">

                <%
                    ArrayList<Post> posts = dao.getPosts();
                    for (Post post : posts) {

                %>

                <div class="mx-3 my-4 col-md-auto" style="width: 19rem;">
                    <div class="card shadow-sm" style="height: 450px">
                        <img src="posts/<%= post.getImage()%>" class="card-img-top" alt="..." style="height: 180px">
                        <div class="card-body">
                            <h5 class="card-title"style="height: 25px;display: block;overflow: hidden;text-overflow: ellipsis;"><%= post.getTitle()%></h5>
                            <p class="card-text"><%= post.getContent().length() <= 150 ? post.getContent() : post.getContent().substring(0, 150) + "..."%></p>
                        </div>
                        <div class="card-footer bg-transparent border-0">
                            <small class="text-muted">Posted on <%= post.getCreatedAt().substring(0, 10)%></small>
                        </div>
                        <div class="card-footer">
                            <button onclick="makeLike(<%= post.getId()%>, this)" class="btn btn-outline-primary btn-sm"><i class=<% if (cUser != null && likeDao.isPostLikedByUser(post.getId(), cUser.getId())) { %>"fa fa-thumbs-up me-2"<% } else { %>"fa fa-thumbs-o-up me-2"<% }%> ></i><%= likeDao.getLikes(post.getId())%></button>
                            <button class="btn btn-outline-primary btn-sm mx-2"><i class="fa fa-commenting"> <%= coDao.getCount(post.getId())%></i></button>
                            <a href="blogdetail.jsp?id=<%= post.getId()%>" class="btn btn-sm btn-primary float-end">Read More</a>

                        </div>
                    </div>
                </div>

                <%  }%>



            </div>
        </div>


        <%@include file="profile_modal.jsp" %>

        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


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
