<%@ page import="DAO.UsersDAO" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 06-Feb-18
  Time: 03:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@include file="header.jsp" %>
<%!boolean isverify=true;  %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")){
        String uname= ((Users)session.getAttribute("user")).getUserName();
        String oldpswd = request.getParameter("oldpassword");
        String newpswd = request.getParameter("newpassword");
        Users u=new Users();
        u.setUserName(uname);
        u.setPassword(newpswd);
        Users users = new UsersDAO().searchUsers(uname);
        if (users.getPassword().equals(oldpswd)) {
         new UsersDAO().updateUsers(uname,u);
         response.sendRedirect("Home.jsp");
        } else {
            isverify = false;
            session.invalidate();
        }
    }
%>
<%if (!isverify) {%>
<div style="color: red" align="center"><p> Old password is incorrect (Going  to  Log out) </p></div>
<%}%>

<form action="" method="post" class="col-lg-offset-2 col-lg-6" onsubmit="return passswordmatch()">
    <fieldset>
        <legend>Change Password</legend>
        <table class="table ">
            <tr>
                <td><label class="control-label" for="oldpassword">Old Password</label></td>
                <td><input type="password" placeholder="old Password" name="oldpassword" id="oldpassword"
                          required class="form-control"></td>
            </tr>
            <tr>
                <td><label class="control-label" for="pswd">New Password</label></td>
                <td><input type="password" placeholder="New Password" name="newpassword" id="pswd"
                           class="form-control"></td>
            </tr>
            <tr>
                <td><label class="control-label" for="cnfrmpswd">Confirm Password</label></td>
                <td><input type="password" placeholder="Confirm Password" name="cnfrmpassword" id="cnfrmpswd"
                      required     class="form-control"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" class="btn-success btn-block" value="Change Password" required></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
