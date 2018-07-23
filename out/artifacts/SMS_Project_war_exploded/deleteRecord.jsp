<%--
  Created by IntelliJ IDEA.
  User: Dell inspiron
  Date: 2/19/2018
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Entity.Student" %>
<%@ page import="DAO.StudentDAO" %>
<%@ page import="DAO.AdmissionDateDAO" %>
<html>
<head>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:useBean id="admissionDates" class="Entity.AdmissionDates" scope="page"/>
<jsp:useBean id="student" class="Entity.Student" scope="page"/>
<%
    new AdmissionDateDAO().deleateDate(request.getParameter("rollnum"));
    new StudentDAO().deleteStudent(request.getParameter("rollnum"));
%>


</body>
</html>
