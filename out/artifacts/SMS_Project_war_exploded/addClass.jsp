<%@ page import="DAO.ClassDAO" %>
<html>

<body>
<%@include file="header.jsp" %>
<% if (request.getMethod().equalsIgnoreCase("POST")) {
%>
<jsp:useBean id="cls" class="Entity.Class" scope="page"/>
<jsp:setProperty name="cls" property="className"/>
<%

        new ClassDAO().insertClass(cls);
        out.print("Added");
    }
%>
<div class="container">
    <form id='addClass' method="post">
        <fieldset>
            <legend>Add Class</legend>
            <div class="vcenter">
                <div class='form-group'>
                    <label for='className' class="pull-left">Class Name</label>
                    <input type='text' class='form-control' style='font-size:25px' id="className" name='className'
                           required>
                </div>
                <div class='form-group'>
                    <button type="submit" class="btn btn-success btn-block">Submit</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>

</html>