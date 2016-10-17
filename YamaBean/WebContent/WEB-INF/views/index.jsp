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

	<!-- Page content -->
	<div class="w3-content" style="max-width: 2000px; margin-top: 46px">

		<!-- Automatic Slideshow Images -->
		<div class="mySlides w3-display-container">
			<img src="${imgFolder}index1.jpg" style="width:100%; height: 500px;">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3>Los Angeles</h3>
				<p>
					<b>We had the best time playing at Venice Beach!</b>
				</p>
			</div>
		</div>
		<div class="mySlides w3-display-container">
			<img src="${imgFolder}index2.jpg" style="width:100%; height: 500px;">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3>New York</h3>
				<p>
					<b>The atmosphere in New York is lorem ipsum.</b>
				</p>
			</div>
		</div>
		<div class="mySlides w3-display-container">
			<img src="${imgFolder}index3.jpg" style="width:100%; height: 500px;">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
				<h3>Chicago</h3>
				<p>
					<b>Thank you, Chicago - A night we won't forget.</b>
				</p>
			</div>
		</div>

		<!-- The Band Section -->
		<div class="w3-container w3-content w3-center w3-padding-64"
			style="max-width: 800px" id="band">
			<h2 class="w3-wide">THE BAND</h2>
			<p class="w3-opacity">
				<i>We love music</i>
			</p>
			<p class="w3-justify">We have created a fictional band website.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
				eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
				ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
				aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum consectetur
				adipiscing elit, sed do eiusmod tempor incididunt ut labore et
				dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
				exercitation ullamco laboris nisi ut aliquip ex ea commodo
				consequat.</p>
			<div class="w3-row w3-padding-32">
				<div class="w3-third">
					<p>Name</p>
					<img src="img_bandmember.jpg" class="w3-round w3-margin-bottom"
						alt="Random Name" style="width: 60%">
				</div>
				<div class="w3-third">
					<p>Name</p>
					<img src="img_bandmember.jpg" class="w3-round w3-margin-bottom"
						alt="Random Name" style="width: 60%">
				</div>
				<div class="w3-third">
					<p>Name</p>
					<img src="img_bandmember.jpg" class="w3-round" alt="Random Name"
						style="width: 60%">
				</div>
			</div>
		</div>

		<!-- Ticket Modal -->
		<div id="ticketModal" class="w3-modal">
			<div class="w3-modal-content w3-animate-top w3-card-8">
				<header class="w3-container w3-teal w3-center w3-padding-32">
				<span
					onclick="document.getElementById('ticketModal').style.display='none'"
					class="w3-closebtn w3-padding-xlarge w3-xxlarge w3-display-topright">×</span>
				<h2 class="w3-wide">
					<i class="fa fa-suitcase w3-margin-right"></i>Tickets
				</h2>
				</header>
				<div class="w3-container">
					<p>
						<label><i class="fa fa-shopping-cart"></i> Tickets, $15
							per person</label>
					</p>
					<input class="w3-input w3-border" type="text"
						placeholder="How many?">
					<p>
						<label><i class="fa fa-user"></i> Send To</label>
					</p>
					<input class="w3-input w3-border" type="text"
						placeholder="Enter email">
					<button
						class="w3-btn-block w3-teal w3-padding-12 w3-section w3-right">
						PAY <i class="fa fa-check"></i>
					</button>
					<button class="w3-btn w3-red w3-section"
						onclick="document.getElementById('ticketModal').style.display='none'">
						Close <i class="fa fa-remove"></i>
					</button>
					<p class="w3-right">
						Need <a href="#" class="w3-text-blue">help?</a>
					</p>
				</div>
			</div>
		</div>

		<!-- End Page Content -->
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
