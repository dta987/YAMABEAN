<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>

<%
	int myoffset = 3;
	int mywidth = twelve - 2 * myoffset;
	int label = 4;
	int input = 3;

	boolean idOverlapCheck = false;
	boolean nicknameOverlapCheck = false;
	boolean pwOverlapCheck = false;
	boolean emailOverlapCheck = false;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<form class="form-horizontal" style="margin-top: 200px;">
		<div class="form-group">
			<label class="control-label col-sm-<%=label%>" for="email">ID</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" name="id" id="id" placeholder="ID">
			</div>
			<div class="form-group"
				style="width: 110px; float: left; padding-left: 10px;" align="left">
				<input type="button" id="ajax_request"
					class="btn btn-primary btn-block" value="중복검사" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="password">PW</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="password" id="password"
					placeholder="Enter password">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="password">PW Check</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" name="password" id="password"
					placeholder="Enter password">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="checkbox">
					<label><input type="checkbox"> Remember me</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">Submit</button>
			</div>
		</div>
	</form>

	<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>"
		style="margin-top: 100px;">
		<form class="form-horizontal" method="POST">
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>ID</label>
				</div>
				<div class="form-group1" style="width: 230px; float: left;"
					align="left">
					<input type="text" name="id" id="id" class="form-control"
						placeholder="Enter Your ID" required />
				</div>
				<div class="form-group1"
					style="width: 110px; float: left; padding-left: 10px;" align="left">
					<input type="button" id="ajax_request"
						class="btn btn-primary btn-block" value="중복검사" />
				</div>
				<form:errors id="id" cssClass="error" />
			</div>

			<!-- 비밀번호 -->





			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>Password</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<input type="password" name="password" id="password"
						class="form-control" placeholder="Enter Your Password" required />
				</div>
				<form:errors id="password" cssClass="error" />
			</div>




			<!-- 닉네임 -->




			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>name</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<input type="text" name="name" id="name" class="form-control"
						placeholder="Enter Your Nickname" required />
				</div>
				<form:errors id="name" cssClass="error" />
			</div>

			<!-- email -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>email</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<input type="text" name="email" id="email" class="form-control"
						placeholder="Enter Your Nickname" required />
				</div>
				<form:errors id="email" cssClass="error" />
			</div>

			<!-- gender -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>Gender</label>
				</div>

				<div class="form-group1" style="width: 230px; float: left;"
					align="left">
					<div style="background-color: blue;">
						<div>
							<div style="float: left;">남자</div>
							<div style="float: left; width: 20px;">
								<input type="radio" name="gender" id="gender"
									class="form-control" value="남자" />
							</div>
						</div>

						<div>
							<div style="float: left;">여자</div>
							<div style="float: left; width: 20px;">
								<input type="radio" name="gender" id="gender"
									class="form-control" value="여자" />
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- phone -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>Phone</label>
				</div>
				<div class="form-group1" style="width: 230px; float: left;"
					align="left">
					<input type="text" name="phone" id="phone" class="form-control"
						placeholder="Ex) 01012345678" required />
				</div>
				<form:errors path="phone" cssClass="error" />
			</div>

			<!-- nickname -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>nickname</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<input type="text" name="nickname" id="nickname"
						class="form-control" placeholder="Enter Your E-Mail" required />
				</div>
				<form:errors id="nickname" cssClass="error" />
			</div>

			<!-- address -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>address</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<input type="text" name="address" id="address" class="form-control"
						placeholder="Enter Your E-Mail" required />
				</div>
				<form:errors id="address" cssClass="error" />
			</div>



			<!-- birth -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>B-day</label>
				</div>
				<div class="form-group1" style="width: 230px; float: left;"
					align="left">
					<input type="text" name="bday" id="bday" class="form-control"
						size="20" required />
				</div>
				<form:errors path="bday" cssClass="error" />
			</div>

			<div style="width: 80px;">
				<button type="submit" class="btn btn-primary btn-block">join</button>
			</div>
		</form>
	</div>
</body>
</html>
