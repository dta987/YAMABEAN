<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JoinForm</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script language="javascript" type="text/javascript">
	//정규표현식을 위한것
	function id_write(re, e, msg) {
		if (re.test(e.value))
			return true;
		alert(msg);
		e.value = "";
		e.focus();
		return false;
	}
	function password_write(re, e, msg) {
		if (re.test(e.value))
			return true;
		alert(msg);
		e.value = "";
		e.focus();
		return false;
	}
	function password_check(e1, e2, msg) {
		if (e1.value == e2.value)
			return true;
		alert(msg);
		e2.value = "";
		e2.focus();
		return false;
	}
	function name_write(re, e, msg) {
		if (re.test(e.value))
			return true;
		alert(msg);
		e.value = "";
		e.focus();
		return false;
	}
	function first_email_write(re, e, msg) {
		if (re.test(e.value))
			return true;
		alert(msg);
		e.value = "";
		e.focus();
		return false;
	}
	function last_email_write(re, e, msg) {
		if (re.test(e.value))
			return true;
		alert(msg);
		e.value = "";
		e.focus();
		return false;
	}
	function phone_write(re, e, msg) {
		if (re.test(e.value))
			return true;
		alert(msg);
		e.value = "";
		e.focus();
		return false;
	}
	function nickname_write(re, e, msg) {
		if (re.test(e.value))
			return true;
		alert(msg);
		e.value = "";
		e.focus();
		return false;
	}

	//회원가입 유효성 검사 
	function checkIt() {
		/* var id = document.getElementById("id"); */
		var password = document.getElementById("password");
		var password2 = document.getElementById("password2");
		var name = document.getElementById("name");
		var gender = document.getElementById("gender");
		/* var first_email = document.getElementById("first_email");
		var last_email = document.getElementById("last_email"); */
		var phone = document.getElementById("phone");
		var zipcode = document.getElementById("zipcode");
		/* var nickname = document.getElementById("nickname"); */

		/*  if(!id_write(/^[a-z][a-z\d]{1,11}$/, id, "ID는 영문자로 시작,공백과 특수문자 제외 ,4~12글자만 사용해주세요")){
			 return false;
		 }  */
		/* if(!nickname_write(/[^a-zA-Z0-9가-히\_]/g, nickname, "닉네임은 _ 를 제외한 특수기호는 입력 불가능합니다.")){
		 return false;
		}  */
		/* if (!password_write(
				/^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/,
				password, "Password는 특수문자,숫자,글자를 포함해주세요")) {
			return false;
		} */
		if (!password_check(password, password2, "비밀번호를 확인해주세요 ")) {
			return false;
		}
		if (!name_write(/^[가-힝]{2,5}$/, name, "이름을 확인해주세요")) {
			return false;
		}
		if (!first_email_write(/^[a-z][a-z\d]{3,11}$/, first_email, "이메일 입력")) {
			return false;
		}
		if (!last_email_write(
				/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/,
				last_email, "이메일 입력")) {
			return false;
		}
		if (!phone_write(
				/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/,
				phone, "전화번호 입력")) {
			return false;
		}
		//필수 체크요소
		if ($(':radio[name="gender"]:checked').length < 1) {
			alert("성별을 입력하세요");
			return false;
		}
		if (!member.birth.value) {
			alert("생년월일을 입력하세요");
			return false;
		}
		if (!member.zipcode.value) {
			alert("주소를 입력하세요");
			return false;
		}
	}

	//생년월일
	$(document).ready(

			function() {
				var clareCalendar = {

					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					weekHeader : 'Wk',
					dateFormat : 'yymmdd', //형식(20120303)
					autoSize : false, //오토리사이즈(body등 상위태그의 설정에 따른다)
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
					yearRange : '1900:2020' //1990년부터 2020년까지
				};
				$("#birth").datepicker(clareCalendar);
				$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
			});

	//이메일
	$(function() {
		$('#email_select').change(function() {
			if ($('#email_select').val() == "1") {
				$("#last_email").val(""); //값 초기화
				$("#last_email").prop("readonly", false); //활성화
			} else {
				$("#last_email").val($('#email_select').val()); //선택값 입력
				$("#last_email").prop("readonly", true); //비활성화
			}
		});
	});

	//주소
	function zipCheck() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("address").value = fullRoadAddr;

				document.getElementById('address').focus();
			}
		}).open();
	}
	$(function() {
		/* $("#id")
				.change(
						function() {
							if (id_write(/^[a-z][a-z\d]{3,11}$/, document
									.getElementById("id"),
									"ID는 영문자로 시작,공백과 특수문자 제외 ,4~12글자만 사용해주세요")) {
								$
										.ajax({
											type : "post",
											url : "${pageContext.request.contextPath}/member/overlabCheck",
											dataType : "JSON",
											data : {
												"keyword" : $("#id").val(),
												"mode" : "id",
											},
											success : function(result) {
												if (result) {
													$("#mylabelid")
															.html(
																	"<span><font color='red'>중복된 ID 입니다.</font></span>");
													$("#overcheckid")
															.val(false);
												} else {
													$("#mylabelid")
															.html(
																	"<span><font color='green'>사용 가능한 ID 입니다.</font></span>");
													$("#overcheckid").val(true);
												}

											}
										});
							} else {
								$("#mylabelid")
										.html(
												"<span><font color='red'>ID는 \n영문자로 시작,공백과 특수문자 제외 ,4~12글자만 사용해주세요</font></span>");
								$("#overcheckid").val(false);
							}
						}); */

		$("#nickname")
				.change(
						function() {
							if (nickname_write(/^[a-zA-Z0-9가-히\_]/, document
									.getElementById("nickname"),
									"닉네임은 '가나다', 'abc' 등만 사용가능합니다")) {
								$
										.ajax({
											type : "post",
											url : "${pageContext.request.contextPath}/member/overlabCheck",
											dataType : "JSON",
											data : {
												"keyword" : $("#nickname")
														.val(),
												"mode" : "nickname",
											},
											success : function(result) {
												if (result) {
													$("#mylabelnickname")
															.html(
																	"<span><font color='red'>이미 사용중인 닉네임 입니다.</font></span>");
													$("#overchecknickname")
															.val(false);
												} else {
													$("#mylabelnickname")
															.html(
																	"<span><font color='green'>사용 가능한 닉네임 입니다.</font></span>");
													$("#overchecknickname")
															.val(true);
												}
											}
										});
							} else {
								$("#mylabelnickname")
										.html(
												"<span><font color='red'>닉네임은 '가나다', 'abc' 등만 사용가능합니다.</font></span>");
								$("#overchecknickname").val(false);
							}
						});

		$("#email")
				.change(
						function() {
							if (first_email_write(/^[a-z][a-z\d]{3,11}$/,
									document.getElementById("first_email"),
									"이메일 입력")) {
								if (!last_email_write(
										/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/,
										document.getElementById("last_email"),
										"이메일 입력")) {
									$
											.ajax({
												type : "post",
												url : "${pageContext.request.contextPath}/member/overlabCheck",
												dataType : "JSON",
												data : {
													"keyword" : $("#email")
															.val(),
													"mode" : "email",
												},
												success : function(result) {
													if (result) {
														$("#mylabelemail")
																.html(
																		"<span><font color='red'>이미 사용중인 Email 입니다.</font></span>");
														$("#overcheckemail")
																.val(false);
													} else {
														$("#mylabelemail")
																.html(
																		"<span><font color='green'>사용 가능한 Email 입니다.</font></span>");
														$("#overcheckemail")
																.val(true);
													}

												}
											});
								} else {
									$("#mylabelnickname")
											.html(
													"<span><font color='red'>이메일 입력</font></span>");
									$("#overchecknickname").val(false);
								}
							} else {
								$("#mylabelnickname")
										.html(
												"<span><font color='red'>이메일 입력</font></span>");
								$("#overchecknickname").val(false);
							}
						});

		/* $("#btn").click(function(){
			   if($("#overcheckid").val() == 'false'){
				   alert("ID를 확인해 주세요.");
				   return false;
			   } else if($("#overchecknickname").val() == 'false'){
				   alert("닉네임을 확인해 주세요.");
				   return false;
			   } else if($("#overcheckemail").val() == 'false'){
				   alert("이메일을 확인해 주세요.");
				   return false;
			   }
		});	 */
	});
