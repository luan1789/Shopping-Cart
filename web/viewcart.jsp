<%-- 
    Document   : viewcart
    Created on : Jan 4, 2021, 10:00:13 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
        <style>
            footer {
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
        <c:if test="${sessionScope.LOGIN_USER.roleID !='US'}">
            <c:redirect url="MainController?btnAction=Login"></c:redirect>
        </c:if>
        <jsp:include page="header.jsp"></jsp:include>

            <!--Main layout-->
            <main class="mt-5 pt-4">
                <div class="container wow fadeIn">

                <c:set var="cart" value="${sessionScope.CART}"></c:set>
                <c:if test="${not empty cart && cart.cart.size()>0 }">

                    <!-- Heading -->
                    <h2 class="my-5 h2 text-center">Checkout form</h2>

                    <!--Grid row-->
                    <div class="row">
                        <h2 style="margin: auto"> ${requestScope.ERROR_CHECKOUT}</h2>
                        <!--Grid column-->
                        <div class="col-md-12 mb-4">

                            <!--Card-->
                            <div class="card">

                                <!--Card content-->
                                <form class="card-body" action="MainController" method="POST">


                                    <!-- Heading -->
                                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                                        <span class="text-muted">Your cart</span>
                                        <span class="badge badge-secondary badge-pill">${sessionScope.CART.cart.size()}</span>
                                    </h4>

                                    <!-- Cart -->
                                    <h2 style="text-align: center">${requestScope.OUT_OF}</h2>
                                    <ul class="list-group mb-3 z-depth-1">
                                        <table border="0">
                                            <thead>
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Name</th>
                                                    <th>Description</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>
                                                    <th>Delete</th>
                                                    <th>Update</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="total" value="0" scope="request"></c:set>
                                                <c:forEach var="f" items="${cart.cart.values()}" varStatus="counter">
                                                    <c:set var="total" value="${total + f.price*f.quantity}" scope="request"></c:set>
                                                    <form action="MainController">
                                                        <tr>
                                                            <td>
                                                                <input type="hidden" name="txtFoodID" value="${f.foodID}">
                                                            <img src="${f.image}" style="height: 50px;width: 40px" />
                                                        </td>
                                                        <td>
                                                            ${f.foodName}
                                                        </td>
                                                        <td>
                                                            ${f.des}
                                                        </td>
                                                        <td>
                                                            ${f.price}
                                                        </td>

                                                        <td>
                                                            <input type="number" name="txtQuantity" value="${f.quantity}">
                                                        </td>
                                                        <td>
                                                            ${f.quantity*f.price}
                                                        </td>
                                                        <td><input type="submit"  name="btnAction"value="Delete"onclick="return confirm('Do you want to delete food?')"></td>
                                                        <td><input type="submit"  name="btnAction"value="Update"></td>

                                                    </tr>
                                                </form>   
                                            </c:forEach>


                                            </tbody>
                                        </table>  

                                        <li class="list-group-item d-flex justify-content-between">
                                            <span>Total Money</span>
                                            <strong>${total}</strong>
                                        </li>
                                    </ul><!--
                                    <!-- Cart -->

                                    <hr>
                                    <form action="MainController">
                                        <div class="d-block my-3">
                                            <div class="custom-control custom-radio">
                                                <input id="credit" name="paymentMethod" value="Cash"type="radio" class="custom-control-input" checked required>
                                                <label class="custom-control-label" for="credit">Cash</label>
                                            </div>

                                            <div class="custom-control custom-radio">
                                                <input id="paypal" name="paymentMethod" value="Paypal" type="radio" class="custom-control-input" required>
                                                <label class="custom-control-label" for="paypal">Paypal</label>
                                            </div>
                                        </div>

                                        <hr class="mb-4">
                                        <input type="hidden" name="total" value="${total}" />
                                        <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnAction" value="Checkout">Order</button>
                                    </form>
                            </div>
                            <!--/.Card-->
                        </div>

                    </div>
                    <!--Grid row-->
                </c:if>
                <c:if test="${(cart==null) or (cart.cart.size()== 0)}">
                    <div class="col-sm-12  col-md-6" style="text-align: center;margin: auto" >
                        <h1>CART EMPTY</h1>
                        <a href="MainController?btnAction=Search&txtCategory=All&txtSearch=" 
                           class="btn btn-block btn-light">Shopping</a>
                    </div>
                </c:if>
            </div>

        </main>
        <!--Main layout-->

        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">



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
