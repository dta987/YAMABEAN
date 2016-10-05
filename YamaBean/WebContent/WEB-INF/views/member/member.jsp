<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<br>
		<h1>Menu</h1>
		<hr width="500px">

		<form class="form" method="POST">


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
					<input type="text" name="nickame" id="name" class="form-control"
						placeholder="Enter Your Nickname" required />
				</div>
				<form:errors id="name" cssClass="error" />
			</div>



			<!-- email -->

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


			<!-- 닉네임 -->


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



			<!-- profile -->


			<%-- 
            <div class="form-group1" align="left">
               <div class="form-group1" style="width: 240px; float: none;" align="left">
                  <label>Profile</label>
               </div>
               <div class="form-group1" style="width: 230px; float: left;" align="left">
                  <input type="file" name="u_profile" id="u_profile" class="form-control" />
               </div>
               <form:errors path="u_profile" cssClass="error" />
            </div> --%>


			<br> <br> <br>
			<div style="width: 80px;">
				<button type="submit" class="btn btn-primary btn-block">join</button>
			</div>
		</form>
	</div>
	>>>>>>> branch 'master' of https://github.com/dta987/YamaBean.git
</body>
</html>
