<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>

<c:set value="${twelve - 2}" var="mywidth"></c:set>
<c:set value="1" var="myoffset"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<head>
<style>
tr:hover {
	background-color: #cbe7cb
}
</style>

</head>
<body>
	<br>
	<br>
	<div class="col-sm-offset-${myoffset} col-sm-${mywidth}">
		<!-- <div class="panel-heading">게시판</div> -->
		<label>Q & A</label><br> <br>
		<table class="table" align="center">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<c:if test="${sessionScope.whologin == 2}">
						<th>수정</th>
						<th>삭제</th>
					</c:if>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td>${bean.board_no}</td>
						<td><a href="#"></a></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform" action=""
						method="post">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">-- 선택하세요---------
								
								<option value="board_no">글 번호
								<option value="board_title">제목
								<option value="user_nickname">닉네임
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control btn-xs" name="keyword"
								id="keyword" placeholder="검색 키워드">
						</div>
						<button id="search" class="topmybutton topmybutton1" type="submit">SEARCH</button>
						<button class="topmybutton topmybutton1" type="button"
							id="searchAll">ALL</button>
						<button class="topmybutton topmybutton1" type="button"
							id="insertForm">WRITE</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<p class="form-control-static">${requestScope.pagingStatus}</p>
					</form>
				</td>
			</tr>
		</table>
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#search").click(
							function() {
								if ($("#mode").val() != "-") {
									if ($("#keyword").val() == ""
											|| $("#keyword").val() != null) {
										return true;
									} else {
										alert("키워드 값을 입력해주세요");
										return false;
									}
								} else {
									alert("검색 모드를 선택해주세요");
									return false;
								}

							});
				});
	</script>



</body>
</html>
