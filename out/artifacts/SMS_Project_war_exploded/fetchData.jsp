<%@ page import="DAO.ClassDAO" %>
<%@ page import="DAO.CourseDAO" %>
<%@ page import="Entity.Course" %>
<%@ page import="Entity.Student" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 05-Feb-18
  Time: 05:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("user") == null)
        response.sendRedirect("index.jsp");
    String classid = request.getParameter("classId");
    String roll = request.getParameter("roll");
    if (classid != null) {
%>

<option></option>
<%
    ArrayList<Student> students = new ClassDAO().getStudents(classid);
    for (int i = 0; i < students.size(); i++) {

%>
<option value=<%=students.get(i).getRollno()%>><%=students.get(i).getRollno() + " " + students.get(i).getStdName()%>
</option>
<%
        }
    }
    if (roll != null) {

        ArrayList<Course> courses = new CourseDAO().getCoursesByRollNo(roll);
        int listSize = courses.size();
%>
<form method="post" action="">
    <div class="col-lg-offset-3">
        <label for="boardRollNo">Board RollNo</label>
        <input class="form-control" name="boardRollNo" id="boardRollNo" required placeholder="Board Roll No"/>
    </div>


    <table class="col-lg-offset-2 col-lg-6">
        <legend>Enter Marks</legend>
        <%
            for (int i = 0; i < listSize; i++) {
        %>
        <tr>
            <td><label for=<%="\'field" + i + 1 + "\'" %>><%=courses.get(i).getCourseName()%>
            </label></td>
            <td><input type="text" class="form-control" placeholder="Marks" required pattern="[0-9]*"
                       name=<%="\'field"+i + 1+"\'" %>   id=<%="\'field" + i + 1 + "\'" %> /></td>
            <td><select class="form-control" name=<%="\'sts" + i + 1 + "\'" %>>
                <option>pass</option>
                <option>fail</option>
            </select></td>
        </tr>
        <%
            }
        %>
        <tr>
            <td><label for="status">Class Status</label></td>
            <td colspan="2"><select class="form-control" id="status" name="classStatus">
                <option>pass</option>
                <option>fail</option>
            </select></td>
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2"><input type="submit" class="btn btn-block btn-success"></td>
        </tr>
    </table>
</form>
<%

        session.setAttribute("fields", listSize);
    }

%>
