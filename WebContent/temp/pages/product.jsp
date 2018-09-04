<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="head.jsp"></jsp:include>
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m"
		style="background-image: url(../img/banner/book-banner.jpg);">
	<h2 class="l-text2 t-center">Book</h2>
	<p class="m-text13 t-center">New Arrivals Book 2018</p>
	</section>


	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
				<div class="leftbar p-r-20 p-r-0-sm">
					<c:url value="/client/pages/product" var="productPage" />
					<form action="${productPage}" method="POST">
						<h4 class="m-text14 p-b-7">Categories</h4>
						<ul class="p-b-54">
							<li class="p-t-4"><a href="#" class="s-text13 active1">
									Tất cả </a></li>
							<c:forEach items="${listCategories}" var="category">
								<li class="p-t-4"><a href="#" class="s-text13">
										${category.name}</a></li>
							</c:forEach>
						</ul>
						<h4 class="m-text14 p-b-32">Lọc kết quả</h4>
						<div class="filter-price p-t-22 p-b-50 bo3">
							<div class="flex-w">
								<div class="rs2-select2 bo4 of-hidden w-sizefull m-t-5 m-b-5">
									<select class="selection-2" name="sorting">
										<option value="1" <c:if test="${sorting==1}">selected</c:if>>Default Sorting</option>
										<option value="2">Popularity</option>
										<option value="3">Price: low to high</option>
										<option value="4">Price: high to low</option>
									</select>
								</div>

								<div class="rs2-select2 bo4 of-hidden w-sizefull m-t-5 m-b-5">
									<select class="selection-2" name="price">
										<option value="1">Price</option>
										<option value="2">0 - 50.000</option>
										<option value="3">50.000 - 100.000</option>
										<option value="4">100.000 - 200.000</option>
										<option value="5">200.000 - 500.000</option>
										<option value="6">500.000+</option>
									</select>
								</div>
							</div>
						</div>
						<div class="search-product pos-relative bo4 of-hidden">
							<input class="s-text7 size6 p-l-23 p-r-50" value="${search.keyWord}"
								type="text" name="key" placeholder="Search Products...">
							<button class="flex-c-m size5 ab-r-m color2 color0-hov trans-0-4">
								<i class="fs-12 fa fa-search" aria-hidden="true"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
				<!--  -->
				<div class="flex-sb-m flex-w p-b-35">
					<div class="flex-w">
					</div>

					<span class="s-text8 p-t-5 p-b-5"> Showing ${(search.page-1)*search.pageSize+1}–${(search.page)*search.pageSize} of ${search.total}
						results </span>
				</div>

				<!-- Product -->
				<div class="row">
					<c:forEach items="${listBooks}" var="book">
						<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
							<!-- Block2 -->
							<div class="block2">
								<div
									class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
									<img src="<c:url value='/image?fileName=${book.image}'/>"
										alt="IMG-PRODUCT">

									<div class="block2-overlay trans-0-4">
										<a href="#"
											class="block2-btn-addwishlist hov-pointer trans-0-4"> <i
											class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
											<i class="icon-wishlist icon_heart dis-none"
											aria-hidden="true"></i>
										</a>

										<div class="block2-btn-addcart w-size1 trans-0-4">
											<!-- Button -->
											<c:url value="/client/pages/addtoCart?bookId=${book.id}" var="addtoCart"/>
											<a href="${addtoCart}"
												class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
												Add to Cart</a>
										</div>
									</div>
								</div>

								<div class="block2-txt p-t-20">
									<c:url value="/client/pages/detail?id=${book.id}" var="detail"/>
									<a href="${detail}"
										class="block2-name dis-block s-text3 p-b-5"> ${book.name}
									</a> <span class="block2-price m-text6 p-r-5">
										${book.currencyFormat() } VND</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- Pagination -->
					<c:url value="/client/pages/product?key=${search.keyWord}&sorting=${search.sortBy}" var="product"></c:url>
					<div class="pagination flex-m flex-w p-t-26">
						<c:if test="${(search.page-2)>0}">
                            <a class="item-pagination flex-c-m trans-0-4" href="${product}&page=${search.page-2}">${search.page-2}</a>
                        </c:if>
                        <c:if test="${(search.page-1)>0}">
                            <a class="item-pagination flex-c-m trans-0-4" href="${product}&page=${search.page-1}">${search.page-1}</a>
                        </c:if>
                            <a class="item-pagination flex-c-m trans-0-4 active-pagination" href="#">${search.page}</a>
                        <c:if test="${(search.page+1)<search.totalPage+1}">
                            <a class="item-pagination flex-c-m trans-0-4" href="${product}&page=${search.page+1}">${search.page+1}</a>
                        </c:if>
                        <c:if test="${(search.page+2)<search.totalPage+1}">
                            <a class="item-pagination flex-c-m trans-0-4" href="${product}&page=${search.page+2}">${search.page+2}</a>
                        </c:if>
                        <c:if test="${(search.page-1)<=0&&(search.page+3)<search.totalPage+1}">
                            <a class="item-pagination flex-c-m trans-0-4" href="${product}&page=${search.page+3}">${search.page+3}</a>
                        </c:if>
                        <c:if test="${(search.page-2)<=0&&(search.page+4)<search.totalPage+1}">
                            <a class="item-pagination flex-c-m trans-0-4" href="${product}&page=${search.page+4}">${search.page+4}</a>
                        </c:if>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>



	<!--===============================================================================================-->
	<script type="text/javascript"
		src="../vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="../vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript"
		src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect1')
		});

		$(".selection-2").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect2')
		});
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="../vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="../vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src=".../vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="../js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="../vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		$('.block2-btn-addcart').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.block2-name').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});

		$('.block2-btn-addwishlist').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.block2-name').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");
					});
				});
	</script>

	<!--===============================================================================================-->
	<script type="text/javascript" src="../vendor/noui/nouislider.min.js"></script>
========================================================================================-->
	<script src="../js/main.js"></script>

</body>
</html>
