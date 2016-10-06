<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 20%; margin-right: 20%;">
		<div class="w3-section w3-padding-16">
			<img alt="" src="<%=imgFolder%>index1.jpg" width="100%"
				height="300px">
		</div>

		<h1>
			<div>
				<b>MENU</b>
			</div>
			<div align="right">
				<button type="button" class="btn btn-primary"
					onclick="location.href='/YamaBean/menu/order'">주문하기</button>
			</div>
		</h1>
		<fieldset style="height: 100px">
			<div class="w3-section w3-padding-16">
				<ul class="nav nav-pills">
					<li role="presentation"><input type="checkbox" name="menu_all"
						value="menu_all" checked="checked"><label for="menu_all">전체
							상품보기&nbsp;&nbsp;</label></li>
				</ul>
				<ul class="nav nav-pills">
					<li role="presentation"><input type="checkbox"
						name="cold_brew" value="cold_brew"><label for="cold_brew">콜드브루
							커피 &nbsp;&nbsp;</label></li>
					<li role="presentation"><input type="checkbox" name="brood"
						value="brood"><label for="brood">브루드
							커피&nbsp;&nbsp;</label></li>
					<li role="presentation"><input type="checkbox" name="espresso"
						value="espresso"><label for="espresso">에스프레소
							커피&nbsp;&nbsp;</label></li>
					<li role="presentation"><input type="checkbox"
						name="frappuccino" value="frappuccino"> <label
						for="frappuccino">프라푸치노&nbsp;&nbsp;</label></li>
					<li role="presentation"><input type="checkbox" name="bean"
						value="bean"><label for="bean">원두</label></li>
				</ul>
			</div>
		</fieldset>
		<!-- cold_brew -->
		<div class="w3-row-padding" id="cold_brew">
			<div class="page-header"
				style="background-color: #dcdcdc; padding-top: 5px; padding-left: 5px">
				<h4>콜드브루</h4>
			</div>
			<c:forEach var="item" items="${findByList}">
				<c:if test="${item.getM_category() == '콜드브루' }">
					<div class="w3-third w3-container w3-margin-bottom">
						<img src="<%=uploadedFolder%>image_name" alt="Norway"
							style="width: 100%" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${item.getM_name()}</b>
							</p>
							<p>${item.getContent()}</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<!-- brood -->
		<div class="w3-row-padding" id="brood">
			<div class="page-header"
				style="background-color: #dcdcdc; padding-top: 5px; padding-left: 5px">
				<h4>브루드</h4>
			</div>
			<c:forEach var="item" items="${findByList}">
				<c:if test="${item.getM_category() == '브루드커피' }">
					<div class="w3-third w3-container w3-margin-bottom">
						<img src="<%=uploadedFolder%>image_name" alt="Norway"
							style="width: 100%" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${item.getM_name()}</b>
							</p>
							<p>${item.getContent()}</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<!-- espresso -->
		<div class="w3-row-padding" id="espresso">
			<div class="page-header"
				style="background-color: #dcdcdc; padding-top: 5px; padding-left: 5px">
				<h4>에스프레소</h4>
			</div>
			<c:forEach var="item" items="${findByList}">
				<c:if test="${item.getM_category() == '에스프레소' }">
					<div class="w3-third w3-container w3-margin-bottom">
						<img src="<%=uploadedFolder%>image_name" alt="Norway"
							style="width: 100%" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${item.getM_name()}</b>
							</p>
							<p>${item.getContent()}</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<!-- frappuccino -->
		<div class="w3-row-padding" id="frappuccino">
			<div class="page-header"
				style="background-color: #dcdcdc; padding-top: 5px; padding-left: 5px">
				<h4>프라푸치노</h4>
			</div>
			<c:forEach var="item" items="${findByList}">
				<c:if test="${item.getM_category() == '프라푸치노' }">
					<div class="w3-third w3-container w3-margin-bottom">
						<img src="<%=uploadedFolder%>image_name" alt="Norway"
							style="width: 100%" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
								<b>${item.getM_name()}</b>
							</p>
							<p>${item.getContent()}</p>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

</body>
</html>
