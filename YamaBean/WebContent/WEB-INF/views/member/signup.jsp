<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>

<%
	boolean idOverlapCheck = false;
	boolean nicknameOverlapCheck = false;
	boolean pwOverlapCheck = false;
	boolean emailOverlapCheck = false;
%>

<c:set value="3" var="myoffset"></c:set>
<c:set value="${twelve} - ${myoffset}" var="mywidth"></c:set>
<c:set value="3" var="label"></c:set>
<c:set value="${twelve - (label + 2)}" var="input"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});

	$(document)
			.ready(
					function() {
						$("#id")
								.keyup(
										function() {
											if ($("#id").val() == ""
													|| $("#id").val() == null) {
												$("#iddiv")
														.attr("class",
																"form-group has-feedback");
												$("#id").popover("hide");
												$("#idspan")
														.attr("class",
																"glyphicon form-control-feedback");
											} else if (this.value
													.match(/[^a-zA-Z0-9\_]/g)) {
												//this.value = this.value.replace(/[^a-zA-Z0-9\_\s]/g, ''); //해당 값이 들어오면 ''으로 바꿔치기
												$("#iddiv")
														.attr("class",
																"form-group has-error has-feedback");
												$("#id")
														.attr("data-content",
																"아이디는 특수기호 _  , 영문, 숫자만 입력 가능합니다.");
												$("#idspan")
														.attr("class",
																"glyphicon glyphicon-remove form-control-feedback");
												$("#id").popover("show");
												idOverlapCheck = false;
											}
											// 원하지 않는 값이 들어올 경우를 막기 위해	
											else {
												if ($("#id").val().length > 5
														&& $("#id").val().length <= 14) {
													if (this.value
															.match(/^[a-zA-Z]{1}[\w]+[a-zA-Z0-9]{1}$/)) {//최소 영문자 1개, _특수문자로 끝나지 않기, 영문자로 시작하기

														$
																.ajax({
																	type : "post",
																	url : "meOverlapcheck",
																	dataType : "JSON",
																	data : {
																		"id" : $(
																				"#id")
																				.val(),
																	},
																	success : function(
																			result) {
																		if (result.check) {
																			$(
																					"#iddiv")
																					.attr(
																							"class",
																							"form-group has-success has-feedback");
																			$(
																					"#id")
																					.attr(
																							"data-content",
																							"사용 가능 한 아이디 입니다.");
																			$(
																					"#idspan")
																					.attr(
																							"class",
																							"glyphicon glyphicon-ok form-control-feedback");
																			$(
																					"#id")
																					.popover(
																							"show");
																			idOverlapCheck = true;
																		} else {
																			$(
																					"#iddiv")
																					.attr(
																							"class",
																							"form-group has-warning has-feedback");
																			$(
																					"#id")
																					.attr(
																							"data-content",
																							"사용할수 없는 아이디 입니다.");
																			$(
																					"#idspan")
																					.attr(
																							"class",
																							"glyphicon glyphicon-warning-sign form-control-feedback");
																			$(
																					"#id")
																					.popover(
																							"show");
																			idOverlapCheck = false;
																		}
																	}
																});

													} else {
														$("#id")
																.attr(
																		"data-content",
																		"아이디는 영문자로 시작, 끝자리는 _ 기호가 불가능합니다.");
														$("#iddiv")
																.attr("class",
																		"form-group has-error has-feedback");
														$("#idspan")
																.attr("class",
																		"glyphicon glyphicon-remove form-control-feedback");
														$("#id")
																.popover("show");
														idOverlapCheck = false;
													}
												} else {
													$("#id")
															.attr(
																	"data-content",
																	"6글자이상 14글자 이하로 입력해주세요");
													$("#iddiv")
															.attr("class",
																	"form-group has-error has-feedback");
													$("#idspan")
															.attr("class",
																	"glyphicon glyphicon-remove form-control-feedback");
													$("#id").popover("show");
													idOverlapCheck = false;
												}
											}
										});
					});

	$(document)
			.ready(
					function() {
						// 원하지 않는 값이 들어올 경우를 막기 위해
						$("#nickname")
								.keyup(
										function() {
											if ($("#nickname").val() == ""
													|| $("#nickname").val() == null) {
												$("#nicknamediv")
														.attr("class",
																"form-group has-feedback");
												$("#nickname").popover("hide");
												$("#nicknamespan")
														.attr("class",
																"glyphicon form-control-feedback");
											} else if (this.value
													.match(/[^a-zA-Z0-9가-히\_]/g)) {
												// replace it with nothing
												//this.value = this.value.replace(/[^a-zA-Z0-9가-히\_\s]/g, '');
												$("#nicknamediv")
														.attr("class",
																"form-group has-error has-feedback");
												$("#nickname")
														.attr("data-content",
																"닉네임은 _ 를 제외한 특수기호는 입력 불가능합니다.");
												$("#nicknamespan")
														.attr("class",
																"glyphicon glyphicon-remove form-control-feedback");
												$("#nickname").popover("show");
												nicknameOverlapCheck = false;
											} else {
												if ($("#nickname").val().length > 1) {
													$
															.ajax({
																type : "post",
																url : "meOverlapcheck",
																dataType : "JSON",
																data : {
																	"nickname" : $(
																			"#nickname")
																			.val(),
																},
																success : function(
																		result) {
																	if (result.check) {
																		$(
																				"#nicknamediv")
																				.attr(
																						"class",
																						"form-group has-succes has-feedback");
																		$(
																				"#nickname")
																				.attr(
																						"data-content",
																						"사용가능한 닉네임 입니다");
																		$(
																				"#nicknamespan")
																				.attr(
																						"class",
																						"glyphicon glyphicon-ok form-control-feedback");
																		$(
																				"#nickname")
																				.popover(
																						"show");
																		nicknameOverlapCheck = true;
																	} else {
																		$(
																				"#nicknamediv")
																				.attr(
																						"class",
																						"form-group has-warning has-feedback");
																		$(
																				"#nickname")
																				.attr(
																						"data-content",
																						"이미 사용중인 닉네임 입니다");
																		$(
																				"#nicknamespan")
																				.attr(
																						"class",
																						"glyphicon glyphicon-warning-sign form-control-feedback");
																		$(
																				"#nickname")
																				.popover(
																						"show");
																		nicknameOverlapCheck = false;
																	}
																}
															});
												} else {
													$("#nicknamediv")
															.attr("class",
																	"form-group has-error has-feedback");
													$("#nickname").attr(
															"data-content",
															"닉네임은 2글자 이상입니다");
													$("#nicknamespan")
															.attr("class",
																	"glyphicon glyphicon-remove form-control-feedback");
													$("#nickname").popover(
															"show");
													nicknameOverlapCheck = false;
												}
											}
										});
					});

	$(document)
			.ready(
					function() {
						// 원하지 않는 값이 들어올 경우를 막기 위해
						$("#email")
								.keyup(
										function() {
											if ($("#email").val() == ""
													|| $("#email").val() == null) {
												$("#emaildiv")
														.attr("class",
																"form-group has-feedback");
												$("#email").popover("hide");
												$("#emailspan")
														.attr("class",
																"glyphicon form-control-feedback");
											} else if (this.value
													.match(/[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,4}/)) {
												$
														.ajax({
															type : "post",
															url : "meOverlapcheck",
															dataType : "JSON",
															data : {
																"email" : $(
																		"#email")
																		.val(),
															},
															success : function(
																	result) {
																if (result.check) {
																	$(
																			"#emaildiv")
																			.attr(
																					"class",
																					"form-group has-success has-feedback");
																	$("#email")
																			.attr(
																					"data-content",
																					"사용가능한 이메일주소 입니다");
																	$(
																			"#emailspan")
																			.attr(
																					"class",
																					"glyphicon glyphicon-ok form-control-feedback");
																	$("#email")
																			.popover(
																					"show");
																	emailOverlapCheck = true;
																} else {
																	$(
																			"#emaildiv")
																			.attr(
																					"class",
																					"form-group has-warning has-feedback");
																	$("#email")
																			.attr(
																					"data-content",
																					"이미 사용중인 이메일주소 입니다");
																	$(
																			"#emailspan")
																			.attr(
																					"class",
																					"glyphicon glyphicon-warning-sign form-control-feedback");
																	$("#email")
																			.popover(
																					"show");
																	emailOverlapCheck = false;
																}
															}
														});
											} else {
												$("#emaildiv")
														.attr("class",
																"form-group has-error has-feedback");
												$("#email").attr(
														"data-content",
														"잘못된 형식의 이메일 주소입니다");
												$("#emailspan")
														.attr("class",
																"glyphicon glyphicon-remove form-control-feedback");
												$("#email").popover("show");
												emailOverlapCheck = false;
											}
										});
					});

	$(document)
			.ready(
					function() {
						//비밀번호 유효성 검사. 특수문자 하나 추가해야, 특수문자 최소 1개 들어가기, 8글자 이상, 16자 이하
						$("#password")
								.keyup(
										function() {
											if ($("#password").val() == ""
													|| $("#password").val() == null) {
												$("#pwdiv")
														.attr("class",
																"form-group has-feedback");
												$("#password").popover("hide");
												$("#pwspan")
														.attr("class",
																"glyphicon form-control-feedback");
											} else if ($("#password").val().length > 7
													&& $("#password").val().length < 17) {
												if (this.value
														.match(/^(?=.*[0-9])(?=.*[a-z])(?=.*[`~!@#$%^&*()+=,./?|{};:<>\\])(?=\S+$).{8,}$/)) {
													$("#pwdiv")
															.attr("class",
																	"form-group has-success has-feedback");
													$("#password").attr(
															"data-content",
															"사용가능한 비밀번호입니다.");
													$("#pwspan")
															.attr("class",
																	"glyphicon glyphicon-ok form-control-feedback");
													$("#password").popover(
															"show");
												} else {
													$("#pwdiv")
															.attr("class",
																	"form-group has-error has-feedback");
													$("#password")
															.attr(
																	"data-content",
																	"사용할 수 없는 비밀번호입니다. 특수기호와 숫자 하나를 포함해야 합니다.");
													$("#pwspan")
															.attr("class",
																	"glyphicon glyphicon-remove form-control-feedback");
													$("#password").popover(
															"show");
												}
											} else {
												$("#pwdiv")
														.attr("class",
																"form-group has-error has-feedback");
												$("#password")
														.attr("data-content",
																"비밀번호는 8글자 이상 16글자 이하로 입력해주세요.");
												$("#pwspan")
														.attr("class",
																"glyphicon glyphicon-remove form-control-feedback");
												$("#password").popover("show");
											}
										});
					});

	$(document)
			.ready(
					function() {
						//패스워드 1번과 2번이 동일한지에 대한 유효성 검사
						$("#password2")
								.keyup(
										function() {
											if ($("#password2").val() == ""
													|| $("#password2").val() == null) {
												$("#pwdiv2")
														.attr("class",
																"form-group has-feedback");
												$("#password2").popover("hide");
												$("#pwspan2")
														.attr("class",
																"glyphicon form-control-feedback");
											} else if ($("#password").val() == $(
													"#password2").val()
													&& $("#password").val() != null) {
												$("#pwdiv2")
														.attr("class",
																"form-group has-success has-feedback");
												$("#password2").attr(
														"data-content", "사용가능");
												$("#pwspan2")
														.attr("class",
																"glyphicon glyphicon-ok form-control-feedback");
												$("#password2").popover("show");
												pwOverlapCheck = true;
											} else {
												$("#pwdiv2")
														.attr("class",
																"form-group has-error has-feedback");
												$("#password2").attr(
														"data-content",
														"비밀번호를 확인해주세요");
												$("#pwspan2")
														.attr("class",
																"glyphicon glyphicon-remove form-control-feedback");
												$("#password2").popover("show");
												pwOverlapCheck = false;
											}
										});
					});

	$(document).ready(function() {
		$("#signup").submit(function() {
			if (idOverlapCheck) {
				if (pwOverlapCheck) {
					if (nicknameOverlapCheck) {
						if (emailOverlapCheck) {
							alert("가입을 축하드립니다!");
							return true;
						} else {
							alert("이메일 주소를 확인해주세요");
							$("#nickname").focus();
							return false;
						}
					} else {
						alert("닉네임를 확인해주세요");
						$("#nickname").focus();
						return false;
					}
				} else {
					alert("비밀번호를 확인해주세요");
					$("#password").focus();
					return false;
				}
			} else {
				alert("아이디를 확인해주세요");
				$("#id").focus();
				return false;
			}

		});
	});

	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});

	$(document).ready(
			function() {
				$("#reset").click(
						function() {
							$("#iddiv")
									.attr("class", "form-group has-feedback");
							$("#id").popover("hide");
							$("#idspan").attr("class",
									"glyphicon form-control-feedback");
							$("#id").attr("data-content",
									"6글자이상 14글자 이하로 입력해주세요");

							$("#pwdiv")
									.attr("class", "form-group has-feedback");
							$("#password").popover("hide");
							$("#pwspan").attr("class",
									"glyphicon form-control-feedback");
							$("#password").attr("data-content",
									"비밀번호는 8글자 이상 16글자 이하로 입력해주세요.");

							$("#pw2div").attr("class",
									"form-group has-feedback");
							$("#password2").popover("hide");
							$("#pw2span").attr("class",
									"glyphicon form-control-feedback");
							$("#password2")
									.attr("data-content", "비밀번호를 확인해주세요");

							$("#nicknamediv").attr("class",
									"form-group has-feedback");
							$("#nickname").popover("hide");
							$("#nicknamespan").attr("class",
									"glyphicon form-control-feedback");
							$("#nickname").attr("data-content",
									"닉네임은 2글자 이상입니다");

							$("#emaildiv").attr("class",
									"form-group has-feedback");
							$("#email").popover("hide");
							$("#emailspan").attr("class",
									"glyphicon form-control-feedback");
							$("#email").attr("data-content", "이메일을 입력해주세요");

						});
			});
</script>

<style type="text/css">
.imabutton {
	background-color: #cbe7cb;
	border: none;
	color: white;
	padding: 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.imamybutton1 {
	background-color: white;
	color: #cbe7cb;
	border: 2px solid #cbe7cb;
	border-radius: 20px;
}

.imamybutton1:hover {
	background-color: #cbe7cb;
	color: white;
}
</style>

</head>
<body>

	<div class="col-sm-offset-${myoffset} col-sm-${mywidth}"
		style="margin-top: 100px; border: solid 1px;">

		<form id="signup" class="form-horizontal" action="" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="command" value="meSignup">
			<table>
				<tr>
					<td>
						<div id="iddiv" class="form-group has-feedback">
							<label for="ID" class="col-sm-${label} control-label">ID</label>
							<div class="col-sm-${input}">
								<input type="text" class="form-control" id="id" name="id"
									placeholder="id" data-toggle="popover" data-trigger="top"
									data-placement="top" data-content=""><span id="idspan"
									class="glyphicon form-control-feedback"></span>
								
							</div>
						</div>
						<div id="pwdiv" class="form-group has-feedback">
							<label for="passoword" class="col-sm-${label} control-label">PW</label>
							<div class="col-sm-${input}">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="password" data-toggle="popover"
									data-trigger="top" data-placement="top" data-content="">
								<span id="pwspan" class="glyphicon form-control-feedback"></span>
							</div>
							<div id="pwcheck"></div>
						</div>
						<div id="pwdiv" class="form-group has-feedback">
							<label for="passoword2" class="col-sm-${label} control-label">P.W
								Chcek</label>
							<div class="col-sm-${input}">
								<input type="password" class="form-control" id="password2"
									name="password2" placeholder="password" data-toggle="popover"
									data-trigger="top" data-placement="top" data-content="">
								<span id="pwspan" class="glyphicon form-control-feedback"></span>
							</div>
							<div id="pwcheck"></div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-${label} control-label">Name</label>
							<div class="col-sm-${input}">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="name">
							</div>
						</div>
						<div id="emaildiv" class="form-group has-feedback">
							<label for="email" class="col-sm-${label} control-label">Email</label>
							<div class="col-sm-${input}">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="email" data-toggle="popover" data-trigger="top"
									data-placement="top" data-content=""> <span
									id="emailspan" class="glyphicon form-control-feedback"></span>
							</div>
							<div id="emailcheck"></div>
						</div>
						<div id="nicknamediv" class="form-group has-feedback">
							<label for="nickname" class="col-sm-${label} control-label">NickName</label>
							<div class="col-sm-${input}">
								<input type="text" class="form-control" id="nickname"
									name="nickname" placeholder="nickname" data-toggle="popover"
									data-trigger="top" data-placement="top" data-content="">
								<span id="nicknamespan" class="glyphicon form-control-feedback"></span>
							</div>
							<div id="nicknamecheck"></div>
						</div>
						<div id="address" class="form-group has-feedback">
							<label for="address" class="col-sm-${label} control-label">Address</label>
							<div class="col-sm-${input}">
								<input class="form-control" type="text" id="sample4_postcode"
									placeholder="우편번호" readonly="readonly"> <input
									class="form-control" type="button"
									onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input class="form-control" type="text" id="sample4_roadAddress"
									placeholder="도로명주소" readonly="readonly"> <input
									class="form-control" type="text" id="sample4_jibunAddress"
									placeholder="지번주소"><span id="guide" style="color: #999"></span>

								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script>
									//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
									function sample4_execDaumPostcode() {
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

														// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
														// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
														var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
														var extraRoadAddr = ''; // 도로명 조합형 주소 변수

														// 법정동명이 있을 경우 추가한다. (법정리는 제외)
														// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
														if (data.bname !== ''
																&& /[동|로|가]$/g
																		.test(data.bname)) {
															extraRoadAddr += data.bname;
														}
														// 건물명이 있고, 공동주택일 경우 추가한다.
														if (data.buildingName !== ''
																&& data.apartment === 'Y') {
															extraRoadAddr += (extraRoadAddr !== '' ? ', '
																	+ data.buildingName
																	: data.buildingName);
														}
														// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
														if (extraRoadAddr !== '') {
															extraRoadAddr = ' ('
																	+ extraRoadAddr
																	+ ')';
														}
														// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
														if (fullRoadAddr !== '') {
															fullRoadAddr += extraRoadAddr;
														}

														// 우편번호와 주소 정보를 해당 필드에 넣는다.
														document
																.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
														document
																.getElementById('sample4_roadAddress').value = fullRoadAddr;
														document
																.getElementById('sample4_jibunAddress').value = data.jibunAddress;

														// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
														if (data.autoRoadAddress) {
															//예상되는 도로명 주소에 조합형 주소를 추가한다.
															var expRoadAddr = data.autoRoadAddress
																	+ extraRoadAddr;
															document
																	.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
																	+ expRoadAddr
																	+ ')';

														} else if (data.autoJibunAddress) {
															var expJibunAddr = data.autoJibunAddress;
															document
																	.getElementById('guide').innerHTML = '(예상 지번 주소 : '
																	+ expJibunAddr
																	+ ')';

														} else {
															document
																	.getElementById('guide').innerHTML = '';
														}
													}
												}).open();
									}
								</script>
							</div>
							<div id="nicknamecheck"></div>
						</div>

						<div id="nicknamediv" class="form-group has-feedback">
							<label for="nickname" class="col-sm-${label} control-label">생년얼일</label>
							<div class="col-sm-${input}">
								<input class="form-control" type="text" id="datepicker"
									name="bday" readonly="readonly">
							</div>
						</div>


					</td>
			</table>
		</form>
	</div>
</body>
</html>
