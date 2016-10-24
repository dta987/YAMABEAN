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
<body>
	<div class="container col-md-offset-${myoffset}"
		style="margin-top: 200px;">
		<form class="form-horizontal"
			action="${pageContext.request.contextPath}/member/login"
			method="POST">
			<div class="form-group">
				<label class="control-label col-md-${label}" for="email">ID:</label>
				<div class="col-md-${input}">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="Enter password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-${label}" for="pwd">Password:</label>
				<div class="col-md-${input}">
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Enter password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-${label} col-sm-10">
					<button type="submit" class="btn btn-success">Login</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='${pageContext.request.contextPath}/member/signup'">SignUp</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='${pageContext.request.contextPath}/member/forgotten'">ID/PW</button>

				</div>
			</div>
		</form>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			$("#mesubmit").click(function() {
				$("#loginForm").submit();
			});
		});
	</script>

	<c:if test="${not empty msg}">
		<script type="text/javascript">
			alert('${msg}');
		</script>
	</c:if>
</body>
</html>
