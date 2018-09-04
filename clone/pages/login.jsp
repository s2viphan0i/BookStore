<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Login</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="icon" type="image/ico" href="http://aqvatarius.com/themes/taurus_v12/html/favicon.ico" />
<link href="./admin/css/stylesheets.css" rel="stylesheet" type="text/css" />

<script type='text/javascript' src='./admin/js/plugins/jquery/jquery.min.js'></script>
<script type='text/javascript' src='./admin/js/plugins/jquery/jquery-ui.min.js'></script>
<script type='text/javascript' src='./admin/js/plugins/jquery/jquery-migrate.min.js'></script>
<script type='text/javascript' src='./admin/js/plugins/jquery/globalize.js'></script>
<script type='text/javascript' src='./admin/js/plugins/bootstrap/bootstrap.min.js'></script>
<script type='text/javascript' src='./admin/js/plugins/uniform/jquery.uniform.min.js'></script>
<script type='text/javascript' src='./admin/js/plugins.js'></script>
<script type='text/javascript' src='./admin/js/actions.js'></script>
<script type='text/javascript' src='./admin/js/settings.js'></script>
</head>
<body class="wall-num9">

	<div class="container theme-black container-fixed">

		<div class="login-block">
			<div class="block block-transparent">
				<div class="head">
					<div class="user">
						<div class="info user-change">
							<img src="./admin/img/user.jpg" class="img-circle img-thumbnail" />
						</div>
					</div>
				</div>
				<div class="content controls npt">
					<c:url value="/login" var="loginUrl"/>
					<form action="${loginUrl}" method="post">
						<div class="form-row user-change-row">
							<div class="col-md-12">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="icon-user"></span>
									</div>
									<input type="text" name="username" class="form-control" placeholder="Username" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="icon-key"></span>
									</div>
									<input type="password" name="password" class="form-control" placeholder="Password" />
								</div>
							</div>
						</div>
						<div class="form-row" style="margin-top:20px">
							<div class="col-md-6">
								<input class="btn btn-default btn-block btn-clean" type="submit" value="Login"/>
							</div>
							<div class="col-md-6">
								<div class="btn btn-default btn-block btn-clean">Reset</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12">
								<a href="#" class="btn btn-link btn-block">Forgot your password ?</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

</body>
</html>