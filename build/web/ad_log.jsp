<%-- 
    Document   : ad_GetAllRooms
    Created on : Oct 25, 2020, 12:41:11 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            All Logs  
                        </div>
                        <div class="panel-body">
                        <c:set var="list" value="${sessionScope.LIST_LOG}"></c:set>
                        <c:if test="${not empty list}">

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">LOG ID</th>
                                        <th scope="col">USER ID</th>
                                        <th scope="col">ACTION</th>
                                        <th scope="col">DESCRIPTION</th>
                                        <th scope="col">CREATE DATE</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="e" items="${list}" varStatus="counter">
                                    <form action="MainController">
                                        <tr> 
                                            <td> ${e.id}</td>
                                            <td> ${e.userID}</td>
                                            <td> ${e.act}</td>
                                            <td> ${e.des}</td>
                                            <td> ${e.actionDate}</td>
                                        </tr>
                                    </form>
                                </c:forEach>


                                </tbody>
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
