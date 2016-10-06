<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h1>DetailMenu</h1>
		<hr width="500px">

		<div>
			<table>
				<tr>
					<th>메뉴이미지</th>
					<th>메뉴카테고리</th>
					<th>메뉴이름</th>
					<th>메뉴가격</th>
					<th>메뉴내용</th>
					
				</tr>
				<tr>
						<td><img src="/YamaBean/WEB-INF/coffee/${menuModel.image_name}"></td>
						<td>${menuModel.m_category}</td>
						<td>${menuModel.m_name}</td>
						<td>${menuModel.price}</td>
						<td>${menuModel.content}</td>
				</tr>
			</table>
		</div>
		
		<button type="reset" onclick="goBack()">리스트 보기</button>
	</div>

</body>
</html>