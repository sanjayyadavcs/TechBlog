
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">TechBlog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="blogcategory.jsp">Categories</a>
                </li>

                <%
                    CategoryDao cdao = new CategoryDao(ConnectionProvider.getConnection());
                    List<Category> categories = cdao.getCategories();

//                            for (Category cat : categories) {

                %>



                <li class="nav-item">
                    <a class="nav-link" href="post.jsp"> <span class="fa fa-edit"></span> Post</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AboutUs.jsp">AboutUs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ContactUs.jsp">ContactUs</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <%                User loginUser = (User) session.getAttribute("currentuser");

                if (loginUser == null) {


            %>
            <div class="d-flex mx-3">
                <a href="login.jsp" class="btn btn-outline-warning mx-2" type="submit">Login</a>
                <a href="registration.jsp" class="btn btn-outline-warning" type="submit">Register</a>

            </div>

            <% } else {%>
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item mx-2">
                    <a class="nav-link active" aria-current="page" data-bs-toggle="modal" href="#" data-bs-target="#exampleModal"/><span class="fa fa-user-circle"></span>  <%= loginUser.getName()%></a>
                </li>
                <li class="nav-item">
                    <a href="LogoutServlet" class="btn btn-danger" aria-current="page" >Logout</a>
                </li>
            </ul>
            <% }%>
        </div>
    </div>
</nav>
