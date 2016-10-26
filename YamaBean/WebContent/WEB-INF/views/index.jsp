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
			<h2 class="w3-wide"><strong>YAMABEAN</strong></h2>
			<p class="w3-opacity">
				<i>YAMABEAN 커피로스터스</i>				
			</p>
			<p class="w3-opacity">
				<i>자연에서 얻은 최상의 원두로 최고의 서비스를 제공하는 프리미엄 커피 스토어입니다.</i>				
			</p>
			<p class="w3-opacity">
				<i>당신이 원하는 메뉴를 만들어보세요. 자신만의 메뉴를 만들어 볼 수 있습니다. </i>				
			</p>
			<p class="w3-opacity">
				<i>줄서서 기다리지 마세요. YAMABEAN에서는 기다리실 필요가 없습니다.</i>				
			</p>
			<p class="w3-opacity">
				<i><strong>당신이 바라는 커피 스토어, 우리는 YAMABEAN 입니다.</strong></i>				
			</p>
			
			<br><br><br><br>
			<p class="w3-wide">YAMABEAN 서초커피하우스, 서울 서초구 효도로 서초트리플팰리스 80층</p>
			<p class="w3-wide">YAMABEAN 건대커피박스, 서울 광진구 아차돌박이화산로 20000</p>
			<p class="w3-wide">YAMABEAN 판교커피바, 경기 성남시 분당구 판교역로 야마빌딩 A동 119호</p>
		</div>
		<!-- End Page Content -->
		<footer class="w3-container w3-padding-32" id="contact"> </footer>

		
		<div class="w3-black w3-center w3-padding-24">2016. AHN, KIM, HAM / YAMABEAN COMPANY, ALL Rights Reserved</div>
	
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
