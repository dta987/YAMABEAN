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
				<c:forEach var="order" items="${orderList}">
					<div class="w3-third w3-margin-bottom">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-black">
								<p class="w3-xlarge">${order.member.nickname}</p> <span
								class="w3-opacity">(${order.member.id})</span>
							</li>
							<div style="height: 200px; overflow: auto;">
								<c:forEach var="orderProduct" items="${order.orderProduct}">
									<li class="w3-padding-16"><b>${orderProduct.m_name}</b>
										${orderProduct.order_p_qty} 개 <br>
										<b>Size-${orderProduct.optionsize}</b> / <b>Shot-${orderProduct.optionshot}</b> / <b>Whip-${orderProduct.optionwhip}</b></li>
								</c:forEach>
							</div>
							<li class="w3-padding-16">
								<h2 class="w3-wide">${order.totalprice}원</h2>
							</li>
							<li class="w3-light-grey w3-padding-24">
								<button class="w3-btn w3-green w3-padding-large"
									onclick="location.href='${pageContext.request.contextPath}/admin/receipt?num=${order.order_num}&val=1&store=${order.store_num}'">
									수 령</button>
							</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>