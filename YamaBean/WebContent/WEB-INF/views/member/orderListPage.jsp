<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.w3-third img {
	margin-bottom: -6px;
	opacity: 0.8
}

.w3-third img:hover {
	opacity: 1
}
</style>
</head>
<body>

	<!-- Sidenav/menu -->
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
		href="${pageContext.request.contextPath}/member/listMyMenu" onclick="w3_close()" class="w3-padding">My Menu</a> </nav>

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
		<c:if test="${empty orderList}">
			<div
				class="w3-white w3-center w3-text-black w3-padding-32 w3-padding"
				id="about">
				<h4>
					<p>
						<button class="w3-btn w3-light-grey">
							<b>최근 주문 목록이 없습니다</b>
						</button>
					</p>
				</h4>
			</div>
		</c:if>
		<c:if test="${not empty orderList}">
			<div class="w3-row">
				<div class="col-sm-9 col-sm-offset-1">
					<c:forEach var="order" items="${orderList}">
						<div class="w3-third w3-margin-bottom col-sm-4">
							<ul class="w3-ul w3-border w3-center w3-hover-shadow">
								<li class="w3-black">
									<p class="w3-xlarge">${order.member.nickname}</p> <span
									class="w3-opacity">${order.sub_day}</span>
								</li>
								<div style="height: 200px; overflow: auto;">
									<c:forEach var="orderProduct" items="${order.orderProduct}">
										<li class="w3-padding-16"><b>${orderProduct.m_name}</b>
											${orderProduct.order_p_qty} 개</li>
									</c:forEach>
								</div>
								<li class="w3-padding-16">
									<h2 class="w3-wide">${order.totalprice}원</h2>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- Pagination -->
			<div class="w3-center w3-padding-32">
				<ul class="w3-pagination">
					<li><a class="w3-black" href="#">더보기</a></li>
				</ul>
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