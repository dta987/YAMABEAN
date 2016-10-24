<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Page content -->
	<div class="w3-content" style="max-width: 2000px; margin-top: 46px">

		<!-- Automatic Slideshow Images -->
		<div class="mySlides w3-display-container">
			<img src="${imgFolder}index1.jpg" style="width: 100%; height: 500px;">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3></h3>
				<p>
					<b></b>
				</p>
			</div>
		</div>
		<div class="mySlides w3-display-container">
			<img src="${imgFolder}index2.jpg" style="width: 100%; height: 500px;">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3></h3>
				<p>
					<b></b>
				</p>
			</div>
		</div>
		<div class="mySlides w3-display-container">
			<img src="${imgFolder}index3.jpg" style="width: 100%; height: 500px;">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3></h3>
				<p>
					<b></b>
				</p>
			</div>
		</div>

		<!-- The Band Section -->
		<div class="w3-container w3-content w3-center w3-padding-64"
			style="max-width: 800px" id="band">
			<h2 class="w3-wide">YamaBean</h2>
			<p class="w3-opacity">
				<i>YamaBean 커피로스터스는</i>
			</p>
			<p class="w3-justify">한국의 ‘커피 제3의 물결’을 주도하는 프리미엄 커피 서비스 컴퍼니입니다.
				당신이 언제 어디서든 최고급 원두커피를 즐길 수 있도록 다양한 서비스와 컨텐츠를 제공하고 있습니다. 우리는 최고급 품질의
				커피를 위하여 전세계의 제철 커피생두를 원료로 직접 로스팅합니다. 신선한 재료와 최신 생산시설을 통해 맛과 향이 풍부한
				프리미엄 원두커피를 생산하여 기업과 가정, 당신이 있는 곳 어디든지 최상의 서비스를 제공합니다.</p>
		</div>
		<!-- End Page Content -->
		<footer class="w3-container w3-padding-32" id="contact"> </footer>


		<div class="w3-black w3-center w3-padding-24">YamaBean</div>
	</div>

	<script>
		// Automatic Slideshow - change image every 4 seconds
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 4000);
		}

		// Used to toggle the menu on small screens when clicking on the menu button
		function myFunction() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}

		// When the user clicks anywhere outside of the modal, close it
		var modal = document.getElementById('ticketModal');
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>
