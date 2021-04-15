<%-- 
    Document   : ad_GetAllRooms
    Created on : Oct 25, 2020, 12:41:11 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tagliburi = "http://java.sun.com/jsp/jstl/fmt"  prefix = "fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style><%@include file="css/admin.css" %> </style>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER.roleID !='AD'}">
            <c:redirect url="MainController?btnAction=Logout"></c:redirect>
        </c:if>
        <jsp:include page="ad_header.jsp"></jsp:include>
            <div class="container-fluid main-container">
                <div class="col-md-2 sidebar">
                    <div class="row">
                        <!-- uncomment code for absolute positioning tweek see top comment in css -->
                        <div class="absolute-wrapper"> </div>
                        <!-- Menu -->
                    <jsp:include page="ad_left.jsp"></jsp:include>
                    </div>  		
                </div>
                <div class="col-md-10 content">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <nav class="navbar navbar-expand-lg navbar-dark mdb-color lighten-3 mt-3 mb-5">

                                <!-- Navbar brand -->
                                <div class="collapse navbar-collapse" id="basicExampleNav">

                                    <!-- Links -->
                                   
                                All Foods  <a href="MainController?btnAction=Create_Food_Page">New Food</a>
                                <form action="MainController">
                                    1 <input id="rangeInput"type="range" min="1" max="1000" oninput="amount.value=rangeInput.value" step="5" value="${sessionScope.PriceCheck}" />
                                    <input id="amount" type="number"  value="${sessionScope.PriceCheck}" name="txtPriceCheck" min="1" max="1000" oninput="rangeInput.value=amount.value" />

                                    Category:
                                    <select name="txtCategory">
                                        <c:set var="typeFood" value="${param.txtCategory}"></c:set>
                                            <option>All</option>
                                        <c:forEach var="type" items="${sessionScope.LIST_TYPE}">
                                            <option value="${type.typeID}" <c:if test="${type.typeID == typeFood}">selected</c:if>>
                                                ${type.typeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <input type="text" name="txtSearch" placeholder="Search"value="${param.txtSearch}"/>
                                    <input type="submit" name="btnAction" value="SearchAD"/>

                                </form>
                            </div>
                            <!-- Collapsible content -->
                        </nav>
                    </div>
                    <div class="panel-body">
                        <c:set var="list" value="${sessionScope.PAGE_FOODS}"></c:set>
                        <c:if test="${not empty list}">

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">FOOD ID</th>
                                        <th scope="col">IMAGE</th>
                                        <th scope="col">FOOD NAME</th>
                                        <th scope="col">DESCRIPTION</th>
                                        <th scope="col">CREATE DATE</th>
                                        <th scope="col">CATEGORY</th>
                                        <th scope="col">QUANTITY</th>
                                        <th scope="col" class="text-right">PRICE</th>
                                        <th scope="col" class="text-right">STATUS</th>
                                        <th scope="col" class="text-right">EDIT</th>
                                        <th scope="col" class="text-right">DELETE</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="e" items="${list}" varStatus="counter">
                                    <form action="MainController">
                                        <tr> 
                                            <td> ${e.foodID}</td>
                                            <td> <img src="${e.image}" alt="img" width="100" height="100"> </td>
                                            <td> ${e.foodName}</td>
                                            <td> ${e.des}</td>
                                            <td> <fmt:formatDate pattern = "dd-MM-yyyy"  value="${e.createDate}"/></td>
                                            <td>${e.category}</td>
                                            <td>${e.quantity}</td>
                                            <td class="text-right">${e.price}</td>
                                            <td class="text-right">
                                                <c:choose >
                                                    <c:when test="${e.status == true}">
                                                        <p style="color: blue">Active</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p style="color: red">InActive</p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-right"> 
                                                <input type="hidden" name="txtFoodID" value="${e.foodID}">
                                                <input type="submit" name="btnAction" value="Edit" class="btn btn-success">
                                            </td>
                                            <td>    
                                                <c:if test="${e.status == true}">
                                                    <button class="btn  btn-danger"type="submit" name="btnAction" onclick="return confirm('Do you want to delete food?')" value="DeleteFood">Delete </button>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>


                                </tbody>
                            </table> 



                            <table border="1" style="margin: auto">
                                <c:url var="nextpage" value="MainController">
                                    <c:param name="txtPriceCheck" value="${param.txtPriceCheck}"></c:param>
                                    <c:param name="txtSearch" value="${param.txtSearch}"></c:param>
                                    <c:param name="btnAction" value="SearchAD"></c:param>
                                    <c:param name="txtCategory" value="${param.txtCategory}"></c:param>
                                </c:url>
                                <tr>
                                    <c:if test="${requestScope.currentPage != 1}">
                                        <td> <a  style="float: left" href="${nextpage}&page=${requestScope.currentPage - 1}">Previous</a></td>
                                    </c:if>
                                    <c:forEach begin="1" end="${noOfPages}" var="i">
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
                        </c:if>
                    </div>
                </div>
            </div>
            <footer class="pull-left footer">
                <p class="col-md-12">
                <hr class="divider">
                Copyright &COPY; 2015 <a href="#">Gravitano</a>
                </p>
            </footer>
        </div>
    </body>
</html>
