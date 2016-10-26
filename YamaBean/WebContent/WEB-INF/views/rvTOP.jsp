<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TOP</title>

<style>
.w3-top {
	background-color: white;
}
</style>
<body>
	<div class="w3-top">
		<ul class="w3-navbar w3-theme-d2 w3-left-align">
			<li class="w3-hide-medium w3-hide-large w3-opennav w3-right"><a
				class="w3-padding-large" href="javascript:void(0)"
				onclick="myFunction()" title="Toggle Navigation Menu"><i
					class="fa fa-bars"></i></a></li>
			<li><a href="/YamaBean/"
				class="w3-hover-none w3-hover-text-grey w3-padding-large w3-text-black">HOME</a></li>
			<li class="w3-hide-small"><a
				href="${pageContext.request.contextPath}/menu/listMenu"
				class="w3-padding-large w3-text-black">MENU</a></li>
			<li class="w3-hide-small"><a
				href="${pageContext.request.contextPath}/board/move"
				class="w3-padding-large w3-text-black">BORAD</a></li>
			<c:if
				test="${sessionScope.whologin != 1 && sessionScope.whologin != 2}">
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
						<a href="${pageContext.request.contextPath}/member/mypage">MYPAGE</a> 
						<a href="${pageContext.request.contextPath}/order/order">ORDER</a>
						<a href="${pageContext.request.contextPath}/member/logout">LOGOUT</a>
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
						<a href="${pageContext.request.contextPath}/admin/page">ADMIN PAGE</a> 
						<a href="${pageContext.request.contextPath}/member/logout">LOGOUT</a>
					</div></li>
			</c:if>
		</ul>
	</div>

	<!-- Navbar on small screens -->
	<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top"
		style="margin-top: 46px">
		<ul class="w3-navbar w3-theme-d2 w3-left-align">

			<c:if test="${sessionScope.whologin == null}">
				<li><a href="${pageContext.request.contextPath}/member/login"
					class="w3-padding-large w3-text-black">LOGIN</a></li>
			</c:if>

			<c:if test="${sessionScope.whologin == 1}">
				<li><a href="${pageContext.request.contextPath}/member/mypage" class="w3-padding-large"> <c:if
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
			<li><a class="w3-padding-large w3-text-black"
				href="${pageContext.request.contextPath}/menu/listMenu">MENU</a></li>
			<li><a class="w3-padding-large w3-text-black"
				href="${pageContext.request.contextPath}/board/move/">BORAD</a></li>
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
