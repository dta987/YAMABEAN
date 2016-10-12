<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.dto.Member"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	Member loginfo = (Member) session.getAttribute("loginInfo");

	int whologin = 0; // 0 : 미로그인,  1 : 회원 로그인, 2 : 관리자 로그인

	if (loginfo == null) {
		whologin = 0;

	} else { //관리자는 아이디가 admin이라고 가정한다.
		if (loginfo.getId().equals("admin")) {
			whologin = 2;
		} else {
			whologin = 1; //일반 사용자 로그인 
		}
	}
	//out.println("whologin : " + whologin);
	session.setAttribute("whologin", whologin);
%>

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
		<li class="w3-hide-small"><a href="/YamaBean/menu/listMenu"
			class="w3-padding-large">MENU</a></li>
		<li class="w3-hide-small"><a href="/YamaBean/board/move/"
			class="w3-padding-large">BORAD</a></li>
		<li class="w3-hide-small"><a href="/YamaBean/storeMap/move"
			class="w3-padding-large">LOCATIONS</a></li>
		<li class="w3-hide-small"><a href="/YamaBean/admin/page"
			class="w3-padding-large">ADMIN</a></li>
		<li class="w3-hide-small"><a href="/YamaBean/menu/listMenu"
			class="w3-padding-large">MENU</a></li>
		<li class="w3-hide-small"><a href="/YamaBean/mymenu/mymenu"
			class="w3-padding-large">MY MENU</a></li>
		<li class="w3-hide-small"><a href="/YamaBean/member/mymember"
			class="w3-padding-large">MEMBER</a></li>

		<c:if test="${sessionScope.whologin == 0}">
			<li class="w3-hide-small w3-right"><a
				href="/YamaBean/member/login" class="w3-padding-large">LOGIN</a></li>
		</c:if>

		<c:if test="${sessionScope.whologin == 1}">
			<li class="w3-hide-small w3-dropdown-hover w3-right"><a
				href="javascript:void(0)" class="w3-hover-none w3-padding-large"
				title="USER"><%=loginfo.getId()%><i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="#">MY PAGE</a> <a href="#">ORDER</a> <a href="#">CART</a>
				</div></li>
		</c:if>
		<c:if test="${sessionScope.whologin == 2}">
			<li class="w3-hide-small w3-dropdown-hover w3-right"><a
				href="javascript:void(0)" class="w3-hover-none w3-padding-large"
				title="USER"><%=loginfo.getId()%><i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
					<a href="/YamaBean/member/admin">Admin Page</a> <a href="#">Order
						List</a>
				</div></li>
		</c:if>
	</ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top"
	style="margin-top: 46px">
	<ul class="w3-navbar w3-left-align w3-black">
		<li><a class="w3-padding-large" href="#band">ABOUT</a></li>
		<li><a class="w3-padding-large" href="#tour">MENU</a></li>
		<li><a class="w3-padding-large" href="#contact">BORAD</a></li>
		<li><a class="w3-padding-large" href="#">LOCATIONS</a></li>
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
