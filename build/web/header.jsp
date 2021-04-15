<%-- 
    Document   : header
    Created on : Jan 4, 2021, 10:09:24 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
    <div class="container">

        <!-- Brand -->
        <a class="navbar-brand waves-effect" href="#">
            <strong class="blue-text">HANA</strong>
        </a>

        <!-- Collapse -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <!-- Left -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link waves-effect" href="MainController?btnAction=Search&txtCategory=All&txtSearch=">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect" href="#">About Hana</a>
                </li>
         
            </ul>

            <!-- Right -->
            <ul class="navbar-nav nav-flex-icons">
                <li class="nav-item">
                    <a class="nav-link waves-effect" href="MainController?btnAction=View">
                        <c:set  var="size" value="${sessionScope.CART.cart.size()}"></c:set>
                        <c:if test="${empty size}">
                            <span class="badge red z-depth-1 mr-1"> 0 </span>
                        </c:if>
                        <c:if test="${ not empty size}">
                            <span class="badge red z-depth-1 mr-1"> ${size} </span>
                        </c:if>
                        <i class="fas fa-shopping-cart"></i>
                        <span class="clearfix d-none d-sm-inline-block"> Cart </span>
                    </a>
                </li>

                <li class="nav-item">
                    <c:set var="login" value="${sessionScope.LOGIN_USER.fullname}"></c:set>
                    <c:if test="${not empty login}">
                    <li class="nav-item">
                        <a href="MainController?btnAction=Histoty" class="nav-link waves-effect" >
                            History
                        </a>
                    </li>
                    <a href="#" class="nav-link border border-light rounded waves-effect"
                       >
                        <i class="fab fa-github mr-2"></i>${login}
                    </a> 

                    <li class="nav-item">
                        <a href="MainController?btnAction=Logout" class="nav-link  border border-light rounded waves-effect">
                            LogOut
                        </a>
                    </li>
                </c:if>
                <c:if test="${ empty login}">
                    <a href="MainController?btnAction=LoginPage" class="nav-link border border-light rounded waves-effect"
                       >
                        <i class="fab fa-github mr-2"></i>Login
                    </a> 
                </c:if>

                </li>
            </ul>

        </div>

    </div>
</nav>
