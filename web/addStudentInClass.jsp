<%@ page import="DAO.ClassDAO" %>
<%@ page import="DAO.StudentClassDAO" %>
<%@ page import="DAO.StudentDAO" %>
<%@ page import="Entity.Class" %>
<%@ page import="Entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 05-Feb-18
  Time: 04:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@include file="header.jsp" %>
<%@page import="java.util.ArrayList" %>
<form action="" method="post" class="col-lg-offset-3 col-lg-6">
    <table class="table ">
        <fieldset>

            <legend>Add Student in Class</legend>
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
                    <select name="student" class="form-control">
                        <% ArrayList<Student> students = new StudentDAO().allStudents();
                            Student std;
                            for (int i = 0; i < students.size(); i++) {
                                std = students.get(i);
                        %>
                        <option value=<%=std.getRollno()%>><%=std.getRollno() + " " + std.getStdName() %>
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
                </td>
                </select>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" class="btn btn-success btn-block">
                </td>
                <td></td>
            </tr>
        </fieldset>
    </table>
</form>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String clasid = request.getParameter("class");
        String rollNo = request.getParameter("student");
        String year = request.getParameter("year");
        new StudentClassDAO().insertStudentInClass(clasid, rollNo, year);
    }
%>

</body>
</html>
