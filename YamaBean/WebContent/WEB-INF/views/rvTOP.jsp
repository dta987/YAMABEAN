<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.dto.Member"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOP</title>

<div class="w3-top">
	<ul class="w3-navbar w3-black w3-card-2 w3-left-align">
		<li class="w3-hide-medium w3-hide-large w3-opennav w3-right"><a
			class="w3-padding-large" href="javascript:void(0)"
			onclick="myFunction()" title="Toggle Navigation Menu"><i
				class="fa fa-bars"></i></a></li>
		<%-- <li class="w3-hide-small"><img alt=""
			src="<%=imgFolder%>logo.JPG" width="50px" height="50px"></a></li> --%>
		<li><a href="/YamaBean/"
			class="w3-hover-none w3-hover-text-grey w3-padding-large">HOME</a></li>
		<li class="w3-hide-small"><a href="#" class="w3-padding-large">ABOUT</a></li>
		<li class="w3-hide-small"><a
			href="${pageContext.request.contextPath}/menu/listMenu"
			class="w3-padding-large">MENU</a></li>
		<li class="w3-hide-small"><a
			href="${pageContext.request.contextPath}/board/move"
			class="w3-padding-large">BORAD</a></li>
		<li class="w3-hide-small"><a
			href="${pageContext.request.contextPath}/storeMap/move"
			class="w3-padding-large">LOCATIONS</a></li>
		<li class="w3-hide-small"><a
			href="${pageContext.request.contextPath}/admin/page"
			class="w3-padding-large">ADMIN</a></li>
		<li class="w3-hide-small"><a
			href="${pageContext.request.contextPath}/mymenu/mymenu"
			class="w3-padding-large">MY MENU</a></li>
		<li class="w3-hide-small"><a
			href="${pageContext.request.contextPath}/member/mymember"
			class="w3-padding-large">MEMBER</a></li>
		
		<c:if test="${sessionScope.whologin != 1 && sessionScope.whologin != 2}">
			<li class="w3-hide-small w3-right"><a
				href="${pageContext.request.contextPath}/member/login"
				class="w3-padding-large">LOGIN</a></li>
		</c:if>

		<c:if test="${sessionScope.whologin == 1}">
			<li class="w3-hide-small w3-dropdown-hover w3-right"><a
				href="javascript:void(0)" class="w3-hover-none w3-padding-large"
				title="USER"><c:if
						test="${sessionScope.loginInfo.nickname != null}">${sessionScope.loginInfo.nickname}</c:if>
					<c:if test="${sessionScope.loginInfo.nickname == null}">${sessionScope.loginInfo.id}</c:if><i
					class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="#">MY PAGE</a> <a href="#">ORDER</a> <a href="#">CART</a>
				</div></li>
		</c:if>
		<c:if test="${sessionScope.whologin == 2}">
			<li class="w3-hide-small w3-dropdown-hover w3-right"><a
				href="javascript:void(0)" class="w3-hover-none w3-padding-large"
				title="USER"><c:if
						test="${sessionScope.loginInfo.nickname != null}">${sessionScope.loginInfo.nickname}</c:if>
					<c:if test="${sessionScope.loginInfo.nickname == null}">${sessionScope.loginInfo.id}</c:if><i
					class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="${pageContext.request.contextPath}/member/admin">Admin
						Page</a> <a href="#">Order List</a>
				</div></li>
		</c:if>
	</ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top"
	style="margin-top: 46px">
	<ul class="w3-navbar w3-left-align w3-black">

		<c:if test="${sessionScope.whologin == null}">
			<li><a href="${pageContext.request.contextPath}/member/login"
				class="w3-padding-large">LOGIN</a></li>
		</c:if>

		<c:if test="${sessionScope.whologin == 1}">
			<li><a href="#" class="w3-padding-large"> <c:if
						test="${sessionScope.loginInfo.nickname != null}">${sessionScope.loginInfo.nickname}</c:if>
					<c:if test="${sessionScope.loginInfo.nickname == null}">${sessionScope.loginInfo.id}</c:if>
			</a></li>
		</c:if>

		<c:if test="${sessionScope.whologin == 2}">
			<li><a href="${pageContext.request.contextPath}/admin/page"
				class="w3-padding-large"> <c:if
						test="${sessionScope.loginInfo.nickname != null}">${sessionScope.loginInfo.nickname}</c:if>
					<c:if test="${sessionScope.loginInfo.nickname == null}">${sessionScope.loginInfo.id}</c:if>
			</a></li>
		</c:if>
		<li><a class="w3-padding-large" href="#band">ABOUT</a></li>
		<li><a class="w3-padding-large"
			href="${pageContext.request.contextPath}/menu/listMenu">MENU</a></li>
		<li><a class="w3-padding-large"
			href="${pageContext.request.contextPath}/board/move/">BORAD</a></li>
		<li><a class="w3-padding-large"
			href="${pageContext.request.contextPath}/storeMap/move">LOCATIONS</a></li>
	</ul>
</div>

<script type="text/javascript">
	function myFunction() {
		var x = document.getElementById("navDemo");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}

	// When the user clicks anywhere outside of the modal, close it
	var modal = document.getElementById('ticketModal');
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
</head>
</body>
</html>
