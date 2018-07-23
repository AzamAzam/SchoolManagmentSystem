<%@ page import="DAO.StudentDAO" %>
<%@ page import="Entity.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.AdmissionDates" %>
<%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 04-Feb-18
  Time: 08:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@include file="header.jsp" %>
<jsp:useBean id="student" class="Entity.Student" scope="request"/>
<%--Getting roll num from URL set in showStudent.jsp --%>
 <% String rollNo = request.getParameter("rollno");

    Student s = new StudentDAO().getStudent(rollNo);
    student.setValues(s);
    session.setAttribute("student", s);
%>
<h1>
    <jsp:getProperty name="student" property="stdName"/>
</h1>
<h4>
    <jsp:getProperty name="student" property="rollno"/>
</h4>

<div class="container-fluid col-lg-6">
    <table border="1px" align="center" class="table table-responsive col-lg-offset-2">


        <legend>Student Personal Information</legend>
        <tr>
            <td>Status</td>
            <td>
                <jsp:getProperty name="student" property="status"/>
            </td>
        </tr>
        <tr>
            <td>Department</td>
            <td>
                <jsp:getProperty name="student" property="department"/>
            </td>
        </tr>

        <tr>
            <td>Father Name</td>
            <td>
                <jsp:getProperty name="student" property="fatherName"/>
            </td>
        </tr>
        <tr>
            <td>Student CNIC</td>
            <td>
                <jsp:getProperty name="student" property="stdCnic"/>
            </td>
        </tr>
        <tr>
            <td>Father Name</td>
            <td>
                <jsp:getProperty name="student" property="fatherName"/>
            </td>
        </tr>
        <tr>
            <td>Father CNIC</td>
            <td>
                <jsp:getProperty name="student" property="fatherCnic"/>
            </td>
        </tr>
        <tr>
            <td>Guardian Name</td>
            <td>
                <jsp:getProperty name="student" property="guardianName"/>
            </td>
        </tr>
        <tr>
            <td>Guardian CNIC</td>
            <td>
                <jsp:getProperty name="student" property="guardianCnic"/>
            </td>
        </tr>
        <tr>
            <td>Date Of Birth</td>
            <td>
                <jsp:getProperty name="student" property="dob"/>
            </td>
        </tr>
        <tr>
            <td>Blood Group</td>
            <td>
                <jsp:getProperty name="student" property="bloodGroup"/>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td>
                <jsp:getProperty name="student" property="address"/>
            </td>
        </tr>
        <tr>
            <td>Tehsil</td>
            <td>
                <jsp:getProperty name="student" property="tehsil"/>
            </td>
        </tr>
        <tr>
            <td>District</td>
            <td>
                <jsp:getProperty name="student" property="district"/>
            </td>
        </tr>
        <tr>
            <td>Contact</td>
            <td>
                <jsp:getProperty name="student" property="contact1"/>
            </td>
        </tr>
        <tr>
            <td>Contact</td>
            <td>
                <jsp:getProperty name="student" property="contact2"/>
            </td>
        </tr>
        <tr>
            <td>Qualification</td>
            <td>
                <jsp:getProperty name="student" property="qualification"/>
            </td>
        </tr>


    </table>
</div>

<%--
To show admission dates of student
--%>
<jsp:useBean id="admissionDatesObj" class="Entity.AdmissionDates" scope="page"/>
<jsp:useBean id="admissionDatesDAO" class="DAO.AdmissionDateDAO" scope="page"/>
<div class="container-fluid col-lg-4">
    <table border="1px" align="center" class="table table-responsive col-lg-offset-2">


        <legend>Admission Dates</legend>
    <tr>
        <th>Admission Date</th>
        <th>Leaving Date</th>
    </tr>
<%

    ArrayList list=admissionDatesDAO.getAdmissionDates(rollNo);
    for(int i=0;i<list.size();i++)
    {
        admissionDatesObj=(AdmissionDates) list.get(i);
%>

        <tr>
            <td><%=admissionDatesObj.getAdmitDate()%></td>
            <td><%=admissionDatesObj.getLeavingDate()%></td>
        </tr>
        <%
            }
        %>
    </table>
    </div>
    <%--
    To show further options with info of specific student.
    --%>
<div class="container-fluid col-lg-6">
    <table>


        <tr>
            <td>
                <%-- If student is studying then show option of leaving--%>
                <%if(student.getStatus().equalsIgnoreCase("studying")){%>
                <a href="leaveStudent.jsp"><input class="btn-lg btn-success" type="submit" value="Leave" name="leave">
                </a></td>
            <%}%>
            <td><a href="updatePersonalInfo.jsp?rollnum=<%=student.getRollno()%>"> <input class="btn-lg btn-success" type="button" name="edit" id="edit"
                                                    value="Edit Info">
            </a></td>
            <td><a href="deleteRecord.jsp?rollnum=<%=student.getRollno()%>">
                <input class="btn-lg btn-danger" type="button" name="delete" id="delete" value="Delete Record" onclick="alert('Are you sure you want to delete this record')">
            </a></td>
            <%-- If student is left then show option of re-admission--%>
            <%if(student.getStatus().equalsIgnoreCase("Left")){%>
            <td><a href="reAdmission.jsp?rollnum=<%=student.getRollno()%>&name=<%=student.getStdName()%>">
                <input class="btn-lg btn-success" type="button" name="readmission" id="readmission" value="Re-admission">
            </a></td>
            <%}%>
        </tr>

    </table>
</div>
</body>
</html>
