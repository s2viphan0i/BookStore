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

<title>Thêm người dùng mới</title>
<jsp:include page="head.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="leftMenu.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">
		<div class="main-content">
			<div class="row small-spacing">
				<div class="col-lg-12">
					<div class="box-content card white">

						<h4 class="box-title">Thêm người dùng</h4>
						<div class="card-content">
							<c:url value="/admin/pages/insertUser" var="insertUser"/>
							<form action="${insertUser}" method="post">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>Tên đăng nhập</label> <input type="text"
												class="form-control" name="username" placeholder="Tên đăng nhập">
										</div>
										<div class="row">
											<div class="form-group col-lg-6">
												<label>Mật khẩu</label> <input type="password"
													class="form-control" name="password" placeholder="Mật khẩu">
											</div>
											<div class="form-group col-lg-6">
												<label>Nhập lại mật khẩu</label> <input type="password"
													class="form-control" name="repassword" placeholder="Nhập lại mật khẩu">
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>Họ và tên</label> <input type="text"
												class="form-control" name="fullname" placeholder="Họ và tên">
										</div>
										<div class="form-group">
											<label>Chức năng</label>
											<select name="role" class="form-control">
												<option value="1">Người dùng</option>
												<option value="2">Nhân viên</option>
											</select>
										</div>
										<button type="submit" class="btn btn-primary btn-sm waves-effect waves-light pull-right">Submit</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/modernizr.min.js"></script>
	<script src="../plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="../plugin/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="../plugin/nprogress/nprogress.js"></script>
	<script src="../plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="../plugin/waves/waves.min.js"></script>
	<script src="../plugin/fullscreen/jquery.fullscreen-min.js"></script>
	<script src="../plugin/dropify/js/dropify.min.js"></script>
	<script src="../plugin/datepicker/js/bootstrap-datepicker.min.js"></script>
	<script src="../js/fileUpload.demo.min.js"></script>
	<script src="../js/main.min.js"></script>
	<script src="../plugin/touchspin/jquery.bootstrap-touchspin.min.js"></script>
	<script src="../js/form.demo.min.js"></script>
</body>
</html>