<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>

	<div class="container-fluid" style="margin-top: 100px;">
		<div class="row content">
			<form id="updateMyMenu"
				action="${pageContext.request.contextPath}/menu/createMenu"
				method="post" enctype="multipart/form-data">
				<div class="col-sm-12 col-sm-offset-4">
					<div class="w3-third w3-margin-bottom ">
						<input type="hidden" value="coffee" name="m_group" />
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-black">
								<p class="w3-xlarge">Menu</p> <span class="w3-opacity">메뉴를
									추가하자</span>
							</li>
							<li class="w3-padding-16"><label>메뉴 이름 </label><br> <input
								type="text" name="m_name" /></li>
							<li class="w3-padding-16"><label>카테고리 </label><br> <input
								type="radio" value="콜드브루" name="m_category" />콜드브루
								&nbsp;&nbsp;&nbsp; <input type="radio" value="브루드커피"
								name="m_category" />브루드커피 &nbsp;&nbsp;&nbsp; <input
								type="radio" value="에스프레소" name="m_category" />에스프레소
								&nbsp;&nbsp;&nbsp; <input type="radio" value="프라푸치노"
								name="m_category" />프라푸치노</li>
							<li class="w3-padding-16 w3-center"><label>이미지 </label><br>
								<input type="file" name="image"></li>
							<li class="w3-padding-16"><label> 설명 </label><br> <input
								type="text" name="content" /></li>
							<li class="w3-padding-16">
								<h3 class="w3-wide">
									<input type="text" name="price" size="3"/> 원
								</h3> <span class="w3-opacity">가격</span></li>
							<li class="w3-light-grey w3-padding-24">
								<button type="submit" class="w3-btn w3-green w3-padding-large">저장</button>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>


	<footer class="w3-container w3-padding-32" id="contact"> </footer>


	<div class="w3-black w3-center w3-padding-24">YamaBean</div>

</body>
</html>