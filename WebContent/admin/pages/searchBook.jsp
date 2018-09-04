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
						<h4 class="box-title pull-left">Danh sách sách</h4>
						<c:url value="/admin/pages/searchBook" var="searchBook"></c:url>
						<form action="${searchBook}" id="searchform-header"
							class="searchform js__toggle pull-right">
							<input type="search" placeholder="Tìm kiếm..." name="key" value="${key}"
								class="input-search">
							<button class="fa fa-search button-search" type="submit"></button>
						</form>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Tên sách</th>
									<th>Tác giả</th>
									<th>Ảnh</th>
									<th>Giá</th>
									<th>Danh mục</th>
									<th>Ngày xuất bản</th>
									<th>Ghi chú</th>
									<th>Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listBooks}" var="book">
									<tr>
										<th scope="row">${book.id}</th>
										<td class="vertical-align"><c:out value="${book.name}"/></td>
										<td><c:out value="${book.author}"/></td>
										<td><img style = "width:100px; height:auto;" src="<c:url value='/image?fileName=${book.image}'/>"/></td>
										<td><c:out value="${book.currencyFormat(book.price)} VND"/></td>
										<td>${book.category.name}</td>
										<td><c:out value="${book.dateToString()}"/></td>
										<td><c:out value="${book.note}"/></td>
										<td style="text-align:center">
											<c:url value="/admin/pages/editBook?id=${book.id}" var="editBook"/>
											<a href="${editBook}"><i class="far fa-edit"></i></a>
											<c:url value="/admin/pages/deleteBook?id=${book.id}" var="deleteBook"/>
											<a href="${deleteBook}"><i class="far fa-trash-alt" style="color:#e74c3c"></i></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="dataTables_paginate paging_simple_numbers" style="float:right" id="example_paginate">
							<ul class="pagination">
								<c:url value="/admin/pages/searchBook?key=${search.keyWord}" var="product"></c:url>
								<c:if test="${(search.page-1)<1}">
									<li class="paginate_button previous disabled">
										<a href="#">Previous</a>
									</li>
								</c:if>
								<c:if test="${(search.page-1)>0}">
									<li class="paginate_button previous" id="example_previous">
										<a href="${product}&page=${search.page-1}">Previous</a>
									</li>
								</c:if>
								<c:if test="${(search.page-2)>0}">
									<li class="paginate_button ">
			                            <a href="${product}&page=${search.page-2}">${search.page-2}</a>
			                        </li>
		                        </c:if>
		                        <c:if test="${(search.page-1)>0}">
			                        <li class="paginate_button ">
			                            <a href="${product}&page=${search.page-1}">${search.page-1}</a>
			                        </li>
		                        </c:if>
			                        <li class="paginate_button active">
			                            <a href="#">${search.page}</a>
			                        </li>
		                        <c:if test="${(search.page+1)<search.totalPage+1}">
			                        <li class="paginate_button ">
			                            <a href="${product}&page=${search.page+1}">${search.page+1}</a>
			                        </li>
		                        </c:if>
		                        <c:if test="${(search.page+2)<search.totalPage+1}">
			                        <li class="paginate_button ">
			                            <a href="${product}&page=${search.page+2}">${search.page+2}</a>
			                        </li>
		                        </c:if>
		                        <c:if test="${(search.page-1)<=0&&(search.page+3)<search.totalPage+1}">
			                        <li class="paginate_button ">
			                            <a href="${product}&page=${search.page+3}">${search.page+3}</a>
			                        </li>
		                        </c:if>
		                        <c:if test="${(search.page-2)<=0&&(search.page+4)<search.totalPage+1}">
			                        <li class="paginate_button ">
			                            <a href="${product}&page=${search.page+4}">${search.page+4}</a>
			                        </li>
		                        </c:if>
		                        <c:if test="${(search.page+1)>search.totalPage}">
			                        <li class="paginate_button next disabled">
										<a href="${product}&page=${search.page+1}">Next</a>
									</li>
								</c:if>
								<c:if test="${(search.page+1)<search.totalPage+1}">
			                        <li class="paginate_button next">
										<a href="${product}&page=${search.page+1}">Next</a>
									</li>
								</c:if>
							</ul>
						</div>
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