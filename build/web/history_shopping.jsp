<%-- 
    Document   : history_shopping
    Created on : Jan 10, 2021, 12:03:31 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tagliburi = "http://java.sun.com/jsp/jstl/fmt"  prefix = "fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Shopping</title>
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

                <c:set var="list" value="${sessionScope.HISTORY}"></c:set>
                <%--<c:if test="${not empty list }">--%>
                <c:if test="${list!=null }">

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
                                    <span class="text-muted">${sessionScope.LOGIN_USER.fullname}</span>
                                    <jsp:useBean id="maxDate"  class="java.util.Date"></jsp:useBean>
                                    <form action="MainController">
                                        <input type="date"   max="<fmt:formatDate pattern = "yyyy-MM-dd"  value="${maxDate}"/>" name="txtDate" value="${param.txtDate}">
                                        <input  type="text" name="txtHistotrySearch" value="${param.txtHistotrySearch}"/>
                                        <button  type="submit" name="btnAction" value="Search_Histoty">Search</button>
                                    </form>
                                </h4>
                                <form class="card-body" action="MainController" method="POST">

                                    <!-- Cart -->
                                    <ul class="list-group mb-3 z-depth-1">
                                        <table border="0">
                                            <thead>
                                                <tr> 
                                                    <th>Order ID</th>
                                                    <th>Total Money</th>
                                                    <th>Date</th>
                                                    <th>Detail</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="f" items="${list}" varStatus="counter">
                                                <form action="MainController">
                                                    <tr>
                                                        <td>
                                                            ${f.orderID}
                                                        </td>
                                                        <td>
                                                            ${f.totalMoney}
                                                        </td>
                                                        <td> <fmt:formatDate pattern = "dd-MM-yyyy"  value="${f.orderDate}"/></td>
                                                        <td> 
                                                            <input type="hidden" name="txtOrderID" value="${f.orderID}" >
                                                            <input type="submit"  name="btnAction"value="Detail">
                                                        </td>
                                                    </tr>
                                                </form>   
                                            </c:forEach>


                                            </tbody>
                                        </table>  

                                    </ul>
                            </div>


                        </div>
                        <!--Grid row-->
                    </c:if>
                    <c:if test="${(list==null) or (list.size()== 0)}">
                        <div class="col-sm-12  col-md-6" style="text-align: center;margin: auto" >
                            <h1>NO HISTORY</h1>
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
