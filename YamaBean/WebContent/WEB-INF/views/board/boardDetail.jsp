<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<c:set value="${twelve - 2}" var="mywidth"></c:set>
<c:set value="1" var="myoffset"></c:set>
<c:set value="1" var="formleft"></c:set>
<c:set value="${twelve - formleft}" var="formright"></c:set>

<script type="text/javascript">
	$(function() {
		$("#writerForm").submit(function() {
			if ($("#title").val() == "") {
				alert("Title를 입력해주세요");
				return false;
			} else if ($("#divcontext").text() == "") {
				alert("내용을 입력해주세요");
				return false;
			} else {
				$("#divtext").val($("#divcontext").text());
				return true;
			}
		});

	});
</script>

</head>
<body>

	<div class="col-sm-offset-${myoffset} col-sm-${mywidth}"
		style="margin-top: 100px;">
		<form id="detailForm" class="form-horizontal" role="form" id="frm">
			<label>BOARD DETAIL</label>
			<hr style="border: solid;">
			<div class="form-group ">
				<label class="control-label col-sm-${formleft}" for="subject">TITLE</label>
				<div class="col-sm-${mywidth}">
					<input type="text" class="form-control" name="title" id="title"
						value="${board.title}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-${formleft}" for="content">NOTE</label>
				<div class="col-sm-${mywidth}">
					<div id="divcontext" class="form-control"
						style="height: 300px; overflow: auto;">${board.contents}</div>
				</div>
			</div>
			<div class="form-group">
				<div align="center" class="col-sm-offset-6 col-sm-9">
					<button class="w3-btn w3-white w3-border w3-round-large"
						type="button" onclick="location.href='${pageContext.request.contextPath}/board/update?num=${board.board_num}'">UPDATE</button>
				</div>
			</div>
		</form>
	</div>


</body>
</html>