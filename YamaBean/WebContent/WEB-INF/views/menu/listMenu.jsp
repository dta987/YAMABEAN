<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<br>
		<h1>listMenu</h1>
		<hr width="500px">

		<div>
			<table>
				<tr>
					<th>menu_num</th>
					<th>메뉴분류</th>
					<th>메뉴카테고리</th>
					<th>메뉴이름</th>
					<th>메뉴이미지</th>
					<th>메뉴가격</th>
				</tr>
				<c:forEach var="getList" items="${findByList}">
					<tr>
						<td>${getList.menu_num}</td>
						<td>${getList.m_group}</td>
						<td>${getList.m_category}</td>
						<td>${getList.content}</td>
						<td><img src="/YamaBean/WebContent/WEB-INF/coffee/${getList.image_name}">${getList.image_name}</td> <!-- 왜이미지가안뜰까요 -->
						<td>${getList.price}</td>
						<td><a href="/YamaBean/menu/updateMenu?menu_num=${getList.menu_num}">수정</a></td>
						<td><a href="/YamaBean/menu/deleteMenu?menu_num=${getList.menu_num}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>