<%--
  Created by IntelliJ IDEA.
  User: Dell inspiron
  Date: 2/23/2018
  Time: 11:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Entity.Student" %>
<%@ page import="DAO.StudentDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.AdmissionDates" %>
<%@ page import="DAO.AdmissionDateDAO" %>
<html>
<head>

</head>
<body>

<%@include file="header.jsp"%>
<jsp:useBean id="admissionDates" class="Entity.AdmissionDates" scope="page"/>
<jsp:useBean id="admissionDatesDAO" class="DAO.AdmissionDateDAO" scope="page"/>

<%  if(request.getMethod().equalsIgnoreCase("POST")){
    //these parameters are values entered by user in this jsp
    admissionDates.setStdId(request.getParameter("studentrollno"));
    admissionDates.setAdmitDate(request.getParameter("reaadmitdate"));
    admissionDatesDAO.InsertDate(admissionDates);
}%>

<form action="" method="post" class="col-lg-offset-3 col-lg-6">
    <table class="table ">
        <fieldset>

            <legend>Re Admission</legend>
            <tr>
                <th>Select Student</th>
                <th><label>Select Date</label></th>
            </tr>
            <tr>
                <td>
                    <select name="studentrollno" class="form-control">
                        <% ArrayList listOfStd=new StudentDAO().getLeftStudentList();
                            Student student=new Student();
                            for(int i=0;i<listOfStd.size();i++){
                                student=(Student)listOfStd.get(i);
                        %>
                        <option value="<%=student.getRollno()%>">
                            <%=student.getStdName()+ "  " + student.getRollno()%>
                        </option>
                        <%}%> <%-- End of for loop --%>
                    </select>
                </td>

                <td><input class="date-picker form-control" type="date" name="reaadmitdate"></td>

            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit"  class="btn btn-success btn-b lock">
                </td>
                <td></td>
            </tr>
        </fieldset>

    </table>
</form>
</body>
</html>
