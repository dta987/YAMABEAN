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
	function id_write(re, e, msg){
    	if(re.test(e.value)) return true;
    	alert(msg);
    	e.value="";
    	e.focus();
    	return false;
	}
	function password_write(re, e, msg){
    	if(re.test(e.value)) return true;
    	alert(msg);
    	e.value="";
    	e.focus();
    	return false;
	}
	function password_check(e1, e2, msg){
		if(e1.value == e2.value)return true;
     	alert(msg);
     	e1.value="";
        e2.value="";
       	e1.focus();
       	return false;
	} 
	function name_write(re, e, msg){
    	if(re.test(e.value)) return true;
    	alert(msg);
    	e.value="";
    	e.focus();
    	return false;
	}
	function first_email_write(re, e, msg){
    	if(re.test(e.value)) return true;
    	alert(msg);
    	e.value="";
    	e.focus();
    	return false;
	}
	function last_email_write(re, e, msg){
    	if(re.test(e.value)) return true;
    	alert(msg);
    	e.value="";
    	e.focus();
    	return false;
	}
	function phone_write(re, e, msg){
    	if(re.test(e.value)) return true;
    	alert(msg);
    	e.value="";
    	e.focus();
    	return false;
	}
	function nickname_write(re, e, msg){
    	if(re.test(e.value)) return true;
    	alert(msg);
    	e.value="";
    	e.focus();
    	return false;
	}
	
	
	//회원가입 유효성 검사 
	function checkIt(){
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
		 if(!password_write(/^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/, password, "Password는 특수문자,숫자,글자를 포함해주세요")){
			 return false;
		 }
		 if(!password_check(password,password2,"비밀번호를 확인해주세요 ")){
			 return false;
		 }
		 if(!name_write(/^[가-힝]{2,5}$/,name,"이름을 확인해주세요")){
	          return false;
	     }
		/*  if(!first_email_write(/^[a-z][a-z\d]{3,11}$/,first_email,"이메일 입력")){
	          return false;
	     } */
		 /* if(!last_email_write(/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/,last_email,"이메일 입력")){
	          return false;
	     } */
		 if(!phone_write(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/,phone,"전화번호 입력")){
	          return false;
	     }
	 //필수 체크요소
	      if($(':radio[name="gender"]:checked').length < 1){
	    	  alert("성별을 입력하세요");
	    	  return false;
	      }
	      if(!member.birth.value){
	          alert("생년월일을 입력하세요");
	          return false;
	      }
	      if(!member.zipcode.value){
	          alert("주소를 입력하세요");
	          return false;
	      }
	} 


	//생년월일
	$(document).ready(
		function() {
			var clareCalendar = {
					
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
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
		$(function(){
		  $('#email_select').change(function(){
		   if($('#email_select').val() == "1"){
		    $("#last_email").val(""); //값 초기화
		    $("#last_email").prop("readonly",false); //활성화
		   } else {
		    $("#last_email").val($('#email_select').val()); //선택값 입력
		    $("#last_email").prop("readonly",true); //비활성화
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
		$(function(){
			$("#id").change(function(){
				if(id_write(/^[a-z][a-z\d]{3,11}$/, document.getElementById("id"), "ID는 영문자로 시작,공백과 특수문자 제외 ,4~12글자만 사용해주세요")){
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/member/overlabCheck",
						dataType : "JSON",
						data : {
							"keyword" : $("#id").val(),
							"mode" : "id",
						},
						success : function(result) {
							if(result) {
								$("#mylabelid").html("<span><font color='red'>중복된 ID 입니다.</font></span>");
								$("#overcheckid").val(false);
							} else {
								$("#mylabelid").html("<span><font color='green'>사용 가능한 ID 입니다.</font></span>");
								$("#overcheckid").val(true);
							}
						
						}
					});	
				} else {
					$("#mylabelid").html("<span><font color='red'>ID는 \n영문자로 시작,공백과 특수문자 제외 ,4~12글자만 사용해주세요</font></span>");
					$("#overcheckid").val(false);	
				}
			});
			
			$("#nickname").change(function(){
				if(nickname_write(/^[a-zA-Z0-9가-히\_]/, document.getElementById("nickname"), "닉네임은 '가나다', 'abc' 등만 사용가능합니다")){
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/member/overlabCheck",
						dataType : "JSON",
						data : {
							"keyword" : $("#nickname").val(),
							"mode" : "nickname",
						},
						success : function(result) {
							if(result) {
								$("#mylabelnickname").html("<span><font color='red'>이미 사용중인 닉네임 입니다.</font></span>");
								$("#overchecknickname").val(false);
							} else {
								$("#mylabelnickname").html("<span><font color='green'>사용 가능한 닉네임 입니다.</font></span>");
								$("#overchecknickname").val(true);
							}
						}
					});	 
				} else {
					$("#mylabelnickname").html("<span><font color='red'>닉네임은 '가나다', 'abc' 등만 사용가능합니다.</font></span>");
					$("#overchecknickname").val(false);
				}
			});
			
			$("#email").change(function(){
				if(first_email_write(/^[a-z][a-z\d]{3,11}$/,document.getElementById("first_email"),"이메일 입력")){
					if(!last_email_write(/((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/,document.getElementById("last_email"),"이메일 입력")){
						$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/member/overlabCheck",
							dataType : "JSON",
							data : {
								"keyword" : $("#email").val(),
								"mode" : "email",
							},
							success : function(result) {
								if(result) {
									$("#mylabelemail").html("<span><font color='red'>이미 사용중인 Email 입니다.</font></span>");
									$("#overcheckemail").val(false);
								} else {
									$("#mylabelemail").html("<span><font color='green'>사용 가능한 Email 입니다.</font></span>");
									$("#overcheckemail").val(true);
								}
							
							}
						});
					} else {
						 $("#mylabelnickname").html("<span><font color='red'>이메일 입력</font></span>");
						 $("#overchecknickname").val(false);
					 }
				} else {
					 $("#mylabelnickname").html("<span><font color='red'>이메일 입력</font></span>");
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
	.form-control{
		width: 20% ;
	}
	#first_email{
		width: 10% ;
	}
	#last_email{
		width: 10% ;
	}
</style>
<body>
<div style="margin-left: 100px; margin-top: 100px;">
	<div style="margin-left: 70px"><p>회원가입<p></div>
	<div style="margin-top: 20px; margin-left: 100px;" >
	<form action="${pageContext.request.contextPath}/member/signup" method="post" id="member" onSubmit = "return checkIt()" name = "member">
		<div class="form-group">
			<label>아이디</label>
			<label id="mylabelid"></label><br>
			<input class="form-control" type="text" name="id" id="id" placeholder="Enter ID">
			<input type="hidden" name="overcheckid" id="overcheckid" value="false">
		</div>	
		<div class="form-group">
			<label>비밀번호</label>
			<input class="form-control" type="password" name="password" id="password" placeholder="Enter PassWord">
		</div>	
		<div class="form-group">
			<label>비밀번호 확인</label>
			<input class="form-control" type="password" name="password2" id="password2" placeholder="Check PassWord">
		</div>
		<div class="form-group">
			<label>이름</label>
			<input class="form-control" type="text" name="name" id="name" placeholder="Enter Name">
		</div>
		<div class="form-group">
			<label>닉네임</label>
			<label id="mylabelnickname"></label><br>
			<input class="form-control" type="text" name="nickname" id="nickname" placeholder="Enter NickName">
			<input type="hidden" name="overchecknickname" id="overchecknickname" value="false">
		</div>
		<div class="form-group">
			<label>성별</label>
			<div class="radio">
				<label><input type="radio" name="gender" id="남" value="man">남자</label> 
				<label><input type="radio" name="gender" id="여" value="woman">여자</label> 
			</div>
		</div>
		<div class="form-group">
			<label>생년월일</label>
			<div class="form-inline">
			<input class="form-control" type="text" readonly="readonly" name="bday" id="birth" placeholder="Enter Birth">
			</div>
		</div>
		<div class="form-group">
			<label>이메일</label>
			<label id="mylabelemail"></label><br>
			<input type="hidden" name="overcheckemail" id="overcheckemail" value="false">
			<div class="form-inline">
			<input class="form-control" type="text" id="first_email" name="email" placeholder="Enter mail">@
  			<input class="form-control" type="text" id="last_email" name="email">
  			<select class="form-control" id="email_select">
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
			<label>전화번호</label>
			<input class="form-control" type="text" name="phone" id="phone" placeholder="Enter Phone (Only Number)" >
		</div>
		<div class="form-group">
			<label>주소</label>
			<div class="form-inline">
			<input class="form-control"  id="zipcode" readonly="readonly" size="10" name="zipcode" placeholder="Address Code">
			<input onclick="zipCheck()" class="btn btn-success" type="button" value="우편번호찾기"><br>
			<span style="LINE-HEIGHT: 10%"><br></span>
			</div> 
			<input class="form-control"  id="address" readonly="" name="address" placeholder="Address"><br>
		</div>
		
		<input type="submit" class="btn btn-primary" id="btn" name="btn" value="회원가입">
		<input type="reset" class="btn btn-danger" value="가입취소">
	</form>
	</div>
</div>	
</body>
</html>