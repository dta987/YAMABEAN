<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<br>
		<h1>DetailMenu</h1>
		<hr width="500px">

		<div>
			<table>
				<tr>
					<th>마이메뉴이미지</th>
					<th>마이메뉴이름</th>
					<th>마이메뉴사이즈</th>
					<th>마이메뉴등록날짜</th>
					<th>마이메뉴가격</th>
					<th>마이메뉴옵션</th>
					<th>메뉴내용</th>

				</tr>
				<tr>
					<td><img src="/YamaBean/WEB-INF/coffee/"></td>
					<td>${mymenuDomain.mymenu_name}</td>
					<td>${mymenuDomain.my_optionSize}</td>
					<td>${mymenuDomain.sub_day}</td>
					<td>${mymenuDomain.mymenu_price}</td>
					<td>샷 ${mymenuDomain.my_optionShot} / ${mymenuDomain.my_optionWhip}</td>
				</tr>
			</table>
		</div>

		<button type="reset" onclick="goBack()">리스트 보기</button>
	</div>

</body>
</html>