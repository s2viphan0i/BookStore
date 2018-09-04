<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Đăng nhập</title>
<link rel="stylesheet" href="./css/style.min.css">
<link rel="stylesheet" href="./plugin/waves/waves.min.css">

</head>

<body>
	<div id="single-wrapper">
		<c:url value="/admin/login" var="loginUrl"/>
		<form action="${loginUrl}" method="POST" class="frm-single">
			<div class="inside">
				<div class="title">
					<strong>Shop</strong>Online
				</div>
				<div class="frm-title">Đăng nhập</div>
				<div class="frm-input">
					<input type="text" name="username" placeholder="Tên đăng nhập" class="frm-inp"><i class="fa fa-user frm-ico"></i>
				</div>
				<div class="frm-input">
					<input type="password" name="password" placeholder="Mật khẩu" class="frm-inp"><i class="fa fa-lock frm-ico"></i>
				</div>
				<div class="clearfix margin-bottom-20">
					<div class="pull-left">
						<div class="checkbox primary">
							<input type="checkbox" id="rememberme"><label for="rememberme">Remember me</label>
						</div>
					</div>
					<div class="pull-right">
						<a href="page-recoverpw.html" class="a-link"><i
							class="fa fa-unlock-alt"></i>Forgot password?</a>
					</div>
				</div>
				<button type="submit" class="frm-submit">
					Login<i class="fa fa-arrow-circle-right"></i>
				</button>
				<a href="page-register.html" class="a-link"><i class="fa fa-key"></i>New
					to this page? Register.</a>
				<div class="frm-footer">NinjaAdmin © 2016.</div>
			</div>
		</form>
	</div>

	<script src="./js/jquery.min.js"></script>
	<script src="./js/modernizr.min.js"></script>
	<script src="./plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="./plugin/nprogress/nprogress.js"></script>
	<script src="./plugin/waves/waves.min.js"></script>
	<script src="./js/main.min.js"></script>
</body>
</html>