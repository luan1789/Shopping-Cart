<%-- 
    Document   : ad_header
    Created on : Jan 8, 2021, 10:09:45 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.LOGIN_USER.roleID !='AD'}">
    <c:redirect url="MainController?btnAction=Logout"></c:redirect>
</c:if>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <a class="navbar-brand" href="admin.jsp">
                Administrator
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      

            <ul class="nav navbar-nav navbar-right">
                <li >
                    <a href="MainController?btnAction=Logout">
                        Logout</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>