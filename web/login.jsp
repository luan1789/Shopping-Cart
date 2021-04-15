<%-- 
    Document   : index
    Created on : Oct 17, 2020, 11:43:21 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style><%@include file="/css/login.css"%></style>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="1024742275610-pa6fll3edb1j2bcs2b3ekluvmb4155se.apps.googleusercontent.com">
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <title>Login Page</title>
    </head>
    <body>
        <div class="wrapper fadeInDown" style="background-image: url('https://phanmembanhanghcm.com/upload/images/checklist-khoi-nghiep-trong-linh-vuc-kinh-doanh-fast-food.jpg'); background-repeat: no-repeat; background-size: cover;">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="https://www.pngkit.com/png/full/409-4099024_food-cut-out-png-png-images-food-circle.png" id="icon" alt="User Icon" />
                </div>

                <!-- Login Form -->
                <form action="MainController" method="POST">
                    <input type="text" id="login" class="fadeIn second" name="txtUserid" placeholder="username" value="${requestScope.txtuserid}">
                    <input type="password" id="password" class="fadeIn third" name="txtPassword" placeholder="password">

                    <p class="help-block" style="color: red">${requestScope.ERROR_LOGIN}</p>

                    <input type="submit" class="fadeIn fourth" name="btnAction" value="Login"
                           style="background-color: #929FBA"> 

                    <div class="row justify-content-center">
                        <h5>With your social media account</h5>

                    </div>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/Hana_Shop/LoginGoogleController&response_type=code
                       &client_id=1024742275610-uepvrsiau3kpuqfm4a9tbd2a9nrt83e5.apps.googleusercontent.com&approval_prompt=force" class="icons-sm gplus-ic"> <i class="fa fa-google-plus"></i> Google </a>

                </form>

                <div id="formFooter">
                    <a class="underlineHover" href="MainController?btnAction=Home">Hana Shop</a>
                </div>

            </div>
        </div>
    </body>
</html>
