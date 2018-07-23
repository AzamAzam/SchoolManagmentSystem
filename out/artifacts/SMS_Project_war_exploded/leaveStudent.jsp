<%@ page import="DAO.StudentDAO" %>
<%@ page import="Entity.Student" %>
<%@ page import="Entity.AdmissionDates" %>
<%@ page import="DAO.AdmissionDateDAO" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 06-Feb-18
  Time: 09:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@include file="header.jsp" %>

<jsp:useBean id="student" class="Entity.Student" scope="page"/>
<%
    Student s = (Student) session.getAttribute("student");
    student.setRollno(s.getRollno());
    student.setStdName(s.getStdName());
    //session.removeAttribute("student");
%>
<form class="col-lg-offset-2  col-lg-6" method="post" action=""/>
<fieldset>
    <legend>
        Enter Leaving detail
    </legend>
    <table class="table">
        <tr>
            <td><label for="rollno">Roll NO</label></td>
            <td><label class="form-control" id="rollno">
                <jsp:getProperty name="student" property="rollno"/>
            </td>
        </tr>
        <tr>
            <td><label>Name</label></td>
            <td><label class="form-control">
                <jsp:getProperty name="student" property="stdName"/>
            </label></td>
        </tr>
        <tr>

            <td><label>Leaving Date</label></td>
            <td><input class="date-picker form-control" type="date" name="leavingdate"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" class="btn btn-lg  btn-success" value="Submit"></td>
        </tr>

    </table>
</fieldset>
</form>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        new StudentDAO().statusUpdate(student.getRollno(), "Left");
        String ldate = request.getParameter("leavingdate");
        AdmissionDates dates=new AdmissionDates(student.getRollno(),"",ldate);
        new AdmissionDateDAO().updateLeavingDate(dates);
    }
%>
</body>
</html>
