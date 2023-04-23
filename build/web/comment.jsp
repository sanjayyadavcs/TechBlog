
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Comment"%>
<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%

    User myloginUser = (User) session.getAttribute("currentuser");
    UserDao myUserDao = new UserDao(ConnectionProvider.getConnection());
    int postId = Integer.parseInt(request.getParameter("pId"));
    CommentDao coDao = new CommentDao(ConnectionProvider.getConnection());
    ArrayList<Comment> cmList = coDao.getComments(postId);
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MMM-yyyy HH:mm:ss");
    for (Comment comt : cmList) {

        User user = myUserDao.getUserByUserId(comt.getUserId());

%>

<div class="media my-2">
    <img src="profiles/<%= user.getProfile()%>" class="mr-3 rounded-circle" alt="..." style="height: 70px;width: 70px">
    <div class="media-body">
        <h5 class="mt-0"><%= user.getName()%> <% if(myloginUser!=null && coDao.isCommentedByUser( comt.getId() , myloginUser.getId()) ){ %><button onclick="deleteComment(<%= comt.getId() %>,<%= myloginUser.getId() %>)" class="btn btn mx-2"><i class="fa fa-trash text-danger"></i></button><% } %></h5>
        <p><%= comt.getComment()%></p>
        <small class="text-muted">Posted on <%= comt.getCreatedAt().toLocalDateTime().format(myFormatObj)%></small>
    </div>
</div>

<% }%>
