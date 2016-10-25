<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/x-jquery-tmpl" id="orderTemplate">
	<div id="\${name}" class="w3-row menu w3-card-8" style="padding: 10px 0px 10px 0px">
		<input type="hidden" name="m_num" value="\${num}">
		<input type="hidden" name="m_price" value="\${price}">
		<div class="w3-col s2">
			<img src="${uploadedFolder}\${img}" style="width: 50%">
		</div>
		<div class="w3-col s3 w3-container" align="left" style="padding: 15px;">
			<strong>\${name}</strong>
		</div>
		<div class="w3-col s3 w3-container" align="left" style="padding: 15px;">
			<strong>\${price}</strong>
		</div>
		<div class="w3-col s3">
			<table style="background-color: white;">
				<tr>
					<td rowspan="2" width="50px;">
						<input type="text" id="\${name}value" name="value" value="1" readonly="readonly" style="color: black; width: 100%; height: 100%; border: none;">
					</td>
					<td>
						<button type="button" class="btn btn-default" value="\${price}" name="\${name}add">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn btn-default" value="\${price}" name="\${name}sub">
							<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
						</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="w3-col s1 w3-container" align="left" style="padding: 15px;">
			<button name="\${name}remove" style="border: none;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>
	</div>
</script>

<script type="text/x-jquery-tmpl" id="orderInfoTemplate">
	<div id="\${name}" class="w3-row menu bordershadow" style="padding: 10px 5px 10px">
		<input type="hidden" name="m_num" value="\${num}">
		<input type="hidden" name="m_name" value="\${name}">
		<input type="hidden" name="optionsize" value="\${size}">
		<input type="hidden" name="optionshot" value="\${shot}">
		<input type="hidden" name="optionwhip" value="\${whip}">
		<div class="w3-col s3">
			<img src="${uploadedFolder}\${img}" style="width: 50%">
		</div>
		<div class="w3-col s3 w3-container" align="center" style="padding : 20px;">
			<strong>\${name}</strong>
		</div>
		<div class="w3-col s3 w3-container" align="center" style="padding : 20px;">
			<strong>\${price}</strong>
		</div>
		<div class="w3-col s3 w3-container" align="center" style="padding : 10px;">
			<input type="text" name="ordervalue" readonly="readonly" style="border: none;">
		</div>
	</div>
</script>
<style type="text/css">
input[type=text], select {
	width: 30%;
	padding: 1px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	display: inline-block;
}

.bordershadow:hover {
	background-color: #787878;
}
</style>