</script>
<style>
.form-control {
	width: 20%;
}

#first_email {
	width: 10%;
}

#last_email {
	width: 10%;
}

body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.w3-third img {
	margin-bottom: -6px;
	opacity: 0.8
}

.w3-third img:hover {
	opacity: 1
}
</style>
<body>

	<!-- Sidenav/menu -->
	<nav
		class="w3-sidenav w3-white w3-animate-left w3-center w3-text-grey w3-collapse w3-top-50"
		style="z-index:3;width:300px;font-weight:bold;" id="mySidenav">
	<br>
	<h3 class="w3-padding-64"
		onclick="location.href='${pageContext.request.contextPath}/member/mypage'">
		<b>MYPAGE<br> <br>${sessionScope.loginInfo.nickname}
		</b>
	</h3>
	<a href="${pageContext.request.contextPath}/member/orderlist"
		${pageContext.request.contextPath}/member/orderlist="w3_close()"
		class="w3-padding">주문 내역</a> <a
		href="${pageContext.request.contextPath}/member/update"
		onclick="w3_close()" class="w3-padding">개인 정보</a> <a
		href="${pageContext.request.contextPath}/mymenu/listMyMenu"
		onclick="w3_close()" class="w3-padding">My Menu</a> </nav>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
	<span class="w3-left w3-padding">${sessionScope.loginInfo.nickname}</span>
	<a class="w3-right w3-btn w3-white" onclick="w3_open()">☰</a> </header>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<div
		style="margin-left: 250px; padding-top: 100px; padding-bottom: 100px;">
		<div style="margin-left: 100px">
			<p>회원정보 수정
			<p>
		</div>
		<div style="margin-top: 20px; margin-left: 100px;">
			<form action="${pageContext.request.contextPath}/member/update"
				method="post" id="member" onSubmit="return checkIt()" name="member">
				<div class="form-group">
					<label>아이디</label> <label id="mylabelid"></label><br> <input
						class="form-control" type="text" name="id" id="id"
						placeholder="Enter ID" value="${member.id}" readonly="readonly">
					<input type="hidden" name="overcheckid" id="overcheckid"
						value="false">
				</div>
				<div class="form-group">
					<label>비밀번호</label> <input class="form-control" type="password"
						name="password" id="password" placeholder="Enter PassWord"
						value="${member.password}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label> <input class="form-control" type="password"
						name="password2" id="password2" placeholder="Check PassWord">
				</div>
				<div class="form-group">
					<label>이름</label> <input class="form-control" type="text"
						name="name" id="name" placeholder="Enter Name"
						value="${member.name}">
				</div>
				<div class="form-group">
					<label>닉네임</label> <label id="mylabelnickname"></label><br> <input
						class="form-control" type="text" name="nickname" id="nickname"
						placeholder="Enter NickName" value="${member.nickname}"> <input
						type="hidden" name="overchecknickname" id="overchecknickname"
						value="false">
				</div>

				<c:if test="${member.gender == '남자'}">
					<div class="form-group">
						<label>성별</label>
						<div class="radio">
							<label><input type="radio" name="gender" id="man"
								value="남자" checked="checked">남자</label> <label><input
								type="radio" name="gender" id="woman" value="여자">여자</label>
						</div>
					</div>
				</c:if>
				<c:if test="${member.gender == '여자'}">
					<div class="form-group">
						<label>성별</label>
						<div class="radio">
							<label><input type="radio" name="gender" id="man"
								value="남자">남자</label> <label><input type="radio"
								name="gender" id="woman" value="여자" checked="checked">여자</label>
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label>생년월일</label>
					<div class="form-inline">
						<input class="form-control" type="text" readonly="readonly"
							name="bday" id="birth" placeholder="Enter Birth"
							value="${member.bday}">
					</div>
				</div>
				<div class="form-group">
					<label>이메일</label> <label id="mylabelemail"></label><br> <input
						type="hidden" name="overcheckemail" id="overcheckemail"
						value="false">
					<div class="form-inline">
						<input class="form-control" type="text" id="first_email"
							name="email" placeholder="Enter mail"
							value="${member.first_email}">@ <input
							class="form-control" type="text" id="last_email" name="email"
							value="${member.last_email}"> <select
							class="form-control" id="email_select">
							<option value="1">::직접입력::</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="bondingedu.com">bondingedu.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="empas.com">empas.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="korea.com">korea.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="freechal.com">freechal.com</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label>전화번호</label> <input class="form-control" type="text"
						name="phone" id="phone" placeholder="Enter Phone (Only Number)"
						value="${member.phone}">
				</div>
				<div class="form-group">
					<label>주소</label>
					<div class="form-inline">
						<input class="form-control" id="zipcode" readonly="readonly"
							size="10" name="zipcode" placeholder="Address Code"
							value="${member.zipcode}"> <input onclick="zipCheck()"
							class="btn btn-success" type="button" value="우편번호찾기"><br>
						<span style="LINE-HEIGHT: 10%"><br></span>
					</div>
					<input class="form-control" id="address" readonly="" name="address"
						placeholder="Address" value="${member.address}"><br>
				</div>

				<input type="submit" class="btn btn-primary" id="btn" name="btn"
					value="수정">
			</form>
		</div>
	</div>
</body>
</html>