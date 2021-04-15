<%-- 
    Document   : product
    Created on : Jan 4, 2021, 10:29:48 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>

            <!--Main layout-->
            <main class="mt-5 pt-4">
                <div class="container dark-grey-text mt-5">

                    <!--Grid row-->
                    <div class="row wow fadeIn">

                        <!--Grid column-->
                        <div class="col-md-6 mb-4">

                            <img src="${sessionScope.FOOD.image}" class="img-fluid" alt="">

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                        <!--Content-->
                        <div class="p-4">

                            <div class="mb-3">
                                <a href="">
                                    <span class="badge purple mr-1">${sessionScope.FOOD.category}</span>
                                </a>
                                <a href="">
                                    <span class="badge blue mr-1">New</span>
                                </a>
                                <a href="">
                                    <span class="badge red mr-1">Bestseller</span>
                                </a>
                            </div>

                            <p class="lead">
                                <span class="mr-1">
                                    <del>${sessionScope.FOOD.price+1}</del>
                                </span>
                                <span>${sessionScope.FOOD.price}</span>
                            </p>
                            <p>${sessionScope.FOOD.foodName}</p>
                            <p class="lead font-weight-bold">Description</p>

                            <p>${sessionScope.FOOD.des}</p>

                            <form class="d-flex justify-content-left" action="MainController">
                                <!-- Default input -->
                                <input type="number" min="1"value="1" aria-label="Search" class="form-control" name="txtQuantity"style="width: 100px">
                                <input type="hidden" name="txtFoodID" value="${sessionScope.FOOD.foodID}">
                                <button class="btn btn-primary btn-md my-0 p" name="btnAction" value="Add" type="submit">Add to cart
                                    <i class="fas fa-shopping-cart ml-1"></i>
                                </button>

                            </form>

                        </div>
                        <!--Content-->

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <hr>

                <!--Grid row-->
                <div class="row d-flex justify-content-center wow fadeIn">

                    <!--Grid column-->
                    <div class="col-md-6 text-center">

                        <h4 class="my-4 h4">Product often purchased together</h4>


                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->
                <c:set var="list" value="${sessionScope.RECOMMEN}"></c:set>
                <c:if test="${list !=null}">
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
                </c:if>
                <!--Grid row-->

            </div>
        </main>
        <!--Main layout-->

        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">

            <!--Call to action-->
            <!--/.Call to action-->

            <!--Copyright-->
            <div class="footer-copyright py-3">
                © 2018 Copyright:
                <a href="https://mdbootstrap.com/education/bootstrap/" target="_blank"> MDBootstrap.com </a>
            </div>
            <!--/.Copyright-->

        </footer>
        <!--/.Footer-->
    </body>
</html>
