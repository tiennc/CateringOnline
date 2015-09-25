<%-- 
    Document   : login_register
    Created on : Sep 25, 2015, 2:53:12 AM
    Author     : Windows 10
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="reg" value="${param.register}" />
<c:if test="${reg == 'success'}">
    <script>alert("Ban dang ky thanh cong, vui long vao mail de active");</script>
</c:if>

<script language="JavaScript">

    function isValidUsername() {
        txtusername = document.myform.username;
        regexU = /^[a-z0-9 ]{4,20}$/;
        ;
        testUsername = regexU.test(txtusername.value);
        if (!testUsername) {
            document.getElementById("failUser").innerHTML = "Tên đăng nhập không hợp lệ";
            return false;
        } else {
            document.getElementById("failUser").innerHTML = "";
            return true;
        }
    }

    function isValidEmail() {
        email = document.myform.email;
        reg1 = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        testmail = reg1.test(email.value);
        if (!testmail) {
            document.getElementById("failEmail").innerHTML = "Email không hợp lệ!";
            return false;
        } else {
            document.getElementById("failEmail").innerHTML = "";
            return true;
        }
    }


    function isValidPassword() {
        password = document.myform.password;
        regexP = /^[A-Za-z0-9!@#$%...]{6,32}$/;
        testP = regexP.test(password.value);
        if (!testP) {
            document.getElementById("password_error").innerHTML = "Password quá ngắn, từ 6 trở lên";
            return false;
        } else {
            document.getElementById("password_error").innerHTML = "";
            return true;
        }
    }


    function isValidPassword2() {
        password = document.myform.password;
        password1 = document.myform.password1;
        if (password1.value !== password.value) {
            document.getElementById("password1_error").innerHTML = "Mật khẩu xác nhận không khớp";
            return false;
        } else {
            document.getElementById("password1_error").innerHTML = "";
            return true;
        }
    }


    function checkUsername() {
        username_error = document.myform.username_error;
        if (username_error.value !== null) {
            return false;
        } else {
            return true;
        }
    }
    function checkinput() {

        username = document.myform.username;
        password = document.myform.password;
        email = document.myform.email;
        password1 = document.myform.password1;
        checkbox = document.myform.checkbox;
        reg1 = /^[0-9A-Za-z]+[0-9A-Za-z_]*@[\w\d.]+.\w{2,4}$/;
        testmail = reg1.test(email.value);

        if (username.value === "") {
            username.focus();
            return false;
        }
        if (password.value === "") {

            password.focus();
            return false;
        }
        if (password1.value === "" || password1.value !== password.value) {

            password1.focus();
            return false;
        }
        if (checkbox.checked === false) {
            alert("Bạn chưa đồng ý với điều khoản và quy định của cửa hàng");
            return false;
        }

        if (!isValidUsername()) {
            return false;
        }

        if (!checkUsername()) {
            return false;
        }

        if (!isValidEmail()) {
            return false;
        }

        if (!isValidPassword()) {
            return false;
        }
        if (!isValidPassword2()) {
            return false;
        }


        return true;
    }
</script>


<!DOCTYPE html>
<!--S:LogModal-->
<div class="modal fade" id="LogModal" tabindex="-1" role="dialog" aria-labelledby="LogModal" aria-hidden="true">
    <div class="modal-dialog">
        <form action="UserServlet?ac=login" method="POST" session="scope">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Đăng nhập</h4>
                </div>
                <div class="modal-body">		      	
                    <div class="form-group">
                        <label for="InputUserName">Tên đăng nhập</label>
                        <input type="email" class="form-control" id="InputUserName" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">Mật khẩu</label>
                        <input type="password" class="form-control" id="InputPassword" placeholder="Password">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Ghi nhớ đăng nhập
                        </label>
                    </div>						      				      
                </div>
                <div class="modal-footer">	      	
                    <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                    <button type="button" class="btn btn-warning">Đăng nhập</button>
                </div>
            </div>
        </form>
    </div>
</div>  	
<!--E:LogModal-->



<!--S:RegModal-->
<div class="modal fade" id="RegModal" tabindex="-1" role="dialog" aria-labelledby="RegModal" aria-hidden="true">
    <div class="modal-dialog">
        <form method="POST" name="myform" action="UserServlet?ac=register" session="scope" onsubmit="return checkinput()">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Tham gia với chúng tôi</h4>
                </div>
                <div class="modal-body">		
                    <div class="form-group fbregister">
                        <a class="fbreg">Đăng ký bằng Facebook</a>
                    </div>      	
                    <div class="form-group">
                        <label for="InputUserName">Tên đăng nhập</label>
                        <input name="username" type="text" class="form-control" id="InputUserName" placeholder="Enter your name" onkeyup="isValidUsername()" autocomplete="off" required="true">
                        <p id="failUser" style="color: red"></p> 
                    </div>	      	
                    <div class="form-group">
                        <label for="InputUserEmail">Email</label>
                        <input name="email" type="email" class="form-control" id="InputUserEmail" placeholder="Enter your email" onkeyup="isValidEmail()" autocomplete="off" required="true">
                        <p id="failEmail" style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">Mật khẩu</label>
                        <input name="password" type="password" class="form-control" id="InputPassword" placeholder="Password" onkeyup="isValidPassword()" autocomplete="off" required="true">
                        <p id="password_error" style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">Gõ lại mật khẩu</label>
                        <input name="password1" type="password" class="form-control" id="InputPassword" placeholder="Retype Password" onkeyup="isValidPassword2()" autocomplete="off" required="true">
                        <p id="password1_error" style="color: red"></p>
                    </div>
                    <div>
                        <label style="padding-right: 40px" for="InputUserName">Đăng ký với tư cách là:</label>
                        <label class="radio-inline">
                            <input type="radio" name="rbRole" checked="true" value="0">Khách hàng
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="rbRole" value="1">Cửa hàng
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input name="checkbox" type="checkbox"> Bạn đồng ý với <a href="about-common.html">điều khoản</a> và <a href="about-common.html">quy định sử dụng</a> của chúng tôi
                        </label>
                    </div>						      				      
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                    <button type="submit" class="btn btn-warning">Đăng ký</button>
                </div>
            </div>
        </form>
    </div>
</div>  	
<!--E:RegModal-->
