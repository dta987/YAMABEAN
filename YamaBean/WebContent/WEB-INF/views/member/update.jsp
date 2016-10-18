<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
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
<title>Member Update</title>
</head>
<body>
	<%-- ${member.id}
${member.password}
${member.name}
${member.email}
${member.gender}
${member.phone}
${member.nickname}
${member.address}
${member.bday}
${member.joinday}
${member.point} --%>

<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>"
		style="margin-top: 100px;">
		<sf:form class="form-horizontal" method="POST" modelAttribute="member">
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>ID</label>
				</div>
				<div class="form-group1" style="width: 230px; float: left;"
					align="left">
					<sf:input type="text" path="id" name="id" id="id"
						class="form-control" disabled="true" placeholder="Enter Your ID" />
				</div>
			</div>

			<!-- 비밀번호 -->

			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>Password</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<sf:input type="password" path="password" name="password"
						id="password" class="form-control"
						placeholder="Enter Your Password" />
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
					<sf:input type="text" path="name" name="name" id="name"
						class="form-control" placeholder="Enter Your Nickname" />
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
					<sf:input type="text" path="email" name="email" id="email"
						class="form-control" placeholder="Enter Your Nickname" />
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
								<sf:input path="gender" name="gender" id="gender"
									class="form-control" value="남자" />
							</div>
						</div>

						<div>
							<div style="float: left;">여자</div>
							<div style="float: left; width: 20px;">
								<sf:input path="gender" name="gender" id="gender"
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
					<sf:input type="text" path="phone" name="phone" id="phone"
						class="form-control" placeholder="Ex) 01012345678" />
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
					<sf:input type="text" path="nickname" name="nickname" id="nickname"
						class="form-control" placeholder="Enter Your E-Mail" />
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
					<sf:input type="text" path="address" name="address" id="address"
						class="form-control" placeholder="Enter Your address" />
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
					<sf:input type="text" path="bday" name="bday" id="bday"
						class="form-control" size="20" />
				</div>
				<form:errors path="bday" cssClass="error" />
			</div>

			<!-- joinday -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>joinday</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<sf:input type="text" path="joinday" name="joinday" id="joinday"
						class="form-control" placeholder="Enter Your joinday" />
				</div>
				<form:errors id="joinday" cssClass="error" />
			</div>

			<!-- point -->
			<div class="form-group1" align="left">
				<div class="form-group1" style="width: 240px; float: none;"
					align="left">
					<label>point</label>
				</div>
				<div class="form-group1" style="float: left;" align="left">
					<sf:input type="text" path="point" id="point" class="form-control"
						placeholder="Enter Your point" />
				</div>
				<form:errors id="point" cssClass="error" />
			</div>

			<div style="width: 80px;">
				<button type="submit" class="btn btn-primary btn-block">update</button>
				<button type="reset" class="btn btn-primary btn-block">reset</button>
			</div>
		</sf:form>
	</div> 
</body>
</html>
