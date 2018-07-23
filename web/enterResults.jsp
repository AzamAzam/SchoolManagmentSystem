<%@ page import="DAO.ClassDAO" %>
<%@ page import="DAO.StudentClassDAO" %>
<%@ page import="Entity.Class" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 05-Feb-18
  Time: 05:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        {
            var request = new XMLHttpRequest();

            function filterStudents() {

                var clsid = $("#className").val();
                var url = "fetchData.jsp?classId=" + clsid;
                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            $("#studentList").html(val);
                        }
                        /*if(request.readyState==3){
                            alert("you entered: "+name)
                        }*/
                    }//end of function
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function fetchCourses() {
                var roll = $("#studentList").val();
                var url = "fetchData.jsp?roll=" + roll;
                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            $("#courses").html(val);
                        }
                        /*if(request.readyState==3){
                            alert("you entered: "+name)
                        }*/
                    }//end of function
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }
        }
    </script>
</head>
<body>
<%@include file="header.jsp" %>

<%=request.getMethod()%>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
    //    int fields = Integer.parseInt((String) session.getAttribute("fields"));
     //   out.print(fields);
      //  session.removeAttribute("fields");
%>
<jsp:useBean id="stdcls" class="Entity.StudentClass" scope="page"/>
<jsp:setProperty name="stdcls" property="*"/>
<%
       new StudentClassDAO().updateStudentInClass(stdcls);

    }
%>

<div class="container-fluid col-lg-8">
    <table class="table col-lg-offset-2">
        <tr>
            <th>
                <label for="className">Select class </label></th>
            <th><label for="studentList">Select Students </label></th>
        </tr>
        <tr>
            <td>
                <select name="classId" id="className" onchange="filterStudents()">
                    <option></option>
                    <% ArrayList<Class> classes = new ClassDAO().allClasses();
                        for (int i = 0; i < classes.size(); i++) {
                            Class cls = classes.get(i);
                    %>
                    <option value=<%=cls.getClassId()%>><%=cls.getClassId() + " " + cls.getClassName()%>
                    </option>
                    <%}%>
                </select></td>
            <td>
                <select id="studentList" name="stdRollNo" onchange="fetchCourses()">

                </select></td>
        </tr>
    </table>
    <div id="courses" >

    </div>
</div>

</body>
</html>
