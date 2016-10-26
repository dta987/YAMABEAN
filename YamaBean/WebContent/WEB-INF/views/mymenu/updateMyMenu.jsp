<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {

		$("input:radio[name='my_optionSize']").change(
				function() {

					var midprice = parseInt($("input[id='menu_originalprice']")
							.val());

					if ($("input[value='small']:checked").val()) {
						var firoptionprice = parseInt($(
								"input[name='mymenu_shotPrice']").val())
								+ parseInt($("input[name='mymenu_whipPrice']")
										.val());
						totalprice = firoptionprice + midprice;

						$("input[name='mymenu_sizePrice']").val(midprice);
						$("input[name='mymenu_price']").val(totalprice);

					} else if ($("input[value='large']:checked").val()) {
						var sizeprice = midprice + 500;
						var seoptionprice = parseInt($(
								"input[name='mymenu_shotPrice']").val())
								+ parseInt($("input[name='mymenu_whipPrice']")
										.val());
						totalprice = sizeprice + seoptionprice;

						$("input[name='mymenu_sizePrice']").val(sizeprice);
						$("input[name='mymenu_price']").val(totalprice);
					} else {
						alert("사이즈를 체크 해 주세요.");
					}
				});

	});

	function addshot(shotprice) {
		var total = parseInt($("input[name='mymenu_price']").val());
		var minus = parseInt(shotprice);
		var addAmount = parseInt($("input[name='my_optionShot']").val()) + 1;
		var shprice = addAmount * minus;
		var menuprice = parseInt($("input[name='mymenu_sizePrice']").val());
		var whipprice = parseInt($("input[name='mymenu_whipPrice']").val());
		var totalprice = shprice + whipprice + menuprice;
		var optionprice = shprice + whipprice;

		if (shotprice != null) {

			$("input[name='mymenu_shotPrice']").val(shprice);
			$("input[name='my_optionShot']").val(addAmount);

			if (menuprice == null) {
				$("input[name='mymenu_price']").val(optiontotal)
			} else {
				$("input[name='mymenu_price']").val(totalprice);
			}
		}

	}

	function subshot(shotprice) {
		var total = parseInt($("input[name='mymenu_price']").val());
		var minus = parseInt(shotprice);
		var addAmount = null;
		var shprice = null;
		var menuprice = parseInt($("input[name='mymenu_sizePrice']").val());
		var whipprice = parseInt($("input[name='mymenu_whipPrice']").val());
		var totalprice = null;

		if (menuprice != null) {

			if ($("input[name='my_optionShot']").val() <= 0) {
				alert("더 이상 줄일 수 없습니다.(최소 0)");

				$("input[name='my_optionShot']").val(0);
				shprice = 0 * minus;

				totalprice = shprice + whipprice + menuprice;
				$("input[name='mymenu_shotPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			} else {
				addAmount = parseInt($("input[name='my_optionShot']").val()) - 1
				shprice = addAmount * minus;
				totalprice = shprice + whipprice + menuprice;
				$("input[name='my_optionShot']").val(addAmount);
				$("input[name='mymenu_shotPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			}

		} else {

			if ($("input[name='my_optionShot']").val() <= 0) {
				alert("더 이상 줄일 수 없습니다.(최소 0)");

				$("input[name='my_optionShot']").val(0);
				shprice = 0 * minus;

				totalprice = shprice + whipprice;
				$("input[name='mymenu_shotPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			} else {
				addAmount = parseInt($("input[name='my_optionShot']").val()) - 1
				shprice = addAmount * minus;
				totalprice = shprice + whipprice;

				$("input[name='my_optionShot']").val(addAmount);
				$("input[name='mymenu_shotPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			}
		}
	}

	function addwhip(shotprice) {
		var total = parseInt($("input[name='mymenu_price']").val()); //총합계
		var plus = parseInt(shotprice); //500원
		var addAmount = parseInt($("input[name='my_optionWhip']").val()) + 1; //추가수
		var shprice = addAmount * plus;
		var menuprice = parseInt($("input[name='mymenu_sizePrice']").val());
		var shotprice = parseInt($("input[name='mymenu_shotPrice']").val());
		var totalprice = shprice + shotprice + menuprice;
		var optiontotal = shprice + shotprice;

		$("input[name='mymenu_whipPrice']").val(shprice);
		$("input[name='my_optionWhip']").val(addAmount);

		if (menuprice == null) {
			$("input[name='mymenu_price']").val(optiontotal)
		} else {
			$("input[name='mymenu_price']").val(totalprice);
		}
	}

	function subwhip(shotprice) {
		var total = parseInt($("input[name='mymenu_price']").val());
		var minus = parseInt(shotprice);
		var addAmount = null;
		var shprice = null;
		var menuprice = parseInt($("input[name='mymenu_sizePrice']").val());
		var shotprice = parseInt($("input[name='mymenu_shotPrice']").val());
		var totalprice = null;

		if (menuprice != null) {

			if ($("input[name='my_optionWhip']").val() <= 0) {
				alert("더 이상 줄일 수 없습니다.(최소 0)");

				$("input[name='my_optionWhip']").val(0);
				shprice = 0 * minus;

				totalprice = shprice + shotprice + menuprice;
				$("input[name='mymenu_whipPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			} else {
				addAmount = parseInt($("input[name='my_optionWhip']").val()) - 1
				shprice = addAmount * minus;
				totalprice = shprice + shotprice + menuprice;
				$("input[name='my_optionWhip']").val(addAmount);
				$("input[name='mymenu_whipPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			}

		} else {

			if ($("input[name='my_optionWhip']").val() <= 0) {
				alert("더 이상 줄일 수 없습니다.(최소 0)");

				$("input[name='my_optionWhip']").val(0);
				shprice = 0 * minus;

				totalprice = shprice + shotprice;
				$("input[name='mymenu_whipPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			} else {
				addAmount = parseInt($("input[name='my_optionWhip']").val()) - 1
				shprice = addAmount * minus;
				totalprice = shprice + shotprice;
				$("input[name='my_optionWhip']").val(addAmount);
				$("input[name='mymenu_whipPrice']").val(shprice);
				$("input[name='mymenu_price']").val(totalprice);
			}
		}

	}

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
		$("#updateMyMenu").submit(function() {

			alert("여기옴");
			if ($("input[name='mymenu_name']").val() == "") {
				alert("마이 메뉴 이름을 정해주세요.");
				return false;
			} else {
				return true;
			}
		});
	});

	function goBack() {
		window.history.back();
	}
</script>

</head>
<body>
	<div class="container-fluid" style="margin-top: 100px;">
		<div class="row content">
			<form id="updateMyMenu"
				action="${pageContext.request.contextPath}/mymenu/updateMyMenu"
				method="post">
				<input name="menu_num" value="${myMenuModel.menuEntity.menu_num}" type="hidden"> 
					<input name="mymenu_num" value="${myMenuModel.mymenu_num}" type="hidden">
				<div class="col-sm-12 col-sm-offset-4">
					<div class="w3-third w3-margin-bottom ">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-black">
								<p class="w3-xlarge">${myMenuModel.mymenu_name}</p> <span
								class="w3-opacity">${myMenuModel.menuEntity.m_name}</span>
							</li>
							<li class="w3-padding-16"><img
								src="${uploadedFolder}${myMenuModel.menuEntity.image}"></li>


							<li class="w3-padding-16"><label>My Menu NAME</label><br>
								<input type="text" name="mymenu_name"
								value="${myMenuModel.mymenu_name}" /></li>

							<li class="w3-padding-16"><label>My Menu SIZE</label><br>
								<input id="menu_originalprice" type="hidden"
								value="${myMenuModel.menuEntity.price}"> <input
								type="radio" value="small" name="my_optionSize"
								checked="checked">small <input type="radio"
								value="large" name="my_optionSize">large <input
								type="text" name="mymenu_sizePrice"
								value="${myMenuModel.menuEntity.price}" readonly="readonly"
								style="border: none; display: none;"></li>


							<li class="w3-padding-16">
								<table align="center">
									<tr>
										<td><label>add SHOT(+ 500)</label>
											<table style="background-color: white;">
												<tr>
													<td rowspan="2" width="50px;"><input type="text"
														name="my_optionShot" value="0" readonly="readonly"
														style="color: black; width: 100%; height: 100%; border: none;">
													</td>
													<td>
														<button type="button" class="btn btn-default"
															name="addShot" id="addShot" onclick="addshot('500')">
															<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
														</button>
													</td>
												</tr>
												<tr>
													<td>
														<button type="button" class="btn btn-default"
															name="subShot" onclick="subshot('500')">
															<span class="glyphicon glyphicon-minus"
																aria-hidden="true"></span>
														</button> <input type="text" value="0" name="mymenu_shotPrice"
														readonly="readonly" style="border: none; display: none;">
													</td>
												</tr>
											</table></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><label>add WHIP (+ 500)</label>
											<table style="background-color: white;">
												<tr>
													<td rowspan="2" width="50px;"><input type="text"
														name="my_optionWhip" value="0" readonly="readonly"
														style="color: black; width: 100%; height: 100%; border: none;">
													</td>
													<td>
														<button type="button" class="btn btn-default"
															name="addWhip" onclick="addwhip('500')">
															<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
														</button>
													</td>
												</tr>
												<tr>
													<td>
														<button type="button" class="btn btn-default"
															name="subWhip" onclick="subwhip('500')">
															<span class="glyphicon glyphicon-minus"
																aria-hidden="true"></span>
														</button> <input type="text" value="0" name="mymenu_whipPrice"
														readonly="readonly" style="border: none; display: none;">
													</td>
												</tr>
											</table></td>
									</tr>
								</table>
							</li>

							<li class="w3-padding-16">
								<h2 class="w3-wide">
									<input type="text" name="mymenu_price"
										value="${myMenuModel.menuEntity.price}" readonly="readonly"
										style="border: none;" size="2"> 원
								</h2> <span class="w3-opacity">결재금액</span>
							</li>
							<li class="w3-light-grey w3-padding-24">
								<button type="submit" class="w3-btn w3-green w3-padding-large">저장</button>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>


	<footer class="w3-container w3-padding-32" id="contact"> </footer>


	<div class="w3-black w3-center w3-padding-24">YamaBean</div>


</body>
</html>