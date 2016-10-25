<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Sidenav/menu -->
	<nav
		class="w3-sidenav w3-white w3-animate-left w3-center w3-text-grey w3-collapse w3-top-50"
		style="z-index:3;width:300px;font-weight:bold;" id="mySidenav">
	<br>
	<h3 class="w3-padding-64" onclick="location.href='${pageContext.request.contextPath}/member/mypage'">
		<b>MYPAGE<br> <br>${sessionScope.loginInfo.nickname}
		</b>
	</h3>
	<a href="${pageContext.request.contextPath}/member/orderlist" ${pageContext.request.contextPath}/member/orderlist="w3_close()" class="w3-padding">주문 내역</a> <a
		href="${pageContext.request.contextPath}/member/update" onclick="w3_close()" class="w3-padding">개인 정보</a> <a
		href="${pageContext.request.contextPath}/mymenu/listMyMenu" onclick="w3_close()" class="w3-padding">My Menu</a> </nav>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
	<span class="w3-left w3-padding">${sessionScope.loginInfo.nickname}</span> <a
		class="w3-right w3-btn w3-white" onclick="w3_open()">☰</a> </header>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px; margin-top: 50px">

		<!-- Push down content on small screens -->
		<div class="w3-hide-large" style="margin-top: 83px"></div>

		<!-- Photo grid -->
		<c:if test="${empty allListMyMenu}">
			<div
				class="w3-white w3-center w3-text-black w3-padding-32 w3-padding"
				id="about">
				<h4>
					<p>
						<button class="w3-btn w3-light-grey">
							<b>등록된 메뉴가 없습니다 </b>
						</button>
					</p>
				</h4>
			</div>
		</c:if>
		<c:if test="${not empty allListMyMenu}">
			<div class="w3-row">
				<div class="col-sm-9 col-sm-offset-1">
					<c:forEach var="mymenu" items="${allListMyMenu}">
						<div class="w3-third w3-margin-bottom col-sm-4">
							<ul class="w3-ul w3-border w3-center w3-hover-shadow">
								<li class="w3-black">
									<p class="w3-xlarge">${mymenu.mymenu_name}</p> <span
									class="w3-opacity">${mymenu.menuEntity.m_name}</span>
								</li>
								<li class="w3-padding-16"><b><img width="80%" src="${uploadedFolder}${mymenu.menuEntity.image}"></b></li>
								<li class="w3-padding-16">Size : <b>${mymenu.my_optionSize}</b></li>
								<li class="w3-padding-16">Shot : <b>${mymenu.my_optionShot}</b></li>
								<li class="w3-padding-16">Whip : <b>${mymenu.my_optionWhip}</b></li>
								<li class="w3-padding-16">
									<h2 class="w3-wide">${mymenu.mymenu_price}원</h2>
								</li>
								<li class="w3-black">
									<a class="w3-black" href="${pageContext.request.contextPath}/mymenu/updateMyMenu?mymenu_num=${mymenu.mymenu_num}">수정 </a>
									&nbsp;&nbsp;&nbsp;
									<a class="w3-black" href="${pageContext.request.contextPath}/mymenu/deleteMyMenu?mymenu_num=${mymenu.mymenu_num}">삭제</a>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>




		<footer class="w3-container w3-padding-32" id="contact"> </footer>


		<div class="w3-black w3-center w3-padding-24">YamaBean</div>

		<!-- End page content -->
	</div>

	<script>
		// Script to open and close sidenav
		function w3_open() {
			document.getElementById("mySidenav").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidenav").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}

		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}
	</script>



</body>
</html>
