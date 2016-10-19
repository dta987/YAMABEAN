<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="/resources/demos/external/jquery-mousewheel/jquery.mousewheel.js"></script>
<script>
	$(function() {
		var spinner = $("#spinnerAmount").spinner({ min : 0 });
		alert(spinner.spinner("my_optionAmount"));
		
		 $( "#getvalue" ).on( "click", function() {

		      alert( spinner.spinner( "my_optionAmount" ) );

		    });


		 
		var spinnerShot = $("#spinnerShot").spinner({ min : 0 });
		var spinnerWhip = $("#spinnerWhip").spinner({ min : 0 });
		
		$( "#amountPrice" ).val(spinnerAmount);
		
		$( "button" ).button();

	});

	
</script>
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
				</tr>
				<c:forEach var="getList" items="${allFindMenus}">
					<tr>
					<td><img src="/YamaBean/WEB-INF/coffee/${getList.image_name}"></td>
					<td>${getList.m_category}</td>
					<td><a href="/YamaBean/mymenu/selectMenu">${getList.m_name}</a></td>
					<td>${getList.price}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<br> <br> <br> <br>
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
					<td><img src="/YamaBean/WEB-INF/coffee/${selectMenuModel.image_name}"></td>
					<td>${selectMenuModel.m_category}</td>
					<td>${selectMenuModel.m_name}</td>
					<td>${selectMenuModel.price}</td>
					<td>${selectMenuModel.content}</td>
				</tr>
			</table>			
		</div>
		<br> <br> <br> <br>	 
		
		<div>
			<form action="/YamaBean/mymenu/registerMyMenu" method="POST">
			메뉴 번호	<input type="text" name="menu_num"><br><br>
			회원 ID	<input type="text" name="member_id"><br><br>
			마이메뉴 이름	<input type="text" name="mymenu_name"><br><br>
			수량		<input id="spinnerAmount" name="my_optionAmount">
					<input type="text" name="amountPrice"> <button id="getvalue">Get value</button><br><br>
					
			사이즈	<input type="radio" value="small" name="my_optionSize">small 
					<input type="radio" value="large" name="my_optionSize">large
					<input type="text" name="sizePrice"><br><br>					
			퍼스널 옵션<br><br>
			샷 추가 (+ 500원)	<input id="spinnerShot" name="my_optionShot">
							<input type="text" name="shotPrice"><br><br>
			휘핑 추가 (+ 500원)	<input id="spinnerWhip" name="my_optionWhip">
							<input type="text" name="whipPrice"><br><br>
			총 금액			<input type="text" name="mymenu_price"><br><br>
				<button type="submit">마이 메뉴 등록</button>
			</form>
		</div>
	</div>


	<!-- private int mymenu_num ;
	private Member member_id ; //fk, member : id 
	private String mymenu_name ;
	private MenuEntity menu_num ; //fk, menus : menu_num 
	private String my_optionSize ; 
	private String sub_day ;
	private int mymenu_price;
	private int my_optionAmount ;
	private int my_optionShot ;
	private int my_optionWhip ;
	
	 -->

</body>
</html>