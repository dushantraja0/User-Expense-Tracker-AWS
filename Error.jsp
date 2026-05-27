<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<title>Real Error</title>
</head>
<body>

<h1>REAL ERROR</h1>

<pre>
<%
	if (exception != null) {
		exception.printStackTrace(new java.io.PrintWriter(out));
	} else {
		out.println("No exception object found.");
	}
%>
</pre>

</body>
</html>