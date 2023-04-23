<%@page import="com.tech.blog.entities.User"%>
<%

    User user = (User) session.getAttribute("currentuser");

//    if (user == null) {
//        response.sendRedirect("login.jsp");
//    }
//    
    if (user != null) {

%>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-dark text-light text-center">
                <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
                <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="view-profile" class="container">
                    <div  class="text-center">
                        <img class="img-fluid" src="profiles/<%= user.getProfile()%>" width="150px">
                        <h3 class="mt-2"><%= user.getName()%></h3>
                    </div>

                    <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">Name: </th>
                                <td><%= user.getName()%></td>
                            </tr>
                            <tr>
                                <th scope="row">Email: </th>
                                <td><%= user.getEmail()%></td>
                            </tr>
                            <tr>
                                <th scope="row">Gender: </th>
                                <td><%= user.getGender().toUpperCase() %></td>
                            </tr>
                            <tr>
                                <th scope="row">About: </th>
                                <td><%= user.getAbout()%></td>
                            </tr>
                            <tr>
                                <th scope="row">Register Date: </th>
                                <td><%= user.getDate().toString() %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div id="update-profile" class="container"style="display: none">
                    <div  class="text-center">
                        <img class="img-fluid" src="profiles/<%= user.getProfile()%>" width="150px">
                    </div>
                    <form class="mt-3" action="EditProfileServlet" method="POST" enctype="multipart/form-data">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">Name: </th>
                                    <td> <input type="text" name="user_name" class="form-control"value="<%= user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email: </th>
                                    <td> <p type="text" class="form-control"><%= user.getEmail()%></p>
                                </tr>
                                <tr>
                                    <th scope="row">Gender: </th>
                                    <td>
                                        <div class="d-flex">
                                            <div class="form-check">
                                                <input <% if (user.getGender().toLowerCase().equals("male")) { %>checked="true" <% } %> class="form-check-input" type="radio" name="gender" value="male" id="male">
                                                <label class="form-check-label" for="male">
                                                    Male
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input <% if (user.getGender().toLowerCase().equals("female")) { %>checked="true" <% }%> class="form-check-input" type="radio" name="gender" value="female" id="female">
                                                <label class="form-check-label" for="female">
                                                    Female
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">About: </th>
                                    <td><textarea cols="2" type="text" name="about" class="form-control" value="j"><%= user.getAbout()%></textarea>
                                </tr>
                                <tr>
                                    <th scope="row">Profile Picture: </th>
                                    <td><input type="file" name="profile" class="form-control"  accept="image/*">
                                </tr>
                            </tbody>
                        </table>

                        <div class="text-center">
                            <button  type="submit" class="btn btn-primary px-5">Save</button>
                        </div>

                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="updatebtn" onclick="updateProfile()" type="button" class="btn btn-primary">Update Profile</button>
            </div>
        </div>
    </div>
</div>

<% }%>