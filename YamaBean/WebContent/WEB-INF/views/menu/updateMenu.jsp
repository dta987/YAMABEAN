<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
	
	<div align="center">
		<br>
		<h1>UpdateMenu</h1>
		<hr width="500px">
		<sf:form method="POST" enctype="multipart/form-data" modelAttribute="menuDomain">
		메뉴번호 menu_num <sf:input type="text" path="menu_num" disabled="true"/> <br><br>
		분류(커피/원두) m_group <sf:radiobutton value="A" path="m_group" />커피 
							<sf:radiobutton value="B" path="m_group" />원두<br><br>
		카테고리 m_category <sf:radiobutton value="콜드브루" path="m_category" />콜드브루
						<sf:radiobutton value="브루드커피" path="m_category" />브루드커피
						<sf:radiobutton value="에스프레소" path="m_category" />에스프레소
						<sf:radiobutton value="프라푸치노" path="m_category" />프라푸치노
						<sf:radiobutton value="원두" path="m_category" />원두<br><br>
		메뉴 이름 m_name <sf:input type="text" path="m_name"/><br><br>
		이미지 image <sf:input type="file" path="image" /><br><br>
		설명 content <sf:textarea path="content" /><br><br>
		가격 price <sf:input type="text" path="price" /><br><br>
	 	수량 qty : 메뉴수정에는 수량 등록 없음 
	 	
	 	<br><br>
	 	<button type="reset" onclick="goBack()">취소</button>
	 	<button type="submit" >메뉴 수정</button>
	 	
		</sf:form>
	</div>
	
</body>
</html>