<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="./img/apple-icon.png">
    <link rel="icon" type="image/png" href="./img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title> Book Store - Online shop </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="./css/demo.css" rel="stylesheet" />
</head>

<body class="ecommerce-page">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-white fixed-top navbar-transparent" color-on-scroll="500">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="http://demos.creative-tim.com/now-ui-kit-pro/presentation.html" rel="tooltip" title="Designed by Invision. Coded by Creative Tim" data-placement="bottom" target="_blank">
                    Book Store
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" data-nav-image="./img/blurred-image-1.jpg" data-color="orange">
                <ul class="navbar-nav ml-auto">
					<li class="nav-item active">
					<c:url value="/client/cart" var="cart"></c:url>
						<a class="nav-link" href="${cart}" style="height: 42px;">
							<i class="now-ui-icons shopping_cart-simple"></i>
							<p>Giỏ hàng</p>
						</a>
					</li>
					<li class="nav-item">
						<c:if test="${empty current_user}">
							<c:url value="/client/login" var="login"/>
							<a class="nav-link" href="${login}" style="height: 100%;">
								<i class="now-ui-icons objects_key-25"></i>
								<p>Login</p>
							</a>
						</c:if>
						<c:if test="${not empty current_user}">
							<a class="nav-link" href="${profile}" style="height: 100%;">
								<i class="now-ui-icons users_circle-08"></i>
								<p>${current_user.fullName}</p>
							</a>
						</c:if>
					</li>
					<li class="nav-item">
						<c:if test="${not empty current_user}">
							<c:url value="/client/logout" var="logout"/>
							<a class="nav-link" href="${logout}" style="height: 100%;">
								<i class="now-ui-icons media-1_button-power"></i>
							</a>
						</c:if>
					</li>
				</ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="wrapper">
        <div id="carouselExampleIndicators" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item">
                    <div class="page-header header-filter">
                        <div class="page-header-image" style="background-image: url('./img/wp3.jpg');"></div>
                        <div class="content-center text-center">
                            <div class="row">
                                <div class="col-md-8 ml-auto mr-auto2">
                                    <h1 class="title">Finding the Perfect.</h1>
                                    <h4 class="description text-white">The haute couture crowds make stylish statements between shows during couture season in Paris...</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item active">
                    <div class="page-header header-filter">
                        <div class="page-header-image" style="background-image: url('./img/wp2.jpg');"></div>
                        <div class="content-center">
                            <div class="row">
                                <div class="col-md-8 ml-auto mr-auto text-center">
                                    <h1 class="title">Street Style: Couture.</h1>
                                    <h4 class="description text-white">See what Karlie Kloss, Tracee Ellis Ross and others wore between the shows...</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="page-header header-filter">
                        <div class="page-header-image" style="background-image: url('./img/wp1.jpg');"></div>
                        <div class="content-center text-center">
                            <div class="row">
                                <div class="col-md-8 ml-auto mr-auto">
                                    <h1 class="title">For Men With Style.</h1>
                                    <h4 class="description text-white">Shirts that actually fit? Check. Linen shorts? Yup. Those wider pants suddenly in style? Got them, too....</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <i class="now-ui-icons arrows-1_minimal-left"></i>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <i class="now-ui-icons arrows-1_minimal-right"></i>
            </a>
        </div>
        <div class="main">
            <div class="section">
                <div class="container">
                    <h2 class="section-title">Find what you need</h2>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="collapse-panel">
                                <div class="card-body">
                                	<h4 class="card-title">
                                        Tìm kiếm
                                    </h4>
                                    <c:url value="/client/index" var="index"/>
                                    <form action="${index}" method="get">
	                                    <div class="search">
	                                    	<p class="category">Từ khóa</p>
		                                    <div class="form-group">
			                                    <input type="text" name="key" value="${search.keyWord}" placeholder="Nhập từ khóa" class="form-control">
			                                </div>
	                                    </div>
	                                    <div class="search">
	                                    	<p class="category">Danh mục</p>
	                                    	<c:forEach items="${listCategories}" var="category">
			                                    <div class="checkbox">
			                                        <input type="checkbox" name="category" value="${category.id}">
			                                        <label>
			                                            ${category.name}
			                                        </label>
			                                    </div>
		                                    </c:forEach>
	                                    </div>
	                                    <div class="search">
	                                    	<p class="category">Khoảng giá</p>
	                                    	<select class="selectpicker" data-size="7" name="price" data-style="btn btn-primary btn-round" title="Tất cả">
	                                            <option value="1" disabled selected>Tất cả</option>
	                                            <option value="2">0 - 50.000 VND</option>
	                                            <option value="3">50.000 - 100.000 VND</option>
	                                            <option value="4">100.000 - 200.000 VND</option>
	                                            <option value="5">200.000 - 500.000 VND</option>
	                                            <option value="6">500.000+ VND</option>
	                                        </select>
	                                    </div>
	                                    <div class="search">
	                                    	<p class="category">Sắp xếp</p>
	                                    	<select class="selectpicker" data-size="7" name="sort" data-style="btn btn-primary btn-round" title="Mặc định">
	                                            <c:if test="${search.sort==1}">
	                                            	<option value="1" disabled selected>Mặc định</option>
	                                            </c:if>
	                                            <c:if test="${search.sort!=1}">
	                                            	<option value="1" disabled>Mặc định</option>
	                                            </c:if>
	                                            <c:if test="${search.sort==2}">
	                                            	<option value="2" selected>Sản phẩm mới</option>
	                                            </c:if>
	                                            <c:if test="${search.sort!=2}">
	                                            	<option value="2">Sản phẩm mới</option>
	                                            </c:if>
	                                            <c:if test="${search.sort==3}">
	                                            	<option value="3" selected>Giá tăng dần</option>
	                                            </c:if>
	                                            <c:if test="${search.sort!=3}">
	                                            	<option value="3">Giá tăng dần</option>
	                                            </c:if>
                                             	<c:if test="${search.sort==4}">
	                                            	<option value="4" selected>Giá giảm dần</option>
	                                            </c:if>
	                                            <c:if test="${search.sort!=4}">
	                                            	<option value="4">Giá giảm dần</option>
	                                            </c:if>
	                                        </select>
	                                    </div>
	                                    <a href="${index}" style="margin-top:30px" class="btn btn-info btn-round float-right">Xóa lọc</a>
	                                    <button style="margin-top:30px" class="btn btn-primary btn-round" type="submit">Lọc</button>
                                	</form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                            	<c:forEach items="${listBooks}" var="book">
                            		<c:url value="/client/detail?id=${book.id}" var="detail"/>
	                                <div class="col-lg-4 col-md-6">
	                                    <div class="card card-product card-plain">
	                                        <div class="card-image">
	                                            <a href="${detail}">
	                                                <img src="<c:url value='/image?fileName=${book.image}'/>" alt="IMG-PRODUCT">
	                                            </a>
	                                        </div>
	                                        <div class="card-body">
	                                            <a href="${detail}">
	                                                <h4 class="card-title">${book.name}</h4>
	                                            </a>
	                                            <p class="card-description">
	                                                ${book.note}
	                                            </p>
	                                            <div class="card-footer">
	                                                <div class="price-container">
	                                                    <span class="price">${book.currencyFormat(book.price)} VND</span>
	                                                </div>
	                                                <c:url value="/client/addtoCart?bookId=${book.id}" var="addtoCart"/>
	                                                <a href="${addtoCart}" class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="Add to cart" data-placement="left">
	                                                    <i class="now-ui-icons shopping_cart-simple"></i>
	                                                </a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <!-- end card -->
	                                </div>
                                </c:forEach>
                            </div>
                            <div class="row">
								<div class="mr-auto ml-auto">
								<c:url value="/client/index?key=${search.keyWord}&sort=${search.sort}&price=${price}" var="index"></c:url>
									<ul class="pagination pagination-primary">
										<c:if test="${(search.page-4)>0&&(search.page+1)>search.totalPage}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page-4}">${search.page-4}</a>
					                        </li>
				                        </c:if>
										<c:if test="${(search.page-3)>0&&(search.page+2)>search.totalPage}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page-3}">${search.page-3}</a>
					                        </li>
				                        </c:if>
				                        <c:if test="${(search.page-2)>0}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page-2}">${search.page-2}</a>
					                        </li>
				                        </c:if>
				                        <c:if test="${(search.page-1)>0}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page-1}">${search.page-1}</a>
					                        </li>
				                        </c:if>
				                        <li class="page-item active">
				                            <a class="page-link" href="#link">${search.page}</a>
				                        </li>
				                        <c:if test="${(search.page+1)<search.totalPage+1}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page+1}">${search.page+1}</a>
					                        </li>
				                        </c:if>
				                        <c:if test="${(search.page+2)<search.totalPage+1}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page+2}">${search.page+2}</a>
					                        </li>
				                        </c:if>
				                        <c:if test="${(search.page-1)<=0&&(search.page+3)<search.totalPage+1}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page+3}">${search.page+3}</a>
					                        </li>
				                        </c:if>
				                        <c:if test="${(search.page-2)<=0&&(search.page+4)<search.totalPage+1}">
					                        <li class="page-item">
					                            <a class="page-link" href="${index}&page=${search.page+4}">${search.page+4}</a>
					                        </li>
				                        </c:if>
				                    </ul>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- section -->
            <div class="container">
                <h2 class="section-title">News in fashion</h2>
            </div>
            <div class="projects-4">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 px-0">
                            <div class="card card-fashion card-background" style="background-image: url('./img/bg35.jpg')">
                                <div class="card-body">
                                    <div class="card-title text-left">
                                        <h2>
                                            <a href="#pablo">
                                                The New York Times Todd Snyder and Raf Simons Party During Men’s Fashion Week
                                            </a>
                                        </h2>
                                    </div>
                                    <div class="card-footer text-left">
                                        <div class="stats">
                                            <span>
                                                <i class="now-ui-icons users_circle-08"></i>Emy Grace
                                            </span>
                                            <span>
                                                <i class="now-ui-icons tech_watch-time"></i> June 6, 2017
                                            </span>
                                        </div>
                                        <div class="stats-link pull-right">
                                            <a href="#pablo" class="footer-link">Fashion Week</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 px-0">
                            <div class="card-container">
                                <div class="card card-fashion">
                                    <div class="card-title">
                                        <a href="#pablo">
                                        </a>
                                        <h4>
                                            <a href="#pablo">
                                            </a>
                                            <a href="#pablo">
                                                Valentina Garavani Holds a Summer Lunch in Honor of Sofia Coppola...
                                            </a>
                                        </h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-footer text-left">
                                            <div class="stats">
                                                <span>
                                                    <i class="now-ui-icons users_circle-08"></i>Jerry McGregor
                                                </span>
                                                <span>
                                                    <i class="now-ui-icons tech_watch-time"></i> June 10, 2017
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-fashion card-background" style="background-image: url('./img/bg40.jpg')">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="container">
                    <h2 class="section-title">Latest Offers</h2>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card card-product card-plain">
                                <div class="card-image">
                                    <img class="img rounded" src="./img/saint-laurent1.jpg" />
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#pablo">Saint Laurent</a>
                                    </h4>
                                    <p class="card-description">The structured shoulders and sleek detailing ensure a sharp silhouette. Team it with a silk pocket square and leather loafers.</p>
                                    <div class="card-footer">
                                        <div class="price-container">
                                            <span class="price price-old"> &euro;1,430</span>
                                            <span class="price price-new"> &euro;743</span>
                                        </div>
                                        <div class="stats stats-right">
                                            <button type="button" rel="tooltip" title="" class="btn btn-icon btn-neutral" data-original-title="Saved to Wishlist">
                                                <i class="now-ui-icons ui-2_favourite-28"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-product card-plain">
                                <div class="card-image">
                                    <img class="img rounded" src="./img/saint-laurent.jpg" />
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <h4 class="card-title">Saint Laurent</h4>
                                    </h4>
                                    <p class="card-description">The structured shoulders and sleek detailing ensure a sharp silhouette. Team it with a silk pocket square and leather loafers.</p>
                                    <div class="card-footer">
                                        <div class="price-container">
                                            <span class="price price-old"> &euro;1,430</span>
                                            <span class="price price-new">&euro;743</span>
                                        </div>
                                        <div class="stats stats-right">
                                            <button type="button" rel="tooltip" title="" class="btn btn-icon btn-neutral" data-original-title="Saved to Wishlist">
                                                <i class="now-ui-icons ui-2_favourite-28"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-product card-plain">
                                <div class="card-image">
                                    <img class="img rounded" src="./img/gucci.jpg" />
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <h4 class="card-title">Gucci</h4>
                                    </h4>
                                    <p class="card-description">The smooth woven-wool is water resistant to ensure you stay pristine after a long-haul flight. Cut in a trim yet comfortable regular fit.</p>
                                    <div class="card-footer">
                                        <div class="price-container">
                                            <span class="price price-old"> &euro;2,430</span>
                                            <span class="price price-new">&euro;890</span>
                                        </div>
                                        <div class="stats stats-right">
                                            <button type="button" rel="tooltip" title="" class="btn btn-icon btn-neutral btn-default" data-original-title="Add to Wishlist">
                                                <i class="now-ui-icons ui-2_favourite-28"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- section -->
            <div class="subscribe-line subscribe-line-image" style="background-image: url('./img/bg43.jpg');">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ml-auto mr-auto">
                            <div class="text-center">
                                <h4 class="title">Subscribe to our Newsletter</h4>
                                <p class="description">
                                    Join our newsletter and get news in your inbox every week! We hate spam too, so no worries about this.
                                </p>
                            </div>
                            <div class="card card-raised card-form-horizontal">
                                <div class="card-body">
                                    <form method="" action="">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="now-ui-icons ui-1_email-85"></i>
                                                    </span>
                                                    <input type="email" class="form-control" placeholder="Your Email...">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <button type="button" class="btn btn-primary btn-block">Subscribe</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end-main-raised -->
        <footer class="footer ">
            <div class="container">
                <nav>
                    <ul>
                        <li>
                            <a href="https://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://presentation.creative-tim.com">
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                                Blog
                            </a>
                        </li>
                        <li>
                            <a href="https://www.creative-tim.com/license">
                                License
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>, Designed by
                    <a href="http://www.invisionapp.com" target="_blank">Invision</a>. Coded by
                    <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
                </div>
            </div>
        </footer>
    </div>
</body>
<!--   Core JS Files   -->
<script src="./js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="./js/core/popper.min.js" type="text/javascript"></script>
<script src="./js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="./js/plugins/moment.min.js"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="./js/plugins/bootstrap-switch.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="./js/plugins/bootstrap-tagsinput.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="./js/plugins/bootstrap-selectpicker.js" type="text/javascript"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="./js/plugins/jasny-bootstrap.min.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="./js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="./js/plugins/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="./js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {

        var slider2 = document.getElementById('sliderRefine');

        noUiSlider.create(slider2, {
            start: [42, 880],
            connect: true,
            range: {
                'min': [30],
                'max': [900]
            }
        });

        var limitFieldMin = document.getElementById('price-left');
        var limitFieldMax = document.getElementById('price-right');

        slider2.noUiSlider.on('update', function(values, handle) {
            if (handle) {
                limitFieldMax.innerHTML = $('#price-right').data('currency') + Math.round(values[handle]);
            } else {
                limitFieldMin.innerHTML = $('#price-left').data('currency') + Math.round(values[handle]);
            }
        });
    });
</script>

</html>