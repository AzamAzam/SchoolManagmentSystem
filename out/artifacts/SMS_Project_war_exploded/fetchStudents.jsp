<%@ page import="DAO.ClassDAO" %>
<%@ page import="Entity.Student" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 05-Feb-18
  Time: 05:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%
    String classid = request.getParameter("val");
    ArrayList<Student> students = new ClassDAO().getStudents(classid);
    for (int i = 0; i < students.size(); i++) {
%>
<option value=<%=students.get(i).getRollno()%>><%=students.get(i).getRollno() + " " + students.get(i).getStdName();%>
</option>
<%
    }
%>
</body>
</html>
