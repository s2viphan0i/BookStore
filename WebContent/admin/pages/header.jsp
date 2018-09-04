<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="fixed-navbar">
	<div class="pull-left">
		<button type="button"
			class="menu-mobile-button glyphicon glyphicon-menu-hamburger js__menu_mobile"></button>
		<h1 class="page-title">Quản lý sách</h1>
	</div>
	<div class="pull-right">
		<div class="ico-item">
			<a href="#" class="ico-item fa fa-search js__toggle_open"
				data-target="#searchform-header"></a>
			<form action="#" id="searchform-header" class="searchform js__toggle">
				<input type="search" placeholder="Tìm kiếm" class="input-search">
				<button class="fa fa-search button-search" type="submit"></button>
			</form>
		</div>
		<div class="ico-item fa fa-expand-arrows-alt js__full_screen"></div>
		<c:url value="/logout" var="logout"/>
		<a href="${logout}" class="ico-item fa fa-power-off"></a>
	</div>
</div>
