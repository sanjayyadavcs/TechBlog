<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="com.tech.blog.entities.Comment"%>
<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.helper.StringHelper"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>


<%

    int id = Integer.parseInt(request.getParameter("id"));
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
    User currentUser = (User) session.getAttribute("currentuser");
    Post post = dao.getPostById(id);

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= dao.getPostById(id).getTitle()%></title>
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>

        <div class="row mb-5">
            <div class="container-fluid mt-4 col-lg-6 offset-lg-1">
                <h1 class=""><%= post.getTitle()%></h1>
                <h6 class="mt-4 mb-2">Written by <%= userDao.getUserByUserId(post.getUserId()).getName()%></h6>


                <button title="like the post" onclick="makeLike(<%= post.getId()%>, this)" class="btn btn-outline-primary btn-sm my-3"><i class=<% if (currentUser != null && likeDao.isPostLikedByUser(post.getId(), currentUser.getId())) { %>"fa fa-thumbs-up me-2"<% } else { %>"fa fa-thumbs-o-up me-2"<% }%> ></i><%= likeDao.getLikes(post.getId())%></button>
                <a href="#comment" title="Do comments on post" class="btn btn-outline-primary btn-sm mx-2"><i class="fa fa-commenting px-2"> </i></a>


                <p><%= post.getContent().substring(0, StringHelper.getIndexofFullStop(post.getContent(), 250))%></p>

                <img src="posts/<%= post.getImage()%>" class="card-img-top mt-3" alt="..." style="max-height: 65vh">

                <p class="mt-4"><%= post.getContent().length() < 251 ? post.getContent() : post.getContent().substring(StringHelper.getIndexofFullStop(post.getContent(), 250))%></p>

                <%
                    if (!post.getCode().trim().isEmpty()) {
                %>
                <div class="container bg-dark rounded mt-3 p-3">
                    <div class="row">
                        <p class="text-white">Code</p>
                        <div class="col-md-12">
                            <div class="pre px-5">
                                <code>
                                    <%= post.getCode()%>
                                </code>
                            </div>
                        </div>
                    </div>
                </div>
                <%  }%>


                <!--commenting-->



                <div id="comment">
                    <div class="row">
                        <div class="col-md-8">
                            <h2>Leave a comment</h2>
                            <form id="comment-form">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" value="<%=  currentUser != null ? currentUser.getName() : ""%>" required disabled>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Comment</label>
                                    <textarea class="form-control" id="comment" name="comment" rows="5" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary mt-2">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>




                <div class="mt-2">
                    <h2>Comments</h2>
                    <hr>

                    <div id="comment-section" style="height: 300px; overflow-y: auto;"></div>

                </div>



            </div>

            <div class="container-fluid mt-4 col-3">


                <h4 class="card-footer card text-center">Related Post</h4>
                <%
                    ArrayList<Post> postslist = dao.getRelatedPost(post.getCategoryId(), post.getId());
                %>

                <% if (postslist.isEmpty()) { %>
                <h5 class="text-center mt-5">No other post</h5>
                <% }%>

                <% for (Post postes : postslist) {%> 
                <div class="mx-3 my-4 col-md-auto" style="width: 19rem;">
                    <div class="card shadow-sm">
                        <img src="posts/<%= postes.getImage()%>" class="card-img-top" alt="..." style="height: 180px">
                        <div class="card-body">
                            <h5 class="card-title"style="height: 25px;display: block;overflow: hidden;text-overflow: ellipsis;"><%= postes.getTitle()%></h5>
                            <p class="card-text"><%= postes.getContent().length() <= 150 ? postes.getContent() : postes.getContent().substring(0, 150) + "..."%></p>
                        </div>
                        <div class="card-footer bg-transparent border-0">
                            <small class="text-muted">Posted on <%= postes.getCreatedAt().substring(0, 10)%></small>
                        </div>
                        <div class="card-footer">
                            <button onclick="makeLike(<%= post.getId()%>, this)" class="btn btn-outline-primary btn-sm"><i class=<% if (currentUser != null && likeDao.isPostLikedByUser(postes.getId(), currentUser.getId())) { %>"fa fa-thumbs-up me-2"<% } else { %>"fa fa-thumbs-o-up me-2"<% }%> ></i><%= likeDao.getLikes(postes.getId())%></button>
                            <button class="btn btn-outline-primary btn-sm mx-2"><i class="fa fa-commenting"></i></button>
                            <a href="blogdetail.jsp?id=<%= postes.getId()%>" class="btn btn-sm btn-primary float-end">Read More</a>

                        </div>
                    </div>
                </div>

                <%  }%>


            </div>
        </div>

        <!--javascript-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <%@include file="profile_modal.jsp" %>
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
                                                alert("Login please");
                                            } else {
                                                alert(data);
                                            }
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {

                                        }

                                    });


                                }
        </script>


        <script>
            $(document).ready(function () {

                getComments(<%= post.getId()%>);

                $('#comment-form').submit(function (event) {
                    event.preventDefault(); // Prevent page from reloading
                    var form = $(this);
                    var formData = form.serialize();
                    formData += '&pId=' + <%= post.getId()%>;
                    $.ajax({
                        type: 'POST',
                        url: 'comment', // URL for server-side script to handle form submission
                        data: formData,
                        success: function (response) {
                            // Display comment on page
                            console.log(response);
                            form.trigger('reset');
                            if (response == "success") {
                                getComments(<%= post.getId()%>);
                            } else {
                                alert("Login Please");
                            }

                        },
                        error: function (xhr) {
                            // Handle errors
                        }
                    });
                });
            });



            function getComments(pId) {
                $.ajax({
                    url: "comment.jsp",
                    data: {pId: pId},
                    success: function (data, textStatus, jqXHR) {
//                        console.log(data);
                        $("#comment-section").html(data);
                    }
                });
            }



            function deleteComment(commentId, uId) {

                $.ajax({

                    url: "DeleteCommentServlet",
                    type: 'POST',
                    data: {commentId: commentId, uId: uId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        getComments(<%= post.getId()%>);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                    }


                });


            }


        </script>


    </body>
</html>
