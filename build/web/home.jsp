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
        <script>
            $('#fixednav ul li a').click(function () {
                $('#fixednav ul li a').removeClass('active');
                $(this).addClass('active');
            });
        </script>
        <style>
            .footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                color: white;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <!--<div id="page-container">-->
        <jsp:include page="header.jsp"></jsp:include>
        <c:set var="list" value="${sessionScope.LIST_FOOD}"></c:set>
        <c:if test="${list ==null}">
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

                                    <a href="MainController?btnAction=Search&txtCategory=All&txtSearch=" class="btn btn-outline-white btn-lg">Let's start
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

            </div>
        </c:if>
        <!--/.Carousel Wrapper-->

        <!--Main layout-->
        <main style="margin-top: 80px">

            <c:if test="${list !=null}">
                <div class="container">

                    <nav class="navbar navbar-expand-lg navbar-dark mdb-color lighten-3 mt-3 mb-5">

                        <!-- Navbar brand -->
                        <span class="navbar-brand">Categories:</span>
                        <div class="collapse navbar-collapse" id="basicExampleNav">

                            <!-- Links -->
                            <form class="form-inline" action="MainController">

                                <ul class="navbar-nav mr-auto" id="fixedbar">
                                    <select name="txtCategory">
                                        <c:if test="${sessionScope.LIST_TYPE!=null}">
                                            <c:set var="typeFood" value="${param.txtCategory}"></c:set>
                                            <option value="All" >
                                                    All
                                                </option>
                                            <c:forEach var="type" items="${sessionScope.LIST_TYPE}">
                                                <option value="${type.typeID}" <c:if test="${type.typeID == typeFood}">selected</c:if>>
                                                    ${type.typeName}
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </ul>
                                1 <input id="rangeInput" type="range" min="1" max="1000" oninput="amount.value=rangeInput.value" step="5" value="${sessionScope.PriceCheck}" />
                                <input id="amount" type="number"  value="${sessionScope.PriceCheck}" name="txtPriceCheck" min="1" max="1000" oninput="rangeInput.value=amount.value" />
                                <div class="md-form my-0">
                                    <input class="form-control mr-sm-2" type="text"placeholder="Search" name="txtSearch" value="${param.txtSearch}"aria-label="Search">
                                    <input type="submit"  name="btnAction" value="Search">
                                </div>
                            </form>
                        </div>
                        <!-- Collapsible content -->
                    </nav>
                    <!--Section: Products v.3-->
                    <section class="text-center mb-4">
                        <!--Grid row-->
                        <div class="row wow fadeIn">
                            <c:forEach var="food" items="${list}"> 
                                <!--Grid column-->
                                <div class="col-lg-3 col-md-6 mb-5">
                                    <!--Card-->
                                    <div class="card h-100">
                                        <!--Card image-->
                                        <div class="view overlay">
                                            <img src="${food.image}" class="card-img-top" alt="">
                                            <a href="MainController?btnAction=Food_page&foodID=${food.foodID}">
                                                <div class="mask rgba-white-slight"></div>
                                            </a>
                                        </div>
                                        <!--Card image-->
                                        <!--Card content-->
                                        <div class="card-body text-center">
                                            <!--Category & Title-->
                                            <a href="" class="grey-text">
                                                <h5>${food.category} </h5>
                                            </a>
                                            <h5>
                                                <strong>
                                                    <a href="" class="dark-grey-text">${food.foodName}
                                                        <span class="badge badge-pill danger-color">NEW</span>
                                                    </a>
                                                </strong>
                                            </h5>
                                            <h4 class="font-weight-bold blue-text">
                                                <strong>${food.price}</strong>
                                            </h4>
                                        </div>
                                        <!--Card content-->

                                    </div>
                                    <!--Card-->
                                </div>
                            </c:forEach>

                        </div>
                        <!--Grid row-->

                    </section>

                    <!--Pagination-->
                    <nav class="d-flex justify-content-center wow fadeIn">
                        <ul class="pagination pg-blue">
                            <c:url var="nextpage" value="MainController">
                                <c:param name="txtPriceCheck" value="${param.txtPriceCheck}"></c:param>
                                <c:param name="txtSearch" value="${param.txtSearch}"></c:param>
                                <c:param name="btnAction" value="Search"></c:param>
                                <c:param name="txtCategory" value="${param.txtCategory}"></c:param>
                            </c:url>
                            <table border="1" style="margin: auto;margin-bottom: 50px">
                                <tr>
                                    <c:if test="${requestScope.currentPage > 1}">
                                        <td> <a  style="float: left" href="${nextpage}&page=${requestScope.currentPage - 1}">Previous</a></td>
                                    </c:if>

                                    <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                                        <c:choose >
                                            <c:when test="${requestScope.currentPage == i}">
                                                <td style="width: 20px;color: red">${i}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="width: 20px"><a href="${nextpage}&page=${i}">${i}</a></td>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${requestScope.currentPage < requestScope.noOfPages}">
                                        <td ><a style="float: right" href="${nextpage}&page=${requestScope.currentPage + 1}">Next</a></td>
                                    </c:if>        
                                </tr>
                            </table>
                        </ul>
                    </nav>
                    <!--Pagination-->

                </div>
            </c:if>

        </main>
        <!--Main layout-->

        <!--Footer-->
        <div class="footer">
            <footer class="page-footer text-center font-small mt-4 wow fadeIn">

                <!--/.Call to action-->


                <!--Copyright-->
                <div class="footer-copyright py-3">
                    © 2018 Copyright:
                    <a href="#"> MDBootstrap.com </a>
                </div>
                <!--/.Copyright-->

            </footer>
            <!--/.Footer-->
        </div>
    </body>

</html>
