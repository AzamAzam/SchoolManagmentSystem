// Get the modal
/*
var modal = document.getElementById('signinModal');
// When the user clicks anywhere outside of the signin modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
*/

$(window).load(function () {

    $('#signinModal').show();
});

//click  on sign in  button
$('#btnsignin').on('click', function () {
    $('#signinModal').show();
});

function passswordmatch() {
    flag = ($("#pswd").val() == $("#cnfrmpswd").val())
    if (!flag) {
        alert("Both Passwords Does not match ")
        $("#pswd").val("");
        $("#cnfrmpswd").val("");
       // $("#pswd").focus();
        return false;
    }
    return true;
}

//click in  window when log in modal is  opened 
$(document).click(function (e) {
    if ($(e.target).is('#signinModal')) {
        $('#signinModal').fadeOut(500);
    }
});
/*
//verify username  and  password
$('#btnlogin').click(function (e) {
    //correct 
    if ($('#uname').val() == 'Azam' && $('#psw').val() == 'azam') {
        uname = $('#uname').val();
        $('#signinModal').fadeOut(500);
        $('#btnsignin').hide();
        $("#unamebtn").html(' <span class="glyphicon glyphicon-user"></span> ' + ' ' + uname);
        $('.admin').show();
    }
    //wrong  
    else if ($('#uname').val() != '' && $('#psw').val() != '') {
        if (!$('#error').length) {
            $('#btnlogin').after(
                $('<div/>')
                    .attr("id", "error")
                    .append("<span/>")
                    .text("User Name  or  password  is  incorrect ")

            );
        }

    }
    e.preventDefault();
});
*/
/*
$('#unamebtn').on('click', function () {
    alert('signin already');
});
*/
/*
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imgPreview')
                .attr('src', e.target.result)
                .width(150)
                .height(200);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
*/


$('#signoutbtn').click(function () {
    $('.admin').hide();
    $('#signoutmenu').hide();
    $('#btnsignin').show();
});

$("#psw").on("keyup", function () {
    if ($(this).val())
        $("#pswdshow").show();
    else
        $("#pswdshow").hide();
});
$("#pswdshow").mousedown(function () {
    $("#psw").prop('type', 'text');
}).mouseup(function () {
    $("#psw").prop('type', 'password');
});