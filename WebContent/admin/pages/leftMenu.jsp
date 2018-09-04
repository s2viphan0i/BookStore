<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="main-menu">
	<header class="header">
		<a href="index.html" class="logo">Shop Online</a>
		<button type="button" class="button-close fa fa-times js__menu_close"></button>
		<div class="user">
			<a href="#" class="avatar"><img src="http://placehold.it/80x80"
				alt=""> <span class="status online"></span> </a>
			<h5 class="name">
				<a href="profile.html">${current_user.fullName}</a>
			</h5>
			<c:if test="${current_user.role==3}">
				<h5 class="position">Administrator</h5>
			</c:if>
			<c:if test="${current_user.role==2}">
				<h5 class="position">Employee</h5>
			</c:if>
			<!-- /.name -->
			<div class="control-wrap js__drop_down">
				<i class="fa fa-caret-down js__drop_down_button"></i>
				<div class="control-list">
					<div class="control-item">
						<a href="profile.html"><i class="fa fa-user"></i> Profile</a>
					</div>
					<div class="control-item">
						<a href="#"><i class="fa fa-cog"></i> Settings</a>
					</div>
					<div class="control-item">
						<c:url value="/logout" var="logout"/>
						<a href="${logout}"><i class="fa fa-sign-out-alt"></i> Log out</a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="content">
		<div class="navigation">
			<h5 class="title">Quản lý</h5>
			<ul class="menu js__accordion">
				<li><a class="waves-effect" href="index.html"><i
						class="menu-icon fas fa-home"></i><span>Dashboard</span></a></li>
				<li><a class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fas fa-book"></i><span>Sách</span><span
						class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<c:url value="/admin/pages/insertBook" var="insertBook"/>
						<li><a href="${insertBook}">Thêm</a></li>
						<c:url value="/admin/pages/searchBook" var="searchBook"/>
						<li><a href="${searchBook}">Tìm kiếm</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
				<li><a class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fas fa-list-alt"></i><span>Danh mục</span><span
						class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<c:url value="/admin/pages/insertCategory" var="insertCategory"/>
						<li><a href="${insertCategory}">Thêm</a></li>
						<c:url value="/admin/pages/searchCategory" var="searchCategory"/>
						<li><a href="${searchCategory}">Tìm kiếm</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
				<li><a class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fas fa-user"></i><span>Khách hàng</span><span
						class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<c:url value="/admin/pages/insertUser" var="insertUser"/>
						<li><a href="${insertUser}">Thêm</a></li>
						<c:url value="/admin/pages/searchUser" var="searchUser"/>
						<li><a href="${searchUser}">Tìm kiếm</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
				<c:url value="/admin/pages/order" var="order"/>
				<li><a class="waves-effect" href="${order}"><i
						class="menu-icon fa fa-code"></i><span>Đơn hàng</span><span
						class="notice notice-yellow">6</span></a></li>
			</ul>
			<h5 class="title">Components</h5>
			<ul class="menu js__accordion">
				<li><a class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fa fa-chart-bar"></i><span>Charts</span><span
						class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="chart-3d.html">3D Charts</a></li>
						<li><a href="chart-chartist.html">Chartist Charts</a></li>
						<li><a href="chart-chartjs.html">Chartjs Chart</a></li>
						<li><a href="chart-dynamic.html">Dynamic Chart</a></li>
						<li><a href="chart-flot.html">Flot Chart</a></li>
						<li><a href="chart-knob.html">Knob Chart</a></li>
						<li><a href="chart-morris.html">Morris Chart</a></li>
						<li><a href="chart-sparkline.html">Sparkline Chart</a></li>
						<li><a href="chart-other.html">Other Chart</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
				<li><a class="waves-effect" href="calendar.html"><i
						class="menu-icon fa fa-calendar"></i><span>Calendar</span></a></li>
				<li class="current active"><a
					class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fa fa-th-large"></i><span>Forms</span><span
						class="notice notice-blue">7</span></a>
					<ul class="sub-menu js__content">
						<li class="current"><a href="form-elements.html">General
								Elements</a></li>
						<li><a href="form-advanced.html">Advanced Form</a></li>
						<li><a href="form-fileupload.html">Form Uploads</a></li>
						<li><a href="form-validation.html">Form Validation</a></li>
						<li><a href="form-wizard.html">Form Wizard</a></li>
						<li><a href="form-wysiwig.html">Wysiwig Editors</a></li>
						<li><a href="form-xeditable.html">X-editable</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
				<li><a class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fa fa-table"></i><span>Tables</span><span
						class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="tables-basic.html">Basic Tables</a></li>
						<li><a href="tables-datatable.html">Data Tables</a></li>
						<li><a href="tables-responsive.html">Responsive Tables</a></li>
						<li><a href="tables-editable.html">Editable Tables</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
			</ul>
			<h5 class="title">Additions</h5>
			<ul class="menu js__accordion">
				<li><a class="waves-effect" href="profile.html"><i
						class="menu-icon fa fa-user"></i><span>Profile</span></a></li>
				<li><a class="waves-effect" href="inbox.html"><i
						class="menu-icon fa fa-envelope"></i><span>Mail</span><span
						class="notice notice-danger">New</span></a></li>
				<li><a class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fas fa-file-alt"></i><span>Page</span><span
						class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="page-starter.html">Starter Page</a></li>
						<li><a href="page-login.html">Login</a></li>
						<li><a href="page-register.html">Register</a></li>
						<li><a href="page-recoverpw.html">Recover Password</a></li>
						<li><a href="page-lock-screen.html">Lock Screen</a></li>
						<li><a href="page-confirm-mail.html">Confirm Mail</a></li>
						<li><a href="page-404.html">Error 404</a></li>
						<li><a href="page-500.html">Error 500</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
				<li><a class="waves-effect parent-item js__control" href="#"><i
						class="menu-icon fa fa-folder-open"></i><span>Extra Pages</span><span
						class="menu-arrow fa fa-angle-down"></span></a>
					<ul class="sub-menu js__content">
						<li><a href="extras-contact.html">Contact list</a></li>
						<li><a href="extras-email-template.html">Email template</a></li>
						<li><a href="extras-faq.html">FAQ</a></li>
						<li><a href="extras-gallery.html">Gallery</a></li>
						<li><a href="extras-invoice.html">Invoice</a></li>
						<li><a href="extras-maps.html">Maps</a></li>
						<li><a href="extras-pricing.html">Pricing</a></li>
						<li><a href="extras-projects.html">Projects</a></li>
						<li><a href="extras-taskboard.html">Taskboard</a></li>
						<li><a href="extras-timeline.html">Timeline</a></li>
						<li><a href="extras-tour.html">Tour</a></li>
					</ul> <!-- /.sub-menu js__content --></li>
			</ul>
		</div>
	</div>
</div>
