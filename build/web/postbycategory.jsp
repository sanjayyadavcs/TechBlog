<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.*"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.*"%>
<div class="row">

    <%  User cUser = (User) session.getAttribute("currentuser");
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
        CommentDao coDao = new CommentDao(ConnectionProvider.getConnection());
        int catId = Integer.parseInt(request.getParameter("cId"));
        ArrayList<Post> posts = new ArrayList<>();
        Thread.sleep(500);
        if (catId == 0) {
            posts = dao.getPosts();

        } else {
            posts = dao.getPostByCatId(catId);
        }
        
        if(posts.isEmpty()){
        out.print("<h4 class='text-center'>No blog available for this category</h4>");
        return;
        }
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
