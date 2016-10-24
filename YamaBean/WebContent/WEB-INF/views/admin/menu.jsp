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
	height: 1500px;
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
@media screen and (max-width: 1500px) {
	.sidenav {
		height: 1500px;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<script type="text/javascript">
	function myFunction(id) {
		var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-theme-d1";
		} else {
			x.className = x.className.replace("w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-theme-d1", "");
		}
	}
</script>
</head>
<body>

	<div class="container-fluid" style="margin-top: 50px;">
		<div class="row content">
			<div class="col-sm-2 sidenav" align="center">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="${pageContext.request.contextPath}/admin/page">HOME</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/menu">메뉴관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/member">회원관리</a></li>
					<li>---- 매장 ----</li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<c:forEach var="store" items="${StoreList}">
						<li><a
							href="${pageContext.request.contextPath}/admin/order?store=${store.store_num}">${store.store_name}</a></li>
					</c:forEach>
				</ul>
			</div>

			<div class="w3-padding-10 w3-container"
				style="height: 1500; overflow: auto;">
				<button onclick="myFunction('Demo1')"
					class="w3-btn-block w3-light-grey">
					<h3>콜드블루</h3>
				</button>
				<div id="Demo1" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${menuList}">
						<c:if test="${item.getM_category() == '콜드브루' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}" onclick="location.href='${pageContext.request.contextPath}/menu/detailMenu?menu_num=${item.menu_num}'">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
								<div style="text-align: center;">
									<h4>${item.getM_name()}</h4>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo2')"
					class="w3-btn-block w3-light-grey">
					<h3>브루드</h3>
				</button>
				<div id="Demo2" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${menuList}">
						<c:if test="${item.getM_category() == '브루드커피' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}" onclick="location.href='${pageContext.request.contextPath}/menu/detailMenu?menu_num=${item.menu_num}'">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
								<div style="text-align: center;">
									<h4>${item.getM_name()}</h4>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo3')"
					class="w3-btn-block w3-light-grey">
					<h3>에스프레소</h3>
				</button>
				<div id="Demo3" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${menuList}">
						<c:if test="${item.getM_category() == '에스프레소' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}" onclick="location.href='${pageContext.request.contextPath}/menu/detailMenu?menu_num=${item.menu_num}'">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
								<div style="text-align: center;">
									<h4>${item.getM_name()}</h4>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo4')"
					class="w3-btn-block w3-light-grey">
					<h3>프라푸치노</h3>
				</button>
				<div id="Demo4" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${menuList}">
						<c:if test="${item.getM_category() == '프라푸치노' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}" onclick="location.href='${pageContext.request.contextPath}/menu/detailMenu?menu_num=${item.menu_num}'">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
								<div style="text-align: center;">
									<h4>${item.getM_name()}</h4>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
</body>
</html>