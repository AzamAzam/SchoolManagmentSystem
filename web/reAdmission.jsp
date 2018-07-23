<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Entity.Student" %>
<%@ page import="DAO.StudentDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell inspiron
  Date: 2/22/2018
  Time: 10:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<%@include file="header.jsp"%>

<%
   //when called for re-admission from header.jsp
    if(request.getParameter("rollnum").equalsIgnoreCase("-1") )
    {
        response.sendRedirect("reAdmissionByHeader.jsp");
    }
    else    //when called for re-admission from studentRecord.jsp
    {
%>
<form class="col-lg-offset-2  col-lg-6" method="post" action=""/>
<fieldset>
    <legend>
        Re-Admission
    </legend>
    <table class="table">
        <tr>
            <td><label for="rollno">Roll NO</label></td>
            <td><label class="form-control" id="rollno">
                    <%=request.getParameter("rollnum")%>
            </td>
        </tr>
        <tr>
            <td><label>Name</label></td>
            <td><label class="form-control">
                <%=request.getParameter("name")%>
            </label></td>
        </tr>
        <tr>

            <td><label>Leaving Date</label></td>
            <td><input class="date-picker form-control" type="date" name="reaadmitdate"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" class="btn btn-lg  btn-success" value="Submit"></td>
        </tr>

    </table>
</fieldset>
</form>

<%
    }
%>
<%-- End of process when request is for spesific student --%>

<jsp:useBean id="admissionDates" class="Entity.AdmissionDates" scope="page"/>
<jsp:useBean id="admissionDatesDAO" class="DAO.AdmissionDateDAO" scope="page"/>

<%  if(request.getMethod().equalsIgnoreCase("POST")){
        //these parameters are passed in URL syudentRecord.jsp
        admissionDates.setStdId(request.getParameter("rollnum"));
        admissionDates.setAdmitDate(request.getParameter("reaadmitdate"));
        admissionDatesDAO.InsertDate(admissionDates);
    }
%>


</body>
</html>
