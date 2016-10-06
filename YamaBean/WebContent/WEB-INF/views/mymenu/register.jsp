<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<br>
		<h1>MenuList</h1>
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
				<c:forEach var="getList" items="${findByList}">
					<td><img src="/YamaBean/WEB-INF/coffee/${getList.image_name}"></td>
					<td>${getList.m_category}</td>
					<td><a href="">${getList.m_name}</a></td>
					<td>${getList.price}</td>
					<td>${getList.content}</td>
				</c:forEach>
			</table>
		</div>

		<div>
			<sf:form method="POST">
			<table>
				<tr>
					<td>마이메뉴 이름</td>
					<td><input type="text" name="mymenu_name"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="mymenu_name"></td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td><input type="text" name="mymenu_name"></td>
				</tr>
				<tr>
					<td>퍼스널 옵션</td>
				</tr>
				<tr>
					<td>샷 추가 (+ 500원)</td>
					<td><input ty></td>
					<td></td>
				</tr>
				<tr>
					<td>시럽 추가 (+ 500원)</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>휘핑 추가 (+ 500원)</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>드리즐 추가 (+ 500원)</td>
					<td></td>
					<td></td>
				</tr>
				
				
			</table>
			</sf:form>
		</div>
	</div>


<!-- mymenu_num 마이메뉴 번호
member_id 회원아이디 (fk, member : id)
mymenu_name 마이메뉴이름
menu 메뉴번호 (fk, menus : memu_num)
my_option 마이옵션
sub_day 마이메뉴등록일자 -->

</body>
</html>