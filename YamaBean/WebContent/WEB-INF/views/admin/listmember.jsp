<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비번</th>
				<th>이름</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>별명</th>
				<th>주소</th>
				<th>생일</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>포인트</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>

		<c:forEach var="bean" items="${members}">
			<tr>
				<td>${bean.id}</td>
				<td>${bean.password}</td>
				<td>${bean.name}</td>
				<td>${bean.gender}</td>
				<td>${bean.phone}</td>
				<td>${bean.nickname}</td>
				<td>${bean.address}</td>
				<td>${bean.bday}</td>
				<td>${bean.email}</td>
				<td>${bean.joinday}</td>
				<td>${bean.point}</td>
				<td><a href="update?id=${bean.id}">수정</a></td>
				<td><a href="delete?id=${bean.id}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>