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
<title>Datatables - Ninja Admin Template</title>
<jsp:include page="head.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="leftMenu.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="wrapper">
		<div class="main-content">
			<div class="row small-spacing">
				<div class="col-lg-12 col-xs-12">
					<div class="box-content">
						<h4 class="box-title pull-left">Danh sách thể loại</h4>
						<c:url value="/admin/pages/searchCategory" var="searchCategory"></c:url>
						<form action="${searchCategory}" id="searchform-header"
							class="searchform js__toggle pull-right">
							<input type="search" placeholder="Tìm kiếm..." name="key" value="${key}"
								class="input-search">
							<button class="fa fa-search button-search" type="submit"></button>
						</form>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th width="10%">#</th>
									<th>Tên thể loại</th>
									<th width="10%">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listCategories}" var="category">
									<tr>
										<th scope="row">${category.id}</th>
										<td class="vertical-align"><c:out value="${category.name}"/></td>
										<td style="text-align:center">
											<c:url value="/admin/pages/editCategory?id=${category.id}" var="editCategory"/>
											<a href="${editCategory}"><i class="far fa-edit"></i></a>
											<c:url value="/admin/pages/deleteCategory?id=${category.id}" var="deleteCategory"/>
											<a href="${deleteCategory}"><i class="far fa-trash-alt" style="color:#e74c3c"></i></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		<!-- /.main-content -->
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/modernizr.min.js"></script>
	<script src="../plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="../plugin/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="../plugin/nprogress/nprogress.js"></script>
	<script src="../plugin/sweet-alert/sweetalert.min.js"></script>
	<script src="../plugin/waves/waves.min.js"></script>
	<script src="../plugin/fullscreen/jquery.fullscreen-min.js"></script>
	<script src="../js/main.min.js"></script>
</body>
</html>