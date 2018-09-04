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
    <title> ${book.name} </title>
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

<body class="product-page">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-white fixed-top navbar-transparent" color-on-scroll="500">
        <div class="container">
            <div class="navbar-translate">
            	<c:url value="/client/index" var="index"/>
                <a class="navbar-brand" href="${index}" rel="tooltip" title="Book Store" data-placement="bottom">
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
        <div class="page-header page-header-mini">
            <div class="page-header-image" data-parallax="true" style="background-image: url('./img/banner1.jpg') ;">
            </div>
        </div>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div id="productCarousel" class="carousel slide" data-ride="carousel" data-interval="8000">
                            <ol class="carousel-indicators">
                                <li data-target="#productCarousel" data-slide-to="0" class="active"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img src="<c:url value='/image?fileName=${book.image}'/>" alt="IMG-PRODUCT" style="width:100%">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#productCarousel" role="button" data-slide="prev">
                                <button type="button" class="btn btn-primary btn-icon btn-round btn-sm" name="button">
                                    <i class="now-ui-icons arrows-1_minimal-left"></i>
                                </button>
                            </a>
                            <a class="carousel-control-next" href="#productCarousel" role="button" data-slide="next">
                                <button type="button" class="btn btn-primary btn-icon btn-round btn-sm" name="button">
                                    <i class="now-ui-icons arrows-1_minimal-right"></i>
                                </button>
                            </a>
                        </div>
                        <p class="blockquote blockquote-primary">
                            "And thank you for turning my personal jean jacket into a couture piece. Wear yours with mirrored sunglasses on vacation."
                            <br>
                            <br>
                            <small>Kanye West</small>
                        </p>
                    </div>
                    <div class="col-md-7 ml-auto mr-auto">
                        <h2 class="title"> ${book.name} </h2>
                        <h5 class="category">${book.author}</h5>
                        <h2 class="main-price">${book.currencyFormat(book.price)} VND</h2>
                        <div id="accordion" role="tablist" aria-multiselectable="true" class="card-collapse">
                            <div class="card card-plain">
                                <div class="card-header" role="tab" id="headingOne">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Mô tả
                                        <i class="now-ui-icons arrows-1_minimal-down"></i>
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="card-body">
                                        <p>${book.note}</p>
                                    </div>
                                </div>
                            </div>
                        <div class="row justify-content-end">
                        	<c:url value="/client/addtoCart?bookId=${book.id}" var="addtoCart"/>
                            <a class="btn btn-primary mr-3" href="${addtoCart}">Thêm vào giỏ &nbsp;<i class="now-ui-icons shopping_cart-simple"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section related-products" data-background-color="black">
            <div class="container">
                <h3 class="title text-center">You may also be interested in:</h3>
                <div class="row">
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-product">
                            <div class="card-image">
                                <a href="#pablo">
                                    <img class="img rounded" src="./img/saint-laurent.jpg" />
                                </a>
                            </div>
                            <div class="card-body">
                                <h6 class="category text-danger">Trending</h6>
                                <h4 class="card-title">
                                    <a href="#pablo" class="card-link">Dolce & Gabbana</a>
                                </h4>
                                <div class="card-description">
                                    Dolce & Gabbana's 'Greta' tote has been crafted in Italy from hard-wearing red textured-leather.
                                </div>
                                <div class="card-footer">
                                    <div class="price-container">
                                        <span class="price">€1,459</span>
                                    </div>
                                    <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="" data-placement="left" data-original-title="Add to wishlist">
                                        <i class="now-ui-icons ui-2_favourite-28"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-product">
                            <div class="card-image">
                                <a href="#pablo">
                                    <img class="img rounded" src="./img/gucci.jpg" />
                                </a>
                            </div>
                            <div class="card-body">
                                <h6 class="category text-muted">Popular</h6>
                                <h4 class="card-title">
                                    <a href="#pablo" class="card-link">Balmain</a>
                                </h4>
                                <div class="card-description">
                                    Balmain's mid-rise skinny jeans are cut with stretch to ensure they retain their second-skin fit but move comfortably.
                                </div>
                                <div class="card-footer">
                                    <div class="price-container">
                                        <span class="price">€459</span>
                                    </div>
                                    <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="" data-placement="left" data-original-title="Add to wishlist">
                                        <i class="now-ui-icons ui-2_favourite-28"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-product">
                            <div class="card-image">
                                <a href="#pablo">
                                    <img class="img rounded" src="./img/wooyoungmi.jpg" />
                                </a>
                            </div>
                            <div class="card-body">
                                <h6 class="category text-muted">Popular</h6>
                                <h4 class="card-title">
                                    <a href="#pablo" class="card-link">Balenciaga</a>
                                </h4>
                                <div class="card-description">
                                    Balenciaga's black textured-leather wallet is finished with the label's iconic 'Giant' studs. This is where you can...
                                </div>
                                <div class="card-footer">
                                    <div class="price-container">
                                        <span class="price">€559</span>
                                    </div>
                                    <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="" data-placement="left" data-original-title="Add to wishlist">
                                        <i class="now-ui-icons ui-2_favourite-28"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <div class="card card-product">
                            <div class="card-image">
                                <a href="#pablo">
                                    <img class="img rounded" src="./img/saint-laurent1.jpg" />
                                </a>
                            </div>
                            <div class="card-body">
                                <h6 class="category text-rose">Trending</h6>
                                <h4 class="card-title">
                                    <a href="#pablo" class="card-link">Dolce & Gabbana</a>
                                </h4>
                                <div class="card-description">
                                    Dolce & Gabbana's 'Greta' tote has been crafted in Italy from hard-wearing red textured-leather.
                                </div>
                                <div class="card-footer">
                                    <div class="price-container">
                                        <span class="price"> € 1,359</span>
                                    </div>
                                    <button class="btn btn-neutral btn-icon btn-round pull-right" rel="tooltip" title="" data-placement="left" data-original-title="Add to wishlist">
                                        <i class="now-ui-icons ui-2_favourite-28"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer footer-big footer-white">
            <div class="container">
                <div class="content">
                    <div class="row">
                        <div class="col-md-2">
                            <h5>About Us</h5>
                            <ul class="links-vertical">
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Blog
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        About Us
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Presentation
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Contact Us
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-2">
                            <h5>Market</h5>
                            <ul class="links-vertical">
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Sales FAQ
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        How to Register
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Sell Goods
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Receive Payment
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Transactions Issues
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="text-muted">
                                        Affiliates Program
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h5>Social Feed</h5>
                            <div class="social-feed">
                                <div class="feed-line">
                                    <i class="fa fa-twitter"></i>
                                    <p>How to handle ethical disagreements with your clients.</p>
                                </div>
                                <div class="feed-line">
                                    <i class="fa fa-twitter"></i>
                                    <p>The tangible benefits of designing at 1x pixel density.</p>
                                </div>
                                <div class="feed-line">
                                    <i class="fa fa-facebook-square"></i>
                                    <p>A collection of 25 stunning sites that you can use for inspiration.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <h5>Follow Us</h5>
                            <ul class="social-buttons">
                                <li>
                                    <a href="#pablo" class="btn btn-icon btn-neutral btn-twitter btn-round">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="btn btn-icon btn-neutral btn-facebook btn-round">
                                        <i class="fa fa-facebook-square"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="btn btn-icon btn-neutral btn-dribbble btn-round">
                                        <i class="fa fa-dribbble"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="btn btn-icon btn-neutral btn-google btn-round">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#pablo" class="btn btn-icon btn-neutral btn-instagram btn-round">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                            <h5>
                                <small>Numbers Don't Lie</small>
                            </h5>
                            <h5>14.521
                                <small class="text-muted">Freelancers</small>
                            </h5>
                            <h5>1.423.183
                                <small class="text-muted">Transactions</small>
                            </h5>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="copyright">
                    Copyright &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script> Creative Tim All Rights Reserved.
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

</html>