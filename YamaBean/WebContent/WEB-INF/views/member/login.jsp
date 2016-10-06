<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<%
	int myoffset = 3;
	int mywidth = twelve - myoffset;
	int label = 3;
	int input = (twelve / 2) - label;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div class="container col-md-offset-<%=myoffset%>" style="margin-top: 200px;">
		<form class="form-horizontal" action="/YamaBean/member/login" method="POST">
			<div class="form-group">
				<label class="control-label col-md-<%=label%>" for="email">ID:</label>
				<div class="col-md-<%=input%>">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="Enter password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-<%=label%>" for="pwd">Password:</label>
				<div class="col-md-<%=input%>">
					<input type="password" class="form-control" id="password" name="password"
						placeholder="Enter password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-<%=label%> col-sm-10">
					<button type="submit" class="btn btn-success">Login</button>
					<button type="button" class="btn btn-primary" onclick="location.href='/YamaBean/member/signup'">SignUp</button>
					<button type="button" class="btn btn-default" onclick="location.href='/YamaBean/member/signup'">ID/PW</button>
					
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
</body>
</html>
