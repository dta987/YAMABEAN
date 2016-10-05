<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<br>
		<h1>여기가 메인</h1>
		<hr width="500px">
	
		<div>
		<br>
		<!-- 테스트 코드니까 주소 바꿔서 써도 상관없어요  -->
		<!-- 밑 주소가 절대 경로 -->
		<!-- 상대경로는  menu/move -->
		<a href="/YamaBean/menu/move">메뉴 </a> &nbsp;&nbsp;  <!-- 함상 추가/삭제/수정/검색(단일/리스트) 잘부탁드려용 -->
		<a href="/YamaBean/menu/createMenu">createMenu</a>
		<a href="/YamaBean/menu/listMenu">listMenu</a>
		
		
		
		<br><br>
		<a href="/YamaBean/member/move">회원 </a> &nbsp;&nbsp; <!-- 나영상 가입/로그인/수정/탈퇴/id,pw찾기 잘 부탁드립니당 -->
				 
		<a href="/YamaBean/board/move">게시판 </a> &nbsp;&nbsp;
		<a href="/YamaBean/storeMap/move">매장 </a> <!-- 연구중 -->	 	
		
				<div id="login" class="modal fade" tabindex="5" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
				<h3>Login</h3>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<form class="form" method="post" action="http://localhost:8989/YamaBean/member/login" accept-charset="UTF-8" id="login-nav">
							<input type="hidden" name="command" value="meLogin">
							<div class="form-group">
								ID
								<input type="text" name="id" class="form-control" size="20" placeholder="ID ENTER" required>
							</div>
							<div class="form-group">
								Password
								<input type="password" name="password" class="form-control" size="20" placeholder="Password ENTER" required>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block" >Sign In</button>
							</div>
						</form>
					</div>
					<div class="bottom text-center">
						<a href="/YamaBean/member/move"><b>Join Us</b></a>
					</div>
				</div>
				<!-- 로그인 창 -->
			</div>
		</div>
	</div>	
		</div>
		<!-- 힘내용 -->
		
		

	</div>



</body>
</html>