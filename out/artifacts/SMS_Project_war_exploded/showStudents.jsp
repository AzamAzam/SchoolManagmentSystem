<%@ page import="DAO.StudentDAO" %>
<%@ page import="Entity.Student" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <style>
        table {
            width: 100%;
            border: 4px solid blue;
            border-collapse: collapse;

        }

        td {
            color: black;
            padding: 8px;
            border: 2px solid blue;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            color: white;
            padding: 10px;
            background-color: black;
            border: 2px solid blue;
        }

        tr:nth-child(even) {
            background-color: lightpink
        }

        tr:nth-child(odd) {
            background-color: lightcoral;
        }

        tr:hover {
            background-color: lightseagreen;
        }

        input[type=text] {
            float: right;
            width: 250px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 45px;
            font-size: 16px;
            background-color: white;
            background-image: url('/images/searchIcon.png');
            background-position: 10px 10px;
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
        }


    </style>
</head>
<body style="background-color: lightblue">
<%@include file="header.jsp" %>
<h1 style="text-align:center; font-size:2.0cm;">Students</h1>
<input type="text" size=30 name="serchfield" placeholder="Search">
<br><br><br><br><br><br>
<table>
    <thead>
    <tr>
        <th>Roll NO</th>
        <th>Name</th>
        <th>Father Name</th>
        <th>Date Of Birth</th>
        <th>Address</th>
        <th>District</th>
        <th>Contact</th>
        <th>Blood Group</th>
        <th>Status</th>
        <th>Department</th>
    </tr>
    </thead>
    <jsp:useBean id="student" class="Entity.Student" scope="page"/>
    <%
        ArrayList<Student> students = (new StudentDAO()).allStudents();
        for (int i = 0; i < students.size(); i++) {
            Student s = students.get(i);
            student.setRollno(s.getRollno());
            student.setStdName(s.getStdName());
            student.setFatherName(s.getFatherName());
            student.setDob(s.getDob());
            student.setDistrict(s.getDistrict());
            student.setAddress(s.getAddress());
            student.setContact1(s.getContact1());
            student.setBloodGroup(s.getBloodGroup());
            student.setDepartment(s.getDepartment());
            student.setStatus(s.getStatus());
    %>
    <tr>
        <td><a href="studentRecord.jsp?rollno=<%=student.getRollno()%>">
            <jsp:getProperty name="student" property="rollno"/>
        </a></td>
        <td>
            <jsp:getProperty name="student" property="stdName"/>
        </td>
        <td>
            <jsp:getProperty name="student" property="fatherName"/>
        </td>
        <td>
            <jsp:getProperty name="student" property="dob"/>
        </td>
        <td>
            <jsp:getProperty name="student" property="address"/>
        </td>
        <td>
            <jsp:getProperty name="student" property="district"/>
        </td>
        <td>
            <jsp:getProperty name="student" property="contact1"/>
        </td>
        <td>
            <jsp:getProperty name="student" property="bloodGroup"/>
        </td>
        <td><jsp:getProperty name="student" property="status"/></td>
        <td >
            <jsp:getProperty name="student" property="department"/>
        </td>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>