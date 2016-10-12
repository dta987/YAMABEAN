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
		<div>
			<h1>
				<b>List MY MENU</b>
			</h1>

			<table>
				<tr align="center">
					<th>마이메뉴이름</th>
					<th>등록날짜</th>
					<th>사이즈</th>
					<th>가격</th>
					<th>옵션 내용</th>					
				</tr>
				<c:forEach var="mymenulist" items="${allListMyMenu}">
					<tr align="center">
						<td>${mymenulist.mymenu_name}</td>
						<td>${mymenulist.sub_day}</td>
						<td>${mymenulist.my_optionSize}</td>
						<td>${mymenulist.mymenu_price}</td>
						<td>수량 ${mymenulist.my_optionAmount} / 샷 ${mymenulist.my_optionShot} / 휘핑 ${mymenulist.my_optionWhip}</td>
						<td><a href="/YamaBean/mymenu/updateMyMenu?mymenu_num=${mymenulist.mymenu_num}">수정</a></td>
						<td><a href="/YamaBean/mymenu/deleteMyMenu?mymenu_num=${mymenulist.mymenu_num}">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
	
</body>
</html>
