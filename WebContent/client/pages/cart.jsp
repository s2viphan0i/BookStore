<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76" href="./img/apple-icon.png">
<link rel="icon" type="image/png" href="./img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Luxury Studio - Upload Photo</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="./fonts/font-awesome/css/fontawesome-all.min.css" />
<!-- CSS Files -->
<link href="./css/bootstrap.min.css" rel="stylesheet" />
<link href="./css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/demo.css" />
</head>

<body>
	<header> <nav class="navbar navbar-expand-lg bg-primary">
	<div class="container">
		<div class="navbar-translate">
			<c:url value="/client/index" var="index" />
			<a class="navbar-brand" href="${index}">Book Store</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#example-navbar-primary"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-bar bar1"></span> <span
					class="navbar-toggler-bar bar2"></span> <span
					class="navbar-toggler-bar bar3"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-primary">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><c:if test="${empty current_user}">
						<c:url value="/client/login" var="login" />
						<a class="nav-link" href="${login}"> <i
							class="now-ui-icons objects_key-25"></i>
							<p>Login</p>
						</a>
					</c:if> <c:if test="${not empty current_user}">
						<a class="nav-link" href=""> <i
							class="now-ui-icons users_circle-08"></i>
							<p>${current_user.fullName}</p>
						</a>
					</c:if></li>
				<li class="nav-item"><c:if test="${not empty current_user}">
						<c:url value="/client/logout" var="logout" />
						<a class="nav-link" href="${logout}"> <i
							class="now-ui-icons media-1_button-power"></i>
						</a>
					</c:if></li>
			</ul>
		</div>
	</div>
	</nav> </header>
	<div class="section" style="padding: 0 0">
		<div class="container">
			<h4>Giỏ hàng</h4>
			<div class="row">
				<div class="col-md-12">
					<h4>
						<medium>Thông tin chi tiết</medium>
					</h4>
				</div>
				<div class="col-md-12">
					<div class="card card-plain">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-shopping">
									<thead class="">
										<th>#</th>
										<th class="text-center"></th>
										<th>Sản phẩm</th>
										<th class="text-right">Giá</th>
										<th class="text-right">Số lượng</th>
										<th class="text-right">Thành tiền</th>
									</thead>
									<tbody>
										<c:forEach items="${order.items}" var="item">
											<tr>
												<td>${item.book.id}</td>
												<td>
													<div class="img-container">
														<img src="<c:url value='/image?fileName=${item.book.image}'/>" alt="IMG-PRODUCT" style="width:100%">
													</div>
												</td>
												<td class="td-name"><a href="#jacket">${item.book.name}</a> <br/>
												<small>by ${item.book.author}</small></td>
												<td class="td-number"><small>VND</small>${item.currencyFormat(item.price)}</td>
												<td class="td-number">${item.quantity}
													<div class="btn-group">
														<button class="btn btn-info btn-sm">
															<i class="now-ui-icons ui-1_simple-delete"></i>
														</button>
														<button class="btn btn-info btn-sm">
															<i class="now-ui-icons ui-1_simple-add"></i>
														</button>
													</div>
												</td>
												<td class="td-number"><small>VND</small>${item.currencyFormat(item.price*item.quantity)}</td>
												<td class="td-actions">
													<button type="button" rel="tooltip" data-placement="left"
														title="Remove item" class="btn btn-neutral">
														<i class="now-ui-icons ui-1_simple-remove"></i>
													</button>
												</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3"></td>
											<td class="td-total">Tổng</td>
											<td class="td-price"><small>VND</small>${order.getTotal()}</td>
											<td colspan="3" class="text-right">
											<c:url value="/client/user/order" var="order"/>
												<a href="${order}" rel="tooltip"
													class="btn btn-info btn-round ">
													Thanh toán <i
														class="now-ui-icons arrows-1_minimal-right"></i>
												</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$('input[type=radio]').change(function() {
		var stat = $('input[type=radio][value="1"]').is(':checked');
		if (stat) {
			$('input[type=checkbox]').removeAttr("checked");
			$('input[type=checkbox]').removeAttr("disabled");
			$('input[type=checkbox]').css("color", "#9A9A9A");
			console.log('a');
		} else {
			$('input[type=checkbox]').attr("disabled", "disabled");
			$('input[type=checkbox]').css("color", "#2c2c2c");
		}
	});
</script>
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
<script src="./js/plugins/bootstrap-selectpicker.js"
	type="text/javascript"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="./js/plugins/jasny-bootstrap.min.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="./js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="./js/plugins/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="./js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>
</html>
