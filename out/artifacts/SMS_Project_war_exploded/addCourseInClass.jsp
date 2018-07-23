<%@ page import="DAO.ClassDAO" %>
<%@ page import="DAO.CourseDAO" %>
<%@ page import="Entity.Class" %>
<%@ page import="Entity.Course" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 05-Feb-18
  Time: 03:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>

<%@include file="header.jsp" %>
<form action="" method="post" class="col-lg-offset-2 col-lg-6">
    <table class="table">
        <fieldset>
            <legend>Add Course in Class</legend>
            <tr>
                <th>Select Class</th>
                <th>Select Course</th>
                <th>Year</th>
            </tr>
            <tr>
                <td><select name="class" class="form-control">
                    <% ArrayList<Class> classes = new ClassDAO().allClasses();
                        for (int i = 0; i < classes.size(); i++) {
                            Class cls = classes.get(i);
                    %>
                    <option value=<%=cls.getClassId()%>><%=cls.getClassId() + " " + cls.getClassName()%>
                    </option>
                    <%}%>
                </select>
                </td>
                <td>
                    <select name="course" class="form-control">
                        <% ArrayList<Course> courses = new CourseDAO().allCourses();
                            Course crs;
                            for (int i = 0; i < courses.size(); i++) {
                                crs = courses.get(i);
                        %>
                        <option value=<%=crs.getCourseId()%>><%=crs.getCourseId() + " " + crs.getCourseName()%>
                        </option>
                        <%}%>
                    </select>
                </td>
                <td>
                    <select name="year" class="form-control">
                        <% for (int i = 0; i < 100; i++) {
                        %>
                        }
                        <option>
                            <%=i + 2010%>
                        </option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" class="btn btn-block btn-success"/>
                </td>
            </tr>
        </fieldset>
    </table>
</form>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String clasid = request.getParameter("class");
        String courseid = request.getParameter("course");
        String year = request.getParameter("year");
        new ClassDAO().insertCourseInClass(clasid, courseid, year);
    }
%>
</body>
</html>
