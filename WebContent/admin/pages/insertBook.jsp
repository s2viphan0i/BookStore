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

<title>Thêm sách mới</title>
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

						<h4 class="box-title">Thêm sản phẩm</h4>
						<div class="card-content">
							<c:url value="/admin/pages/insertBook" var="insertBook"/>
							<form action="${insertBook}" method="post" enctype = "multipart/form-data">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>Tên sách</label> <input type="text"
												class="form-control" name="name" placeholder="Tên sách">
										</div>
										<div class="form-group">
											<label>Tác giả</label> <input type="text"
												class="form-control" name="author" placeholder="Tác giả">
										</div>
										<div class="form-group">
											<label>Hình ảnh</label> <input type="file" name="file"
												id="input-file-now-custom-1" class="dropify"
												data-default-file="http://placehold.it/1000x667" />
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="control-label">Ngày xuất bản</label>
											<div>
												<div class="input-group">
													<input type="text" class="form-control" name="releaseDate"
														placeholder="mm/dd/yyyy" id="datepicker-autoclose">
													<span class="input-group-addon bg-primary text-white"><i
														class="fa fa-calendar"></i></span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label>Danh mục</label>
											<select name="category" class="form-control">
												<c:forEach items="${listCategories}" var="category">
													<option value="${category.id}">${category.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label>Giá thành</label> <input type="text" class="form-control" name="price" placeholder="VND">
										</div>
										<div class="form-group">
											<label>Ghi chú</label>
											<div>
												<textarea class="form-control" id="inp-type-5" name="note"
													placeholder="Viết ghi chú..."></textarea>
											</div>
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