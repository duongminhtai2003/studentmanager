<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>VNE Login</title>
    <link rel="shortcut icon" type="image/ico" href="<%=request.getContextPath()%>/templates/auth/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/templates/auth/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/templates/auth/css/style1.css" rel="stylesheet">
  </head>
  <body>
  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="index.html">VNE-Admin</a></h1>
	              </div>
	           </div>
	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12"></div>
	              </div>
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>
<!-- /.header -->

	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			        <form action="<%=request.getContextPath()%>/auth/login" method="POST">
			            <div class="content-wrap">
			            	<img width="100px" height="100px" class="img-circle" src="<%=request.getContextPath()%>/templates/auth/images/icon-180x180.png">
			                <h6>Đăng nhập</h6>
			                
			                <c:if test="${not empty msg}">
			                	<h5 style="color: red">Sai username hoặc password</h5>
			                </c:if>
			                
			                <div class="form-group">
			                	<label class="text-left pull-left" for="username">Tên đăng nhập</label>
			               		<input class="form-control" type="text" placeholder="Username" name="username">
			                </div>
			                
			                <div class="form-group">
			                	<label class="text-left pull-left" for="password">Mật khẩu</label>
			                	<input class="form-control" type="password" placeholder="Password" name="password">
			                </div>
			                
			                <div class="action">
			                	<input type="submit" value="login" class="btn btn-primary signup btn-block">
			                </div>                
			            </div>
			            </form>
			        </div>
			    </div>
			</div>
		</div>
	</div>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=request.getContextPath()%>/templates/auth/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/templates/auth/js/custom.js"></script>
  </body>
</html>