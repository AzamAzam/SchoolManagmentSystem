<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 06-Feb-18
  Time: 02:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="true" %>
<html>
<head>

</head>
<body>
<p>Oops! There is an error </p>
<%
    if (exception instanceof SQLException) {
%>
<h3>SQL Exception</h3>
<%
} else if (exception instanceof IndexOutOfBoundsException) {
%>
<h3>Index out of Bound Exception</h3>
<%
} else if (exception instanceof IOException) {
%>
<h3>IO Exception</h3>
<%
    }
    if (exception instanceof NullPointerException) {
%>
<h3>Null Pointer Exception </h3>
<%
    }
    if (exception instanceof ClassNotFoundException) {
%>
<h3>Class Not found Exception </h3>
<%
    }
    if (exception instanceof ArrayIndexOutOfBoundsException) {
%>
<h3>Array Index of Bound Exception </h3>
<%
    }
    if (exception instanceof ArithmeticException) {
%>
<h3>Arithmetic Exception </h3>
<%
    }
    if (exception instanceof RuntimeException) {
%>
<h3>Run Time Exception </h3>
<%
    }
    exception.getMessage();
%>

</body>
</html>
