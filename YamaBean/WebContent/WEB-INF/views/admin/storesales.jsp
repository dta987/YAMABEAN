<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문관리</title>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<div class="container-fluid" style="margin-top: 50px;">
		<div class="row content">

			<div class="col-sm-2 sidenav" align="center">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="${pageContext.request.contextPath}/admin/page">HOME</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/menu">메뉴관리</a></li>
					<li>---- 매장 ----</li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<c:forEach var="store" items="${StoreList}">
						<li><a
							href="${pageContext.request.contextPath}/admin/order?store=${store.store_num}">${store.store_name}</a></li>
					</c:forEach>
				</ul>
			</div>

			<div class="col-sm-9">
				<c:forEach var="bestmenu" items="${bestMenu}" begin="0" end="2"
					step="1" varStatus="status">
					<div class="w3-third w3-margin-bottom">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-black">
								<p class="w3-xlarge">
								<h1>${status.index +1}위</h1>
								</p>
							</li>

							<li class="w3-padding-16"><img alt="coffee"
								src="${uploadedFolder}${bestmenu.menu.image}">
								<h2 class="w3-wide">${bestmenu.menu.m_name}</h2> <span
								class="w3-opacity">누적판매 ${bestmenu.qty}</span></li>
						</ul>
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-9">
				<c:forEach var="StoretotalSales" items="${StoretotalSales}">
					<div class="w3-third w3-margin-bottom" onclick="location.href='${pageContext.request.contextPath}/admin/storetotalSales?num=${StoretotalSales.store_num}'">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-black">
								<p class="w3-xlarge">
								<h4>${StoretotalSales.store_name}</h4>
								</p>
							</li>
							<li class="w3-padding-16">
								<h2 class="w3-wide">${StoretotalSales.totalprice} 원</h2> <span class="w3-opacity">누적매출
							</span>
							</li>
						</ul>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</body>
</html>