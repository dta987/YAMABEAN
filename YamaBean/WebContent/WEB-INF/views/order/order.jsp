<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/x-jquery-tmpl" id="orderTemplate">
	<div class="w3-row">
		<div class="w3-col s3">
			<img src="<%=uploadedFolder%>${img}" style="width: 100%">
		</div>
		<div class="w3-col s9 w3-container">
			<h3>${name}</h3>
			<p>The response to the animations was ridiculous.</p>
		</div>
		<div class="w3-col s9 w3-container">

		</div>
	</div>
</script>

</head>
<body>

	<div class="w3-row class w3-content"
		style="max-width: 1300px; margin-top: 200px;">
		<div class="w3-half w3-black w3-container w3-center"
			style="height: 500px; overflow: auto">
			<div style="margin-top: 15px;">
				<h1>MENU</h1>
			</div>
			<hr>
			<div class="w3-padding-10">
				<button onclick="myFunction('Demo1')"
					class="w3-btn-block w3-theme-l1">콜드블루</button>
				<div id="Demo1" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '콜드브루' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.image_name}"
								onclick="orderFunction(${menu_num}, ${item.image_name}, ${item.image_name})">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity">
								<div class="w3-container w3-white" style="padding-top: 5px;">
									<p>${item.getM_name()}</p>
									<p>
										<input id="spinner" name="spinner" size="7">
									</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo2')"
					class="w3-btn-block w3-theme-l1">브루드</button>
				<div id="Demo2" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '브루드커피' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.image_name}"
								onclick="orderFunction(${menu_num}, ${item.image_name}, ${item.image_name})">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity">
								<div class="w3-container w3-white">
									<p>
									<h4>${item.getM_name()}</h4>
									</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo3')"
					class="w3-btn-block w3-theme-l1">에스프레소</button>
				<div id="Demo3" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '에스프레소' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.image_name}"
								onclick="orderFunction(${menu_num}, ${item.image_name}, ${item.image_name})">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity">
								<div class="w3-container w3-white">
									<p>
									<h4>${item.getM_name()}</h4>
									</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo4')"
					class="w3-btn-block w3-theme-l1">프라푸치노</button>
				<div id="Demo4" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '프라푸치노' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.image_name}"
								onclick="orderFunction(${menu_num}, ${item.image_name}, ${item.image_name})">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity">
								<div class="w3-container w3-white">
									<p>${item.getM_name()}</p>
								</div>
								<div class="w3-container w3-white">
									sadsdafd
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>

			</div>

		</div>
		<div class="w3-half w3-blue-grey w3-container w3-center"
			style="height: 500px;">

			<div style="margin-top: 15px;">
				<h1>ORDER</h1>
			</div>
			<hr>
			<div class="w3-padding-10">
				<form action="">
					
				</form>

			</div>

		</div>
	</div>


	<script type="text/javascript">
		// Accordion
		var spinner = $("input[name='spinner']").spinner({ min : 0 });
		
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
		
		function orderFunction(num, name, img) {
			var div = $("#orderTemplate").tmpl(num, name, img);
		}
	</script>

</body>
</html>