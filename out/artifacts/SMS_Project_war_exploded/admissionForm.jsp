<%@ page import="DAO.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: DeskTop
  Date: 17-Jan-18
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%@include file="header.jsp" %>
<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
%>
<jsp:useBean id="student" class="Entity.Student" scope="page"/>
<jsp:setProperty name="student" property="*"/>
<%

        new StudentDAO().inerstStudent(student);
        out.print("Student Added");
    }
%>

<!--admission form -->
<form method="post" id='admissionform' class="form-horizontal" align='center'>
    <fieldset>

        <!-- Form Name -->
        <legend class="urdu-font pull-right urdu-size">داخلہ فارم</legend>

        <div class='col-md-12 col-sm-12'>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='studentName' class='urdu-font urdu-size pull-right'>نام طالب علم </label>
                <input type='text' id="studentName" class='form-control urdu-size urdu-font pull-right'
                       name='stdName'
                       required>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='studentCnic' class='urdu-font urdu-size pull-right'> طالب علم شناختی کارڈ/ب فارم
                    نمبر </label>
                <input type='text' id="studentCnic" class='form-control urdu-size urdu-font pull-right'
                       name='stdCnic'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='fatherName' class='urdu-font urdu-size pull-right'> والد کا نام </label>
                <input type='text' id="fatherName" class='form-control urdu-font urdu-size pull-right'
                       name='fatherName'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='fatherCnic' class='urdu-font urdu-size pull-right'>والد کا شناختی کارڈ نمبر</label>
                <input type='text' id="fatherCnic" class='form-control urdu-font pull-right'
                       name='fatherCnic'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='guardianName' class='urdu-font urdu-size pull-right'> سر پرست کا نام </label>
                <input type='text' class='form-control urdu-font pull-right' id="guardianName"
                       name='guardianName'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='guardianCnic' class='urdu-font urdu-size pull-right'> سر پرست کا شناختی کارڈ نمبر </label>
                <input type='text' id="guardianCnic" class='form-control urdu-font urdu-size pull-right'
                       name='guardianCnic'>
            </div>
            <div class='form-group col-md-6 col-sm-6'>
                <label for='permmanentAddress' class='urdu-font urdu-size pull-right'> مستقل پتا </label>
                <input type='text' id="permmanentAddress" class='form-control urdu-font urdu-size pull-right'
                       name='address'>
            </div>
            <div class='form-group col-md-3 col-sm-3'>
                <label for='tehsil' class='urdu-font urdu-size pull-right'> تحصیل </label>
                <input type='text' id="tehsil" class='form-control urdu-font pull-right' name='tehsil'>
            </div>
            <div class='form-group col-md-3 col-sm-3'>
                <label for='district' class='urdu-font urdu-size pull-right'> ضلع </label>
                <input type='text' id="district" class='form-control urdu-font pull-right'
                       name='district'>
            </div>
            <div class="form-group col-md-6 col-sm-6">
                <label for="contact1" class="urdu-font urdu-size pull-right">1 رابطہ نمبر</label>
                <input type="text" id="contact1" name="contact1" pattern="[0-9]*" class="form-control input-md"
                       required>
            </div>
            <div class="form-group col-md-6 col-sm-6">
                <label for="contact2" class="urdu-font urdu-size pull-right">2 رابطہ نمبر</label>
                <input id="contact2" name="contact2" type="number" class="form-control input-md" required="">
            </div>
        </div>
        <div class='form-group col-md-4 col-sm-4'>
            <label for="bloodgroup" class='urdu-font urdu-size control-label pull-right'>بلڈ گروپ</label>

            <select id="bloodgroup" name="bloodGroup" class="form-control input-md pull-right" dir="rtl">
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
            <input type="date" id="dateofbirth" name="dob" class="form-control input-append">
        </div>
        <div class='form-group col-md-4 col-sm-4 '>
            <label for="depatment" class='urdu-font urdu-size  control-label pull-right'>جس شعبہ میں داخلہ مطلوب
                ہے</label>
            <select id="depatment" name="department" class="form-control input-md urdu-font pull-right" dir="rtl">
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
            <input type="date" id="admissiondate" name="admissiondate" class="form-control input-append">
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

<script>
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imgPreview')
                    .attr('src', e.target.result)
                    .show()
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

</script>

</body>
</html>
