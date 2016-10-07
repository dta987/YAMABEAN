<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<div class="w3-row class w3-content"
		style="max-width: 1300px; margin-top: 200px;">
		<div class="w3-half w3-black w3-container w3-center"
			style="height: 500px; overflow: auto">
			<div style="margin-top: 20px;">
				<h1>MENU</h1>
			</div>
			<hr>
			<div class="w3-padding-10">
				<button onclick="myFunction('Demo1')"
					class="w3-btn-block w3-theme-l1">콜드블루</button>
				<div id="Demo1" class="w3-accordion-content w3-container">
					<div class="w3-third w3-container w3-margin-bottom">
						<img src="<%=uploadedFolder%>americano.png" alt="Norway"
							style="width: 100%" class="w3-hover-opacity">
						<div class="w3-container w3-white">
							<p>
							<h4>ㅁㅇㄴㄻㅇㄴㄹ</h4>
							</p>
						</div>
					</div>
				</div>
				<button onclick="myFunction('Demo2')"
					class="w3-btn-block w3-theme-l1">브루드</button>
				<div id="Demo2" class="w3-accordion-content w3-container">
					<p>Some other text..</p>
				</div>
				<button onclick="myFunction('Demo3')"
					class="w3-btn-block w3-theme-l1">에스프레소</button>
				<div id="Demo3" class="w3-accordion-content w3-container">
					<p>Some other text..</p>
				</div>
				<button onclick="myFunction('Demo4')"
					class="w3-btn-block w3-theme-l1">프라푸치노</button>
				<div id="Demo4" class="w3-accordion-content w3-container">
					<p>Some other text..</p>
				</div>

			</div>
		</div>
		<div class="w3-half w3-blue-grey w3-container" style="height: 500px;">
			<div class="w3-padding-64 w3-center">
				<h1>About Me</h1>
				<img src="img_avatar3.png" class="w3-margin w3-circle" alt="Person"
					style="width: 50%">
				<div class="w3-left-align w3-padding-xxlarge">
					<p>Lorem ipusm sed vitae justo condimentum, porta lectus vitae,
						ultricies congue gravida diam non fringilla.</p>
					<p>Lorem ipusm sed vitae justo condimentum, porta lectus vitae,
						ultricies congue gravida diam non fringilla.</p>
				</div>
			</div>

		</div>
	</div>


	<script type="text/javascript">
		// Accordion
		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-theme-d1";
			} else {
				x.className = x.className.replace("w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-theme-d1", "");
			}
		}
	</script>

</body>
</html>