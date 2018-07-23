<%@ page import="Entity.Users" %>
<%@ page import="DAO.UsersDAO" %>
<%@ page session="true" language="java" %>
<html>
<body>

<%@include file="header.jsp" %>
<%

    if (request.getMethod().equals("POST")){
        String userName =request.getParameter("userName");
        String password =request.getParameter("pswd");
        String role =request.getParameter("role");
        Users users=new Users(userName,password,role);
        new UsersDAO().inerstUser(users);
        out.println("<h1>User Added </h1>");
    }

%>
<div class="container">

    <form id='addUser' method="post" action="" onsubmit="return passswordmatch()">
        <fieldset>
            <legend>Add User</legend>
            <div class="vcenter">
                <div class='form-group'>
                    <label for='userName' class="pull-left">User Name</label>
                    <input type='text' class='form-control' style='font-size:25px' id="userName" name='userName'
                           required>
                </div>
                <div class='form-group'>
                    <label for='role' class="control-label pull-left">Role</label>
                    <select class="form-control input-md" id="role" name="role">
                        <option>Admin</option>
                        <option>teacher</option>
                    </select>
                </div>
                <div class='form-group '>
                    <!-- <div class='col-md-6 col-sm-6'> -->
                    <label for='pswd' class="pull-left">Password</label>
                    <input type='password' class='form-control ' style='font-size:25px; ' id="pswd" name='pswd' required>
                </div>
                <!-- <div class='col-md-6 col-sm-6'> -->
                <div class='form-group'>
                    <label for='cnfrmpswd' class="pull-left">Confirm Password</label>
                    <input type='password' style='font-size:25px; ' class='form-control ' id="cnfrmpswd"
                           name='cnfrmpswd' required>
                </div>
                <div class='form-group'>
                    <button type="submit" class="btn btn-success btn-block" >Submit</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>


</html>