<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>주문관리</title>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<div class="container-fluid" style="margin-top: 50px;">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="/YamaBean/admin/page" >HOME</a></li>
					<li><a href="/YamaBean/admin/menu" >메뉴관리</a></li>
					<li><a href="/YamaBean/admin/member">회원관리</a></li>
					<li><a href="/YamaBean/admin/order">주문관리</a></li>
				</ul>
				<br>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search Blog..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>

			<div class="col-sm-9">
				<div class="w3-third w3-margin-bottom">
					<ul class="w3-ul w3-border w3-center w3-hover-shadow">
						<li class="w3-black">
							<p class="w3-xlarge">Basic</p>
						</li>
						<li class="w3-padding-16"><b>10GB</b> Storage</li>
						<li class="w3-padding-16"><b>10</b> Emails</li>
						<li class="w3-padding-16"><b>10</b> Domains</li>
						<li class="w3-padding-16"><b>Endless</b> Support</li>
						<li class="w3-padding-16">
							<h2 class="w3-wide">$ 10</h2> <span class="w3-opacity">per
								month</span>
						</li>
						<li class="w3-light-grey w3-padding-24">
							<button class="w3-btn w3-green w3-padding-large">Sign Up</button>
						</li>
					</ul>
				</div>

				<div class="w3-third w3-margin-bottom">
					<ul class="w3-ul w3-border w3-center w3-hover-shadow">
						<li class="w3-black">
							<p class="w3-xlarge">Pro</p>
						</li>
						<li class="w3-padding-16"><b>25GB</b> Storage</li>
						<li class="w3-padding-16"><b>25</b> Emails</li>
						<li class="w3-padding-16"><b>25</b> Domains</li>
						<li class="w3-padding-16"><b>Endless</b> Support</li>
						<li class="w3-padding-16">
							<h2 class="w3-wide">$ 25</h2> <span class="w3-opacity">per
								month</span>
						</li>
						<li class="w3-light-grey w3-padding-24">
							<button class="w3-btn w3-green w3-padding-large">Sign Up</button>
						</li>
					</ul>
				</div>

				<div class="w3-third w3-margin-bottom">
					<ul class="w3-ul w3-border w3-center w3-hover-shadow">
						<li class="w3-black">
							<p class="w3-xlarge">Premium</p>
						</li>
						<li class="w3-padding-16"><b>50GB</b> Storage</li>
						<li class="w3-padding-16"><b>50</b> Emails</li>
						<li class="w3-padding-16"><b>50</b> Domains</li>
						<li class="w3-padding-16"><b>Endless</b> Support</li>
						<li class="w3-padding-16">
							<h2 class="w3-wide">$ 50</h2> <span class="w3-opacity">per
								month</span>
						</li>
						<li class="w3-light-grey w3-padding-24">
							<button class="w3-btn w3-green w3-padding-large">Sign Up</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>