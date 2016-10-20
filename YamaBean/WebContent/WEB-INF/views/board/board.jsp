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
		<label>Q & A</label><br> <br>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="boardList" items="${boardList}">
					<tr>
						<td>${boardList.board_num}</td>
						<td><a
							href="${pageContext.request.contextPath}/board/detail?num=${boardList.board_num}">${boardList.title}</a></td>
						<td>${boardList.member_id}</td>
						<td>${boardList.sub_day}</td>
					</tr>
				</c:forEach>
			</tbody>

			<tr>
				<td colspan="10" align="center">
					<form class="form-inline" role="form" name="myform"
						action="${pageContext.request.contextPath}/board/move"
						method="get">
						<div class="form-group">
							<select class="form-control" name="mode" id="mode">
								<option value="-" selected="selected">--- 선택하세요 ---
								<option value="board_num">글 번호
								<option value="title">제목
								<option value="member_id">아이디
							</select>
						</div>
						<div class="form-group">
							<input type="text" class="form-control btn-xs" name="keyword"
								id="keyword" placeholder="검색 키워드">
						</div>
						<button id="search"
							class="w3-btn w3-white w3-border w3-round-large" type="submit">SEARCH</button>
						<button class="w3-btn w3-white w3-border w3-round-large"
							type="button" id="searchAll"
							onclick="location.href='${pageContext.request.contextPath}/board/move'">ALL</button>
						<button class="w3-btn w3-white w3-border w3-round-large"
							type="button" id="insertForm" onclick="location.href='${pageContext.request.contextPath}/board/boardForm'">WRITE</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</form>
				</td>
			</tr>
		</table>
		<div class="w3-container" align="center">
			<ul class="w3-pagination">
				<li><a href="#">&laquo;</a></li>
				<c:forEach begin="${beginPage}" end="${endPage}" step="1" var="page"
					varStatus="pageing">
					<li><a href="${pageContext.request.contextPath}/board/move?selectPage=${pageing.index}">${pageing.index}</a></li>
				</c:forEach>
				<li><a href="#">&raquo;</a></li>
			</ul>
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
