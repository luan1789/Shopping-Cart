<%-- 
    Document   : detailOrder
    Created on : Jan 10, 2021, 1:11:31 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
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

                <c:set var="order" value="${requestScope.ORDER_DETAIL}"></c:set>
                <c:if test="${order!=null}">

                    <!-- Heading -->
                    <h2 class="my-5 h2 text-center">History Shopping</h2>

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12 mb-4">

                            <!--Card-->
                            <div class="card">

                                <!--Card content-->
                                <!-- Heading -->
                                <h4 class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="text-muted">Order ID:${order.orderID}  Total Money: ${order.totalMoney}</span>
                                </h4>

                                <!-- Cart -->
                                <ul class="list-group mb-3 z-depth-1">
                                    <table border="0">
                                        <thead>
                                            <tr> 
                                                <th>No</th>
                                                <th>Food Name</th>
                                                <th>Image</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="f" items="${order.listFood}" varStatus="counter">
                                                <tr>
                                                    <td>
                                                        ${counter.count}
                                                    </td>
                                                    <td>
                                                        ${f.foodName}
                                                    </td>
                                                    <td>
                                                        <img src="${f.image}" style="height: 50px;width: 40px" />
                                                    </td>
                                                    <td>
                                                        ${f.quantity}
                                                    </td>
                                                    <td>
                                                        ${f.price}
                                                    </td>
                                                    <td>
                                                        ${f.price*f.quantity}
                                                    </td>
                                                </tr>
                                            </c:forEach>


                                        </tbody>
                                    </table>  

                                </ul>
                            </div>


                        </div>
                        <!--Grid row-->
                    </c:if>
                    <c:if test="${order==null}">
                        <div class="col-sm-12  col-md-6" style="text-align: center;margin: auto" >
                            <h1>NO DATA</h1>
                            <a href="MainController?btnAction=Home"
                               class="btn btn-block btn-light">Shopping</a>
                        </div>
                    </c:if>
                </div>

        </main>
        <!--Main layout-->

        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">


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