<script type="text/javascript">
	function orderFunction(num, name, img, price, size, shot, whip) {
		
		if(size == null) { size = 'small'; }
		if(shot == null) { shot = 0; }
		if(whip == null) { whip = 0; }
		
		
		alert(size + ", " + shot + ", " + whip);

		var bool = Boolean(false);

		$("#orderList > div ").each(function(index) {
			if ($(this).attr("id") == name) {
				alert("이미 추가한 매뉴 입니다.");
				bool = true;
			}
		});

		if (bool) {
		} else {
			var data = {
				"num" : num,
				"name" : name,
				"img" : img,
				"price" : price,
				"size" : size,
				"shot" : shot,
				"whip" : whip,
			};

			var orderdiv = $("#orderTemplate").tmpl(data);
			var orderInfodiv = $("#orderInfoTemplate").tmpl(data);
			$("#orderList").append(orderdiv);
			$("#orderMenu").append(orderInfodiv);
			createEvent(name);
			addtotal(name);

		}

	}

	function addtotal(name) {

		var price = parseInt($("button[name='" + name + "add']").val());
		var total = parseInt($("#total").text());
		total += price;
		$("#total").text(total);

	}

	function subtotal(name) {

		var price = parseInt($("button[name='" + name + "sub']").val());
		var total = parseInt($("#total").text());
		total -= price;
		$("#total").text(total);

	}

	function createEvent(name) {

		$("button[name='" + name + "remove']").on(
				"click",
				function() {

					var amount = parseInt($("#" + name).find(
							$("#" + name + "value")).val());
					var m_price = parseInt($("#" + name).find(
							$("input[name='m_price']")).val());

					var sub = amount * m_price
					var total = $("#total").text();

					$("#total").text(total - sub);
					$("input[name='totalprice']").val(total - sub);

					$("div[id='" + name + "']").remove();
				});

		$("button[name='" + name + "add']").on("click", function() {

			var value = parseInt($("input[id='" + name + "value']").val());
			value += 1;
			if (value < 11) {
				$("input[id='" + name + "value']").val(value);
				addtotal(name);
			}

		});
		$("button[name='" + name + "sub']").on("click", function() {

			var value = parseInt($("input[id='" + name + "value']").val());
			value -= 1;
			if (value != 0) {
				$("input[id='" + name + "value']").val(value);
				subtotal(name);

			}
		});

	}

	$(function() {
		$("input[name='usepoint']").change(
				function() {
					var mypoint = parseInt($("#mypoint").val());
					var usepoint = parseInt($("input[name='usepoint']").val());
					var totalprice = parseInt($("#total").text());
					var percentage = (totalprice * 10) / 100;
					if (mypoint < usepoint) {
						alert("포인트가 부족합니다!!");
						$(this).fouces();
					} else if (percentage < usepoint) {
						alert("포인트는 전체 가격의 10%만 사용가능합니다. \n" + percentage
								+ "point 사용가능");
						return false;
					} else {
						$("input[name='totalprice']")
								.val(totalprice - usepoint);
					}
				});
	});

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

	$(function() {
		$("#orderbtn")
				.click(
						function() {
							if ($("#total").text() == 0) {
								alert("메뉴를 선택해주세요")
							} else {
								$("input[name='value']").each(
										function(index) {
											$(this).val();
											$(
													"input[name='ordervalue']:eq("
															+ index + ")").val(
													$(this).val());
										});
								$("input[name='totalprice']").val(
										$("#total").text());
								document.getElementById("orderInfo").style.display = 'block';
							}

						});
	});

	$(
			function() {
				$("#orderForm").submit(
						function() {

							var mypoint = parseInt($("#mypoint").val());
							var usepoint = parseInt($("input[name='usepoint']")
									.val());
							var totalprice = parseInt($("#total").text());
							var percentage = (totalprice * 10) / 100;
							var payment = $("#payment").val();
							var store = $("#store").val();
							
							if (percentage < usepoint) {
								alert("포인트는 전체 가격의 10%만 사용가능합니다. \n"
										+ percentage + "point 사용가능");
								return false;
							} else if (store == "null") {
								alert("매장을 선택해주세요");
								return false;
							} else if (payment == "null") {
								alert("결재 수단을 선택해주세요");
								return false;
							} else if (mypoint < usepoint) {
								alert("포인트가 부족합니다!!");
								return false;
							} else {
								return true;
							}
						});
			})
</script>

