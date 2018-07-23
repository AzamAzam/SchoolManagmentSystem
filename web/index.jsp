<%@ page import="DAO.UsersDAO" %>
<%@ page import="Entity.Users" %>
<%@page errorPage="error.jsp" %>
<html>

<head>

    <link href="styles/styles.css " rel="stylesheet" type="text/css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <script src="bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src='bootstrap/js/bootstrap.min.js'></script>
    <script src='bootstrap/js/jquery.min.js'></script>
    <script language="javascript" type="text/javascript"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title class='urdu-font'>Darul Oloom Hanfia faridia </title>
</head>

<body>
<%! boolean isverify = true;%>

<%out.print(request.getMethod()); %>
<% //check session
    if (session.getAttribute("user") != null) {
        if (request.getParameter("checksession") != null && request.getParameter("checksession").equals("false"))
            session.invalidate();
        else
            response.sendRedirect("Home.jsp");
    }
    //method  mathch
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String uname = request.getParameter("uname");
        String pswd = request.getParameter("psw");
        Users users = new UsersDAO().searchUsers(uname);
        if (users.getPassword().equals(pswd)) {
            isverify = true;
            session.setAttribute("user", users);
            response.sendRedirect("Home.jsp");

        } else {
            isverify = false;
            session.invalidate();
        }
    }
%>

<h1 id='name'> Darul Oloom Hanfia faridia Basir Pur Shareef </h1>
<nav id='main-nav' class='navbar navbar-inverse navbar-responsive'>
    <div class="container-fluid">
        <ul class="nav navbar-nav ">

            <li>
                <button id='btnsignin' class="btn  btn-primary btn-lg navbar-btn">
                    <span class="glyphicon glyphicon-log-in"></span> Sign In
                </button>
            </li>
        </ul>
    </div>
</nav>
<!--sign in  modal-->
<div class="modal" id="signinModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
                <button type="button" class="close" onclick="$('#signinModal').fadeOut(500)">&times;</button>
                <h4>
                    <span class="glyphicon glyphicon-lock"></span> Login</h4>
            </div>
            <div class="modal-body">
                <form role="form" id='signin-form' method="post" action="">
                    <div class="form-group">
                        <label for="uname">
                            <span class="glyphicon glyphicon-user"></span> Username</label>
                        <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter User Name" autofocus
                               required/>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="psw">
                            <span class="glyphicon glyphicon-eye-open"></span> Password</label>
                        <input type="password" class="form-control" id="psw" name="psw" placeholder="Enter password"
                               required>
                        <span id="pswdshow" class="glyphicon glyphicon-eye-open form-control-feedback"></span>
                    </div>
                    <button id='btnlogin' type="submit" class="btn btn-success btn-block">
                        <span class="glyphicon glyphicon-off"></span> Login
                    </button>
                    <%if (!isverify) {%>
                    <div style="color: red"><p> username or password is incorrect</p></div>
                    <%}%>
                <%--    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="">Remember me</label>
                    </div> --%>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger btn-default pull-left"
                        onclick="$('#signinModal').fadeOut(500)">
                    <span class="glyphicon glyphicon-remove"></span> Cancel
                </button>

               <%-- <p>Forgot
                    <a href="#">Password?</a>
                </p>--%>
            </div>
        </div>

    </div>
</div>

<script src="scripts/script.js" type="text/javascript"></script>


</body>

</html>