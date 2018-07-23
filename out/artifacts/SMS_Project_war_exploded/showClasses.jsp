<%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 05-Feb-18
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.ClassDAO" %>
<%@ page import="Entity.Class" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Classes</title>
</head>
<body>
<%@include file="header.jsp" %>
<jsp:useBean id="cls" class="Entity.Class" scope="page"/>
<div class="container-fluid col-lg-6">
    <table class="table table-bordered table-responsive col-lg-offset-3" >
        <tr>

            <th>Class Id</th>
            <th>Class Name</th>

        </tr>

        <%
            ArrayList<Class> classes = (new ClassDAO().allClasses());
            Class clss = new Class();
            for (int i = 0; i < classes.size(); i++) {
                clss = classes.get(i);
                cls.setClassId(clss.getClassId());
                cls.setClassName(clss.getClassName());

        %>
        <tr>

            <td>
                <jsp:getProperty name="cls" property="classId"/>
            </td>
            <td>
                <jsp:getProperty name="cls" property="className"/>
            </td>
        </tr>
        <%
            }%>
    </table>
</div>
</body>
</html>
