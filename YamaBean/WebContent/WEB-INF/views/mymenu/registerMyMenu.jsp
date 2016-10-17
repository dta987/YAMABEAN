<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/x-jquery-tmpl" id="orderTemplate">
	<div id="\${name}" class="w3-row menu" style="padding-bottom: 10px;">
		<input type="hidden" name="m_num" value="\${num}">
		<div class="w3-col s3">
			<img src="<%=uploadedFolder%>\${img}" style="width: 50%">
		</div>
		<div class="w3-col s6 w3-container" align="left">
			<strong>\${name}</strong>
			<br>
			<strong>\${price}</strong>
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
		$("button[name='" + name + "add']").on("click", function() {

			var value = parseInt($("input[name='" + name + "value']").val());
			value += 1;
			if (value == 0) {

			} else {
				$("input[name='" + name + "value']").val(value);
				addtotal(name);
			}

		});
		$("button[name='" + name + "sub']").on("click", function() {

			var value = parseInt($("input[name='" + name + "value']").val());
			value -= 1;
			if (value == 0) {

			} else {
				$("input[name='" + name + "value']").val(value);
				subtotal(name);
			}

		});

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
		$("#registerMenu")
				.submit(
						function() {
							$("#registerList > div")
									.each(
											function(index) {
												alert("m_num : "
														+ $(this)
																.children(
																		$("input[name='m_num']"))
																.val());
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
		<div class="w3-half w3-black w3-container w3-center"
			style="height: 500px;">
			<div style="margin-top: 15px;">
				<h1>REGISETER MY MENU</h1>
			</div>
			<hr>
			<div class="w3-padding-10 w3-container"
				style="height: 400px; overflow: auto;">
				<button onclick="myFunction('Demo1')"
					class="w3-btn-block w3-theme-l1">
					<h3>콜드블루</h3>
				</button>
				<div id="Demo1" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '콜드브루' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.m_name}">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
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
					class="w3-btn-block w3-theme-l1">
					<h3>브루드</h3>
				</button>
				<div id="Demo2" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '브루드커피' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.m_name}">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
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
					class="w3-btn-block w3-theme-l1">
					<h3>에스프레소</h3>
				</button>
				<div id="Demo3" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '에스프레소' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.m_name}">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
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
					class="w3-btn-block w3-theme-l1">
					<h3>프라푸치노</h3>
				</button>
				<div id="Demo4" class="w3-accordion-content w3-container">
					<c:forEach var="item" items="${allFindMenus}">
						<c:if test="${item.getM_category() == '프라푸치노' }">
							<div class="w3-third w3-container w3-margin-bottom"
								id="${item.m_name}">
								<img src="<%=uploadedFolder%>${item.image_name}" alt="Norway"
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


		<div class="w3-half w3-blue-grey w3-container w3-center"
			style="height: 500px;">
			<div style="margin-top: 15px;">
				<h1>MY MENU REGISTER</h1>
			</div>
			<hr>
			<div class="w3-padding-10"
				style="padding-bottom: 10px; height: 350px; overflow: auto;">
				<form action="/YamaBean/mymenu/registerMyMenu" method="POST"
					id="registerMenu">

					<div class="w3-row" align="left" id="registerList"></div>
					
					<br><br>
						<div class="w3-col s3" align="left">
							<h5>마이메뉴 이름</h5>
						</div>
						<div class="w3-col s3" align="right">
							<input type="text" name="mymenu_name">
						</div>
						<br>
						<div class="w3-col s3" align="left">
							<h5>수량</h5>
						</div>
						<div class="w3-col s3" align="right">

							<div class="w3-col s3" style="padding-top: 2px;">
								<input type="text" size="3" id="value" name="\${name}value"
									value="1" style="font-size: 12pt; color: black;">
								<button type="button" class="btn btn-default" value="\${price}"
									name="\${name}add">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</button>
								<button type="button" class="btn btn-default" value="\${price}"
									name="\${name}sub">
									<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
								</button>
							</div>



							<label id="mymenu_price">0</label> <label id="my_price">0</label>
						</div>
						<br>
						<div class="w3-col s3" align="left">
							<h5>사이즈</h5>
						</div>
						<div class="w3-col s3" align="right">
							<input type="radio" value="small" name="my_optionSize"
								id="my_optionSize">small <input type="radio"
								value="large" name="my_optionSize" id="my_optionSize">large
							<label id="my_Size">0</label>
						</div>
						<br>
						<div class="w3-col s3" align="left">
							<h5>퍼스널 옵션</h5>
						</div>
						<br>
						<div class="w3-col s3" align="left">
							<h5>샷 추가 (+ 500원)</h5>
						</div>
						<div class="w3-col s3" align="right">
							<label id="my_optionShot">0</label> <label id="my_Shot">0</label>
						</div>
						<br>
						<div class="w3-col s3" align="left">
							<h5>휘핑 추가 (+ 500원)</h5>
						</div>
						<div class="w3-col s3" align="right">
							<label id="my_optionWhip">0</label> <label id="my_Whip">0</label>
						</div>
						<div class="w3-col s3" align="right">
							<h5>총 가격 :</h5>
							<label id="mymenu_price">0</label>
						</div>
					<br><br>
					<div class="w3-col s3" align="right">
						<button type="reset" class="btn btn-default" onclick="goBack()">취소</button>
						<button type="submit" class="btn btn-primary">주문하기</button>
					</div>

				</form>
			</div>

		</div>
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