<%@page import="Entity.Users" %>
<%--@page errorPage="error.jsp" --%>
<%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 16-Jan-18
  Time: 10:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="styles/styles.css " rel="stylesheet" type="text/css">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <script src="bootstrap/js/jquery.js" type="text/javascript"></script>
    <script src='bootstrap/js/bootstrap.min.js'></script>
    <script src='bootstrap/js/jquery.min.js'></script>
    <script language="javascript" type="text/javascript"></script>
    <script src="scripts/script.js" type="text/javascript"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title class='urdu-font'>Darul Oloom Hanfia faridia </title>
</head>

<body>
<% String user="A";
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");

    } else // out.print((session.getAttribute("user")).toString());
  user = ((Users) session.getAttribute("user")).getUserName();

%>
<header>
    <h1 id='name'> Darul Oloom Hanfia faridia Basir Pur Shareef </h1>
    <nav id='main-nav' class='navbar navbar-inverse navbar-responsive'>
        <div class="container-fluid">
            <ul class="nav navbar-nav ">
                <li>
                    <button class=' btn-lg urdu-font btn btn-primary navbar-btn dropdown-toggle'
                            data-toggle="dropdown">
                        <span class="caret"></span> Student
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="showStudents.jsp">Show All </a>
                        </li>
                        <li>
                            <a href="#">Update </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <button class=' btn-lg urdu-font btn  btn-primary navbar-btn dropdown-toggle'
                            data-toggle="dropdown">
                        <span class="caret"></span> Admission
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="admissionForm.jsp"> New Admission</a>
                        </li>
                        <li>
                            <a href="reAdmission.jsp?rollnum=-1">Re Admission</a>
                        </li>
                        <li>
                            <a href="#">Leave</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <button class=' btn-lg urdu-font btn  btn-primary navbar-btn dropdown-toggle'
                            data-toggle="dropdown">
                        <span class="caret"></span> Courses
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="addCourseInClass.jsp">Add Course in Class</a>
                        </li>
                        <li>
                            <a href="addCourse.jsp">Add Course</a>
                        </li>
                        <li>
                            <a href="showCourses.jsp"> Show All</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <button class=' btn-lg urdu-font btn btn-primary navbar-btn dropdown-toggle'
                            data-toggle="dropdown">
                        <span class="caret"></span> Class
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="addStudentInClass.jsp">Add Student in Class</a>
                        </li>
                        <li>
                            <a href="addClass.jsp">New Class </a>
                        </li>
                        <li>
                            <a href="showClasses.jsp">Show Classes </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <button class=' btn-lg urdu-font btn btn-primary navbar-btn dropdown-toggle'
                            data-toggle="dropdown">
                        <span class="caret"></span> Result
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="enterResults.jsp">Enter Result</a>
                        </li>
                        <li>
                            <a href="#">Show Result</a>
                        </li>
                    </ul>
                </li>

            </ul>
            <ul class="navbar-right">
                <li>
                    <button id='unamebtn' type="button" class=" btn  btn-primary btn-lg navbar-btn dropdown-toggle"
                            data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"><%=user%></span>
                    </button>
                    <ul id='usermenu' class="dropdown-menu">
                        <li>
                            <a href="index.jsp?checksession=false"  id='signoutbtn'>Sign Out</a>
                        </li>
                        <li><a href="passwordchange.jsp">Change Password </a></li>
                        <li>
                            <a href="addUserForm.jsp" id='addUser' value="Add User"> Add User </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>


</body>
</html>