</head>
<body>

	<div class="w3-row class w3-content"
		style="max-width: 1300px; margin-top: 200px;">
		<div class="w3-half w3-light-grey w3-container w3-center w3-card-8"
			style="height: 500px;">
			<div style="margin-top: 15px;">
				<h1>MENU</h1>
			</div>
			<hr>
			<div class="w3-padding-10 w3-container"
				style="height: 400px; overflow: auto;">
				<button onclick="myFunction('Demo1')"
					class="w3-btn-block w3-light-grey">
					<h3>콜드블루</h3>
				</button>
				<div id="Demo1" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '콜드브루' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.price}')">
								<div>
									<h5>${item.getM_name()}</h5>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo2')"
					class="w3-btn-block w3-light-grey">
					<h3>브루드</h3>
				</button>
				<div id="Demo2" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '브루드커피' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.price}')">
								<div>
									<h5>${item.getM_name()}</h5>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo3')"
					class="w3-btn-block w3-light-grey">
					<h3>에스프레소</h3>
				</button>
				<div id="Demo3" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '에스프레소' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.price}')">
								<div>
									<h5>${item.getM_name()}</h5>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<button onclick="myFunction('Demo4')"
					class="w3-btn-block w3-light-grey">
					<h3>프라푸치노</h3>
				</button>
				<div id="Demo4" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${findByList}">
						<c:if test="${item.getM_category() == '프라푸치노' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.price}')">
								<div>
									<h5>${item.getM_name()}</h5>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<c:if test="${not empty allListMyMenu}">
					<button onclick="myFunction('Demo5')"
						class="w3-btn-block w3-light-grey">
						<h3>My Menu</h3>
					</button>
					<div id="Demo5" class="w3-accordion-content w3-container">
						<c:forEach var="mymenu" items="${allListMyMenu}">
							<div class="w3-third w3-container w3-margin-bottom"
								id="my${mymenu.mymenu_num}">
								<img src="${uploadedFolder}${mymenu.menuEntity.image}"
									alt="Norway" style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${mymenu.menuEntity.menu_num}', 'MY ${mymenu.mymenu_name}', '${mymenu.menuEntity.image}', '${mymenu.mymenu_price}', '${mymenu.my_optionSize}', '${mymenu.my_optionShot}', '${mymenu.my_optionWhip}')">
								<div>
									<h5>${mymenu.mymenu_name}</h5>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
		<div class="w3-half w3-white w3-card-8 w3-container w3-center"
			style="height: 500px;">

			<div style="margin-top: 15px;">
				<h1>ORDER</h1>
			</div>
			<hr>
			<div class="w3-padding-10">
				<div class="w3-row" align="left"
					style="padding-bottom: 10px; height: 350px; overflow: auto;"
					id="orderList"></div>
				<div style="height: 100px; padding-top: 10px;">
					<div class="w3-col s3" align="left">
						<h5>총 가격 :</h5>
					</div>
					<div class="w3-col s6" align="right">
						<label id="total">0</label>
					</div>
					<div class="w3-col s3" align="right">
						<button id="orderbtn" type="button" class="btn btn-primary">주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="orderInfo" class="w3-modal">
		<div class="w3-modal-content w3-card-8 w3-animate-zoom"
			style="max-width: 600px">

			<div class="w3-center">
				<br> <span
					onclick="document.getElementById('orderInfo').style.display='none'"
					class="w3-closebtn w3-hover-red w3-container w3-padding-8 w3-display-topright"
					title="Close Modal">×</span>

				<div class="w3-row" style="padding: 10px 5px 10px">
					<div class="w3-col s3 w3-container" align="center"
						style="padding: 20px;">
						<strong>이미지</strong>
					</div>
					<div class="w3-col s3 w3-container" align="center"
						style="padding: 20px;">
						<strong>이름</strong>
					</div>
					<div class="w3-col s3 w3-container" align="center"
						style="padding: 20px;">
						<strong>가격</strong>
					</div>
					<div class="w3-col s3 w3-container" align="center"
						style="padding: 20px;">
						<strong>수량</strong>
					</div>
				</div>
				<form id="orderForm" class="w3-container" method="post">
					<input type="hidden" name="m_group" value="coffee"> <input
						type="hidden" name="member_id"
						value="${sessionScope.loginInfo.id}">
					<div class="w3-section" id="orderMenu"
						style="height: 200px; overflow: auto;"></div>
					<div style="padding-top: 10px; border-top-style: solid;">
						<div class="w3-col s3" align="left">
							<h5>총 가격 :</h5>
						</div>
						<div class="w3-col s9" align="right">
							<input type="text" name="totalprice" readonly="readonly"
								style="border: none;">
						</div>
					</div>
					<div class="w3-section" id="info" align="left">
						<label>수령매장</label> <select name="store_num" id="store"
							style="width: 50%">
							<option selected="selected" value="null">=== 매장선택 ===</option>
							<c:forEach var="store" items="${findByStoreList}">
								<option value="${store.store_num}">${store.store_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="w3-section" id="info" align="left">
						<label>Point</label> <input type="text" id="mypoint"
							value="${sessionScope.loginInfo.point}" readonly="readonly"
							style="width: 100px;"> <input type="text" name="usepoint"
							value="0" style="width: 100px;"> <label>결제수단</label> <select
							name="payment" id="payment" style="width: 30%">
							<option selected="selected" value="null">=== 결제선택 ===</option>
							<option value="카드결제">카드결제</option>
							<option value="계좌이체">계좌이체</option>
						</select>

					</div>
					<div class="w3-section">
						<button class="w3-btn-block w3-green w3-section w3-padding"
							type="submit">주문하기</button>
					</div>
				</form>

				<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
					<button
						onclick="document.getElementById('orderInfo').style.display='none'"
						type="button" class="w3-btn w3-red">Cancel</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>