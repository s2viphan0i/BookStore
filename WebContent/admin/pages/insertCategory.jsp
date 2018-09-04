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

<title>Thêm danh mục mới</title>
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

						<h4 class="box-title">Thêm danh mục</h4>
						<div class="card-content">
							<c:url value="/admin/pages/insertCategory" var="insertCategory"/>
							<form action="${insertCategory}" method="post">
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label>Tên danh mục</label> <input type="text"
												class="form-control" name="name" placeholder="Tên danh mục">
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