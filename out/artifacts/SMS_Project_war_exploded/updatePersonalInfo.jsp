<%--
  Created by IntelliJ IDEA.
  User: Dell inspiron
  Date: 2/24/2018
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="header.jsp"%>
<%@page import="Entity.Student" %>
<%@page import="DAO.StudentDAO" %>
<jsp:useBean id="student" class="Entity.Student" scope="page"/>
<jsp:useBean id="stdDAO" class="DAO.StudentDAO" scope="page"/>
<%!public String rollNum; %>
<%

if(request.getParameter("rollnum").equalsIgnoreCase("-1"))
{
    out.println("-1");
}
else{  //When called for spcific student from shorRecord.jsp.
    rollNum=request.getParameter("rollnum");
    student=stdDAO.getStudent(request.getParameter("rollnum"));
%>

<form method="post" id='admissionform' action="" class="form-horizontal" align='center'>
    <fieldset>

        <!-- Form Name -->
        <legend class="urdu-font pull-right urdu-size">داخلہ فارم</legend>

        <div class='col-md-12 col-sm-12'>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='studentName' class='urdu-font urdu-size pull-right'>نام طالب علم </label>
                <input type='text' value="<%=student.getStdName()%>" id="studentName" class='form-control urdu-size urdu-font pull-right'
                       name='stdName'
                       required>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='studentCnic' class='urdu-font urdu-size pull-right'> طالب علم شناختی کارڈ/ب فارم
                    نمبر </label>
                <input type='text' value="<%=student.getStdCnic()%>" id="studentCnic" class='form-control urdu-size urdu-font pull-right'
                       name='stdCnic'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='fatherName' class='urdu-font urdu-size pull-right'> والد کا نام </label>
                <input type='text' value="<%=student.getFatherName()%>" id="fatherName" class='form-control urdu-font urdu-size pull-right'
                       name='fatherName'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='fatherCnic' class='urdu-font urdu-size pull-right'>والد کا شناختی کارڈ نمبر</label>
                <input type='text' value="<%=student.getFatherCnic()%>" id="fatherCnic" class='form-control urdu-font pull-right'
                       name='fatherCnic'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='guardianName' class='urdu-font urdu-size pull-right'> سر پرست کا نام </label>
                <input type='text' value="<%=student.getGuardianName()%>" class='form-control urdu-font pull-right' id="guardianName"
                       name='guardianName'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='guardianCnic' class='urdu-font urdu-size pull-right'> سر پرست کا شناختی کارڈ نمبر </label>
                <input type='text' value="<%=student.getGuardianCnic()%>" id="guardianCnic" class='form-control urdu-font urdu-size pull-right'
                       name='guardianCnic'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='permmanentAddress' class='urdu-font urdu-size pull-right'> مستقل پتا </label>
                <input type='text' value="<%=student.getAddress()%>" id="permmanentAddress" class='form-control urdu-font urdu-size pull-right'
                       name='address'>
            </div>
            <div class='form-group col-md-3 col-sm-3'>
                <label for='tehsil' class='urdu-font urdu-size pull-right'> تحصیل </label>
                <input type='text' value="<%=student.getTehsil()%>" id="tehsil" class='form-control urdu-font pull-right' name='tehsil'>
            </div>
            <div class='form-group col-md-3 col-sm-3'>
                <label for='district' class='urdu-font urdu-size pull-right'> ضلع </label>
                <input type='text' value="<%=student.getDistrict()%>" id="district" class='form-control urdu-font pull-right'
                       name='district'>
            </div>
            <div class="form-group col-md-6 col-sm-6">
                <label for="contact1" class="urdu-font urdu-size pull-right">1 رابطہ نمبر</label>
                <input type="text" value="<%=student.getContact1()%>" id="contact1" name="contact1" pattern="[0-9]*" class="form-control input-md"
                       required>
            </div>
            <div class="form-group col-md-6 col-sm-6">
                <label for="contact2" class="urdu-font urdu-size pull-right">2 رابطہ نمبر</label>
                <input id="contact2" value="<%=student.getContact2()%>" name="contact2" type="number" class="form-control input-md" required="">
            </div>
        </div>
        <div class='form-group col-md-4 col-sm-4'>
            <label for="bloodgroup" class='urdu-font urdu-size control-label pull-right'>بلڈ گروپ</label>

            <select id="bloodgroup" name="bloodGroup" class="form-control input-md pull-right" dir="rtl">
                <option><%=student.getBloodGroup()%></option>
                <option>A+</option>
                <option>A-</option>
                <option>B+</option>
                <option>B-</option>
                <option>O+</option>
                <option>O-</option>
                <option>AB+</option>
                <option>AB-</option>
            </select>
        </div>
        <div class='form-group col-md-4 col-sm-4 '>
            <label for="education" class='urdu-font urdu-size control-label pull-right'>تعلیمی قابلیت</label>
            <select id="education" name="qualification" class="form-control input-md urdu-font pull-right" dir="rtl">
                <option><%=student.getQualification()%></option>
                <option>پرائمری</option>
                <option>مڈل</option>
                <option>میٹرک</option>
                <option>بی اے</option>
                <option>ایم اے</option>
                <option>کچھ بھی نہٰیں</option>
            </select>
        </div>

        <div class="form-group col-md-4 col-sm-4 ">
            <label class="control-label urdu-font pull-right urdu-size" for="dateofbirth">تاریخ پیدائش</label>
            <input type="date" value="<%=student.getDob()%>" id="dateofbirth" name="dob" class="form-control input-append">
        </div>
        <div class='form-group col-md-4 col-sm-4 '>
            <label for="depatment" class='urdu-font urdu-size  control-label pull-right'>جس شعبہ میں داخلہ مطلوب
                ہے</label>
            <select id="depatment" name="department" class="form-control input-md urdu-font pull-right" dir="rtl">
                <option><%=student.getDepartment()%></option>
                <option>درس نظامی آٹھ سالہ</option>
                <option>درس نظامی چار سالہ</option>
                <option>التخصص فی العلوم الاسلامیہ</option>
                <option>التخصص فی الفقہ الاسلامتی</option>
                <option>حفظ القرآن</option>
                <option>تجوید و قراءت</option>
            </select>
        </div>
        <div class="form-group col-md-4 col-sm-4 ">
            <label class="control-label urdu-font pull-right urdu-size" for="admissiondate">تاریخ داخلہ</label>
            <input type="date" value="<%=student.getAdmissiondate()%>" id="admissiondate" name="admissiondate" class="form-control input-append">
        </div>
        <div id='img' class='col-md-4 col-sm-4'>
            <input id='fileupload' type="file" name="pic" accept="image/*" value='choose a photo'
                   onchange='readURL(this);'>
            <img id="imgPreview" style="display:none" alt="Place an image"/>

        </div>
        </div>
        <div class='form-group col-md-12 col-sm-12'>
            <input type='submit' class='form-control btn-success' value="Save">
        </div>

    </fieldset>
</form>

<%}%>  <%-- End of else part --%>


<%
    if(request.getMethod().equalsIgnoreCase("POST")){
%>
<jsp:useBean id="student2" class="Entity.Student" scope="page"/>
<jsp:setProperty name="student2" property="*"/>
<%
    stdDAO.updateStudent(rollNum,student2);
    }
%>
</body>
</html>
