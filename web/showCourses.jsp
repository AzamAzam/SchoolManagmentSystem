<%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 17-Jan-18
  Time: 01:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Entity.Course" %>
<%@page import="DAO.CourseDAO" %>
<%@ page import="java.util.ArrayList" %>
<html>

<body>
<%@include file="header.jsp"%>
<jsp:useBean id="course" class="Entity.Course" scope="page"></jsp:useBean>
<div class="container-fluid col-lg-8">
    <table class="table table-bordered table-responsive col-lg-offset-3" >
        <tr>

            <th>Course Id</th>
            <th>Course Name</th>

        </tr>

        <%
            ArrayList<Course> classes = (new CourseDAO().allCourses());
            Course crs = new Course();
            for (int i = 0; i < classes.size(); i++) {
                crs = classes.get(i);
                course.setCourseId(crs.getCourseId());
                course.setCourseName(crs.getCourseName());

        %>
        <tr>

            <td>
                <jsp:getProperty name="course" property="courseId"/>
            </td>
            <td>
                <jsp:getProperty name="course" property="courseName"/>
            </td>
        </tr>
        <%
            }%>
    </table>
</div>

</body>
</html>
