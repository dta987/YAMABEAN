<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/rvTOP.jsp"%>

<c:set value="3" var="myoffset"></c:set>
<c:set value="${twelve} - ${myoffset}" var="mywidth"></c:set>
<c:set value="3" var="label"></c:set>
<c:set value="3" var="input"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function() {
		$("#deleteForm").submit(function() {
			var password = $("#password").val();
			var password2 = $("#password2").val();
			if (password == password2) {
				if (confirm("정말 탈퇴 하시겠습니까....?")) {
					return true;
				}
			} else {
				alert("비밀번호가 다릅니다.");
				return false;
			}
		});

	})
</script>
<body>


	<div class="w3-white w3-center w3-padding-24"
		style="margin-top: 150px;">회원 탈퇴</div>
	<br>
	<div class="container col-md-offset-${myoffset}">
		<form class="form-horizontal" method="POST" id="deleteForm">
			<div class="form-group" style="display: none;">
				<div class="col-md-${input}">
					<input type="password" class="form-control" id="password"
						name="password" readonly="readonly"
						value="${sessionScope.loginInfo.password}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-${label}" for="pwd">Password
					:</label>
				<c:if test="${empty msg}">
					<div class="col-md-${input}">
						<input type="password" class="form-control" id="password2"
							name="password2" placeholder="Enter PassWord">
					</div>
				</c:if>
				<c:if test="${not empty msg}">
					<div class="col-md-${input}">
						<input type="password" class="form-control" id="password2"
							name="password2" placeholder="Enter PassWord" disabled="disabled">
					</div>
				</c:if>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-${label} col-sm-10">
					<button type="submit" class="btn btn-success">탈 퇴</button>
				</div>
			</div>
		</form>
	</div>
	
	<c:if test="${not empty msg}">
		<script type="text/javascript">
			alert('${msg}');
		</script>
	</c:if>
</body>
</html>