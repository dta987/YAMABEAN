<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>

<script type="text/x-jquery-tmpl" id="orderTemplate">
	<div id="\${name}" class="w3-row menu" style="padding-bottom: 10px;">
		<input type="hidden" name="menu_num" value="\${num}">
		<div class="w3-col s3" align="center">
			<img src="${uploadedFolder}\${img}" style="width: 50%" >
		</div>
		<div class="w3-col s3 w3-container" align="left">
			<br>
			<strong>\${name}</strong>		
		</div>		
		<div class="w3-col s3 w3-container" align="right">
			<br>
			<strong>\${price}</strong>
		</div>
		<div class="w3-col s3 w3-container" align="center">
			<br>
			<button name="\${name}remove" style="border: none;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
		</div>		
	</div>
</script>


<script type="text/javascript">
	function orderFunction(num, name, img, content, price) {
		var bool = Boolean(false);

		$("#registerList > div ").each(function(index) {
			if ($(this) != null) {
				alert("하나의 메뉴만 선택 할 수 있습니다.")
				bool = true;
			}
		});

		if (bool) {
		} else {
			var data = {
				"num" : num,
				"name" : name,
				"img" : img,
				"content" : content,
				"price" : price,
			};

			var div = $("#orderTemplate").tmpl(data);
			$("#registerList").append(div);
			createEvent(name);
			sizePrice(price);
		}

	}

	function createEvent(name) {
		$("button[name='" + name + "remove']").on("click", function() {
			$("div[id='" + name + "']").remove();
			$("input:radio[name='my_optionSize']").prop("checked", false);
			$("input[name='mymenu_sizePrice']").val(0);
			$("input[name='my_optionShot']").val(0);
			$("input[name='mymenu_shotPrice']").val(0);
			$("input[name='my_optionWhip']").val(0);
			$("input[name='mymenu_whipPrice']").val(0);
			$("input[name='mymenu_price']").val(0);

		});

	}

	function sizePrice(price) {
		if (price != null) {
			var mysize = null;
			var optionprice = parseInt($("input[name='mymenu_shotPrice']")
					.val())
					+ parseInt($("input[name='mymenu_whipPrice']").val());
			var midprice = parseInt(price);
			var totalprice = null;
			var initprice = midprice + optionprice;

			$("input:radio[value='small']").prop("checked", true);
			$("input[name='mymenu_sizePrice']").val(midprice);
			$("input[name='mymenu_price']").val(initprice);

			$("input:radio[name='my_optionSize']").click(
					function() {
						$("input[name='mymenu_sizePrice']").empty();
						if ($("input[value='small']:checked").val()) {
							var firoptionprice = parseInt($(
									"input[name='mymenu_shotPrice']").val())
									+ parseInt($(
											"input[name='mymenu_whipPrice']")
											.val());
							totalprice = firoptionprice + midprice;
							$("input[name='mymenu_sizePrice']").val(midprice);
							$("input[name='mymenu_price']").val(totalprice);
						} else if ($("input[value='large']:checked").val()) {
							var sizeprice = parseInt(price) + 500;
							var seoptionprice = parseInt($(
									"input[name='mymenu_shotPrice']").val())
									+ parseInt($(
											"input[name='mymenu_whipPrice']")
											.val());
							totalprice = sizeprice + seoptionprice;
							$("input[name='mymenu_sizePrice']").val(sizeprice);
							$("input[name='mymenu_price']").val(totalprice);
						} else {
							alert("사이즈를 체크 해 주세요.");
						}
					});
		}
	}

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
		$("#registerMenu").submit(function() {
			$("#registerList > div").each(function(index) {
				/* alert("m_num : "+ $(this).children($("input[name='m_num']")).val() ); */

				if ($("input[name='mymenu_name']").val() == null) {
					alert("마이 메뉴 이름을 정해주세요.");
					return false;
				}
			});
		

			return false;
		});
	});

	function goBack() {
		window.history.back();
	}
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
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '콜드브루' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
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
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '브루드커피' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
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
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '에스프레소' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
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
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '프라푸치노' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.menu_num}">
								<img src="${uploadedFolder}${item.image_name}" alt="Norway"
									style="width: 100%" class="w3-hover-opacity"
									onclick="orderFunction('${item.menu_num}', '${item.m_name}', '${item.image_name}', '${item.content}', '${item.price}')">
								<div>
									<h5>${item.getM_name()}</h5>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- --------------------------------mymenu 등록하기---------------------------------------------------  -->

		<form action="/YamaBean/mymenu/registerMyMenu" method="POST"
			id="registerMyMenu">
			<div class="w3-half w3-white w3-card-8 w3-container w3-center"
				style="height: 500px;">
				<div style="margin-top: 15px;">
					<h1>MY MENU</h1>
				</div>
				<hr>
				<div class="w3-padding-10 w3-card-8"
					style="padding-bottom: 10px; height: 100px;">
					<div class="w3-row" align="left" id="registerList"></div>
					<!-- 메뉴리스트에서 선택한 마이메뉴이미지 -->
				</div>
				<br>
				<div align="left">
					<label>My Menu NAME</label> <input type="text" name="mymenu_name">
				</div>
				<div id="my_size" align="left">
					<label>My Menu SIZE</label> <input type="radio" value="small"
						name="my_optionSize">small <input type="radio"
						value="large" name="my_optionSize">large <input
						type="text" value="0" name="mymenu_sizePrice" readonly="readonly"
						style="border: none; display: none;">
				</div>
				<br>
				<div align="left" style="height: 170px;">

					<table>
						<tr>
							<td><label>add SHOT (+ 500)</label>
								<table style="background-color: white;">
									<tr>
										<td rowspan="2" width="50px;"><input type="text"
											name="my_optionShot" value="0" readonly="readonly"
											style="color: black; width: 100%; height: 100%; border: none;">
										</td>
										<td>
											<button type="button" class="btn btn-default" name="addShot"
												id="addShot" onclick="addshot('500')">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											</button>
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" class="btn btn-default" name="subShot"
												onclick="subshot('500')">
												<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
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
											<button type="button" class="btn btn-default" name="addWhip"
												onclick="addwhip('500')">
												<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											</button>
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" class="btn btn-default" name="subWhip"
												onclick="subwhip('500')">
												<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
											</button> <input type="text" value="0" name="mymenu_whipPrice"
											readonly="readonly" style="border: none; display: none;">
										</td>
									</tr>
								</table></td>
						</tr>


					</table>
				</div>
				<div align="left">
					<div class="w3-col s3" align="left">
						<label>총 가격</label>
					</div>
					<div class="w3-col s6" align="right">
						<input type="text" name="mymenu_price" value="0"
							readonly="readonly" style="border: none;">
					</div>
					<div class="w3-col s3" align="right">
						<button id="orderbtn" type="submit" class="btn btn-primary">주문하기</button>
					</div>
				</div>

			</div>
		</form>
	</div>




	<!-- private int mymenu_num ;
	private Member member_id ; //fk, member : id 
	private String mymenu_name ;
	private MenuEntity menu_num ; //fk, menus : menu_num 
	private String my_optionSize ; 
	private String sub_day ;
	private int mymenu_price;
	private int my_optionAmount ;
	private int my_optionShot ;
	private int my_optionWhip ;
	
	 -->
</body>
</html>
