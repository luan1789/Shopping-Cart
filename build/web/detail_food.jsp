<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <style><%@include file="css/admin.css" %> </style>
        <style>
            #image{
                float: right;
                margin-right: 10px; 
                width: 400px;
                height: 300px;
            }

        </style>
        <script type="text/javascript">
            function displayImg() {
                var image = document.getElementById('image');
                image.src = document.getElementById('txtImage').value;
            }
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#image')
                                .attr('src', e.target.result)

                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
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
                        <div class="absolute-wrapper">
                        <jsp:include page="ad_left.jsp"></jsp:include>
                        </div>
                    </div>  		
                </div>
                <div class="col-md-10 content">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2>Detail Food</h2>
                        </div>
                        <div class="panel-body">

                            <img id="image" src="${requestScope.FOOD.image}">
                        <form class="form-horizontal" action='UpdateFoodController' method="POST" enctype="multipart/form-data"  >
                            <fieldset >
                                <div class="control-group">
                                    <!-- Username -->
                                    <label class="control-label" >Image</label>
                                    <div class="controls">
                                        <input type="hidden" name="txtImageOld" value="${requestScope.FOOD.image}"><br>
                                        <input type="file" name="txtImage"onchange="readURL(this);" accept="image/gif, image/jpeg, image/png" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <!-- Username -->
                                    <label class="control-label" >Food ID</label>
                                    <div class="controls">
                                        <input type="text" id="username" name="txtFoodID"  value="${requestScope.FOOD.foodID}" class="input-xlarge" readonly="true">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <!-- E-mail -->
                                    <label class="control-label" >Food Name</label>
                                    <div class="controls">
                                        <input required type="text" id="username" name="txtFoodName"  value="${requestScope.FOOD.foodName}" class="input-xlarge">
                                    </div>
                                </div>


                                <div class="control-group">
                                    <!-- Password-->
                                    <label class="control-label" >CATEGORY</label>
                                    <div class="controls">
                                        <select name="txtCategory">
                                            <c:if test="${sessionScope.LIST_TYPE!=null}">
                                                <c:set var="typeFood" value="${requestScope.FOOD.category}"></c:set>
                                                <c:forEach var="type" items="${sessionScope.LIST_TYPE}">
                                                    <option value="${type.typeID}" <c:if test="${type.typeName == typeFood}">selected</c:if>>
                                                        ${type.typeID}-${type.typeName}
                                                    </option>
                                                </c:forEach>
                                            </c:if>

                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <!-- Password -->
                                    <label class="control-label"  >PRICE </label>
                                    <div class="controls">
                                        <input required type="text" id="password_confirm" name="txtPrice" value="${requestScope.FOOD.price}" class="input-xlarge" pattern="^[+]?\d*\.?\d*$">
                                        <p class="help-block">${requestScope.FOOD_ERROR.priceError} </p>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <!-- Password -->
                                    <label class="control-label"  >QUANTITY </label>
                                    <div class="controls">
                                        <input required type="number"  required id="password_confirm" name="txtQuantity" value="${requestScope.FOOD.quantity}" class="input-xlarge" min="1">
                                    </div>
                                </div>
                                <div class="controls">
                                    <label class="control-label"  >STATUS </label>
                                    <div class="controls">
                                        <select name="txtStatus">
                                            <c:set var="status" value="${requestScope.FOOD.status}"></c:set>
                                            <option value="true" <c:if test="${status == true}">selected</c:if>>
                                                    Active
                                                </option>
                                                <option value="false"<c:if test="${status == false}">selected</c:if>>
                                                    InActive
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <!-- roleID -->
                                        <label class="control-label"  >DESCRIPTION</label>
                                        <div class="controls">
                                            <input type="text" required id="username" name="txtDes"  value="${requestScope.FOOD.des}" class="input-xlarge" >
                                    </div>
                                </div>
                                <div class="control-group">
                                    <br>
                                    <!-- Button -->
                                    <div class="controls">

                                        <input class="btn btn-success"type="submit" name="btnAction" value="UpdateFood">
                                    </div>
                                </div>
                            </fieldset>

                        </form>
                        </body>                      

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


