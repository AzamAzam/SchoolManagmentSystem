<%@ page import="DAO.CourseDAO" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 17-Jan-18
  Time: 01:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%@include file="header.jsp" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
%>
<jsp:useBean id="course" class="Entity.Course" scope="page"/>
<jsp:setProperty name="course" property="courseName"/>
<%
        new CourseDAO().insertCourse(course);
        out.print("Added");
    }
%>
<div class="container">
    <form id='addCourse' method="post">
        <fieldset>
            <legend>Add Course</legend>
            <div class="vcenter">
                <div class='form-group'>
                    <label for='courseName' class="pull-left">Course Name</label>
                    <input type='text' class='form-control' style='font-size:25px' id="courseName" name='courseName'
                           required>
                </div>
                <div class='form-group'>
                    <button type="submit" class="btn btn-success btn-block">Submit</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>


</body>
</html>
