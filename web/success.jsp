<%-- 
    Document   : index
    Created on : Jan 4, 2021, 9:19:12 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
        <script type="text/javascript" src="/js/home.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <!--Carousel Wrapper-->
            <div id="carousel-example-1z" class="carousel slide carousel-fade pt-4" data-ride="carousel">

                <!--Indicators-->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
                </ol>
                <!--/.Indicators-->

                <!--Slides-->
                <div class="carousel-inner" role="listbox">

                    <!--First slide-->
                    <div class="carousel-item active">
                        <div class="view" style="background-image: url('https://phanmembanhanghcm.com/upload/images/checklist-khoi-nghiep-trong-linh-vuc-kinh-doanh-fast-food.jpg'); background-repeat: no-repeat; background-size: cover;">

                            <!-- Mask & flexbox options-->
                            <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                                <!-- Content -->
                                <div class="text-center white-text mx-5 wow fadeIn">
                                    <h1 class="mb-4">
                                        <strong>Welcome to Hana Shop</strong>
                                    </h1>

                                    <p>
                                        <strong>Best & free guide of responsive web design</strong>
                                    </p>

                                    <p class="mb-4 d-none d-md-block">
                                        <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and written versions
                                            available. Create your own, stunning website.</strong>
                                    </p>

                                    <a href="#" class="btn btn-outline-white btn-lg">Let's start
                                        <i class="clearfix d-none d-sm-inline-block"></i>
                                    </a>
                                </div>
                                <!-- Content -->

                            </div>
                            <!-- Mask & flexbox options-->

                        </div>
                    </div>
                    <!--/First slide-->



                </div>
                <!--/.Slides-->

                <!--Controls-->
                <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <!--/.Controls-->

            </div>
            <!--/.Carousel Wrapper-->

            <!--Main layout-->
            <main>
                <div class="container">
                    <div class="col-sm-12  col-md-6" style="text-align: center;margin: auto" >
                        <h1>Payment Done. Thank you for purchasing our products</h1>
                        <h2>Thank You ${sessionScope.LOGIN_USER.fullname}</h2>
                    <a href="MainController?btnAction=Home"
                       class="btn btn-block btn-light">Shopping</a>
                </div>


            </div>
        </main>
        <!--Main layout-->

        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">

            <!--Call to action-->
            <div class="pt-4">

            </div>
            <!--/.Call to action-->

            <hr class="my-4">

            <!-- Social icons -->
            <div class="pb-4">
                <a href="#">
                    <i class="fab fa-facebook-f mr-3"></i>
                </a>

                <a href="#">
                    <i class="fab fa-twitter mr-3"></i>
                </a>

                <a href="#">
                    <i class="fab fa-youtube mr-3"></i>
                </a>
                <a href="#">
                    <i class="fab fa-google-plus-g mr-3"></i>
                </a>

                <a href="#">
                    <i class="fab fa-dribbble mr-3"></i>
                </a>

                <a href="#">
                    <i class="fab fa-pinterest mr-3"></i>
                </a>

                <a href="#">
                    <i class="fab fa-github mr-3"></i>
                </a>

                <a href="#">
                    <i class="fab fa-codepen mr-3"></i>
                </a>
            </div>
            <!-- Social icons -->

            <!--Copyright-->
            <div class="footer-copyright py-3">
                © 2018 Copyright:
                <a href="#"> MDBootstrap.com </a>
            </div>
            <!--/.Copyright-->

        </footer>
        <!--/.Footer-->

    </body>

</html>
