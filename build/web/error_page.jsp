<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something ! went wrong</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <div class="text-center">
            <img class="mx-auto mt-5" src="img/error.jpg" height="500wh"/>
            <h4 class="text-center">Sorry ! Some thing went wrong.....</h4>
            <%= exception %>
            <a class="btn btn-primary mt-2" href="index.jsp">Home</a>
        </div>
    </body>
</html>
