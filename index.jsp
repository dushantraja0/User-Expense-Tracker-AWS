<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="style.css">
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%
    response.sendRedirect("login.jsp");
%>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>