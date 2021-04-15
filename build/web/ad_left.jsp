<%-- 
    Document   : ad_left
    Created on : Jan 8, 2021, 10:27:37 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="side-menu">
    <nav class="navbar navbar-default" role="navigation">
        <!-- Main Menu -->
        <div class="side-menu-container">
            <ul class="nav navbar-nav">
                <li class="active"><a href="admin.jsp"><span class="glyphicon glyphicon-dashboard"></span> Dashboard</a></li>
                <li><a href="MainController?btnAction=SearchAD&txtCategory=All&txtSearch="><span class="glyphicon glyphicon-home"></span> All Foods</a></li>
                <li><a href="MainController?btnAction=List_log"><span class="glyphicon glyphicon-tasks"></span> History</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-signal"></span> Link</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>

</div>
