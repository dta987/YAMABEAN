<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
			addShot(shotNum) ;
			addWhip(whipNum);
			totalPrice() ;
		}

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
					$("input:radio[name='my_optionSize']").prop("checked", false) ;
					$("input[name='mymenu_sizePrice']").detach();
					$("input[name='my_optionShot']").val(0);
					$("input[name='mymenu_shotPrice']").remove();
					$("input[name='my_optionWhip']").val(0);
					$("input[name='mymenu_whipPrice']").remove();
					$("input[name='mymenu_price']").remove();
					
					/* window.location.reload(); */
		});
		
		
		$("button[name='addShot']").on("click", function () {
			var shotNum = parseInt($("input[name='my_optionShot']").val());
			shotNum += 1;
			var addShotNum = null;
			if (shotNum < 11) {
				$("input[name='my_optionShot']").val(shotNum);
				addShotNum = parseInt(shotNum) * 500;
				$("input[name='mymenu_shotPrice']").val(addShotNum) ;
				totalPrice(addShotNum);
			}			
			
		});
		
	
		$("button[name='subShot']").on("click", function() {
			var shotNum = parseInt($("input[name='my_optionShot']").val());
			shotNum -= 1;
			var addShotNum = null;
			if (shotNum >= 0) {
				$("input[name='my_optionShot']").val(shotNum);
				addShotNum = parseInt(shotNum) * 500;
				$("input[name='mymenu_shotPrice']").val(addShotNum) ;
				totalPrice(addShotNum);
			}
		});
		
		$("button[name='addWhip']").on("click", function () {
			var whipNum = parseInt($("input[name='my_optionWhip']").val());
			whipNum += 1;
			var addWhipNum = null ;
			if (whipNum < 11) {
				$("input[name='my_optionWhip']").val(whipNum);
				addWhipNum = parseInt(whipNum) * 500 ;
				$("input[name='mymenu_whipPrice']").val(addWhipNum) ;
				totalPrice(addWhipNum);
			}	
		});
		
	
		$("button[name='subWhip']").on("click", function() {
			var whipNum = parseInt($("input[name='my_optionWhip']").val());
			whipNum -= 1;
			var addWhipNum = null ;
			if (whipNum >= 0) {
				$("input[name='my_optionWhip']").val(whipNum);
				addWhipNum = parseInt(whipNum) * 500 ;
				$("input[name='mymenu_whipPrice']").val(addWhipNum) ;
				totalPrice(addWhipNum);
			}
		});
	}
	
	

	function sizePrice(price) {
			$("input:radio[value='small']").prop("checked", true) ;
			$("input[name='mymenu_sizePrice']").val(price);
			totalPrice(price);		
			var mysize = null ;
			$("input:radio[name='my_optionSize']").click(function(){
				mysize = this.value;
				$("input[name='mymenu_sizePrice']").empty();
				if (mysize == 'small') {
					$("input[name='mymenu_sizePrice']").val(price);
					totalPrice(price);
				}else {
					var add = 500 ;
					var sizeprice = parseInt(price) + add ;
					$("input[name='mymenu_sizePrice']").val(sizeprice);
					totalPrice(sizeprice);
				}
			});
					
	}
	
	/* function addShot(shotNum) {
		var addShotNum = parseInt(shotNum) * 500 ;
		$("input[name='mymenu_shotPrice']").val(addShotNum) ;
		totalPrice(addShotNum);
	} */
	
	/* function addWhip(whipNum) {
		var addWhipNum = parseInt(whipNum) * 500 ;
		$("input[name='mymenu_whipPrice']").val(addWhipNum) ;
		totalPrice(addWhipNum);
	} */
	
	
	function totalPrice(price) {
		var mySizePrice = parseInt($("input[name='mymenu_sizePrice']").val());
		var myShotPrice = parseInt($("input[name='mymenu_shotPrice']").val());
		var myWhipPrice = parseInt($("input[name='mymenu_whipPrice']").val());
		var myPrice = mySizePrice + myShotPrice + myWhipPrice ;
		$("input[name='mymenu_price']").val(myPrice);
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
				alert("m_num : "+ $(this).children($("input[name='m_num']")).val());
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
								id="${item.menu_num}">
								<img src="${pageContext.request.contextPath}${item.image_name}"
									alt="Norway" style="width: 100%" class="w3-hover-opacity"
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
					class="w3-btn-block w3-theme-l1">
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
					class="w3-btn-block w3-theme-l1">
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


		<form action="/YamaBean/mymenu/registerMyMenu" method="POST"
			id="registerMyMenu">
			<div class="w3-half w3-blue-grey w3-container w3-center"
				style="height: 200px;">
				<div style="margin-top: 15px;">
					<h1>MY MENU REGISTER</h1>
				</div>
				<hr>
				<div class="w3-padding-10"
					style="padding-bottom: 10px; height: 300px; overflow: auto;">
					<div class="w3-row" align="left" id="registerList"></div>
					<!-- 메뉴리스트에서 선택한 마이메뉴이미지 -->
				</div>
			</div>


			<div style="margin-top: 15px;" align="left">
				<br> <br>
				<div>
					<label>My Menu NAME</label> <input type="text" name="mymenu_name">
				</div>
				<div id="my_size">
					<label>My Menu SIZE</label> 
					<input type="radio" value="small" name="my_optionSize">small 
					<input type="radio" value="large" name="my_optionSize">large 
					<input type="text" value="0" name="mymenu_sizePrice" readonly="readonly" style="border: none;">
				</div>
				<div>
					<label>Personal Options</label>
					<br>
					<label>add SHOT (+ 500)</label>
					<table style="background-color: white;">
						<tr>
							<td rowspan="2" width="50px;">
								<input type="text" name="my_optionShot" value="0" readonly="readonly" style="color: black; width: 100%; height: 100%; border: none;">
							</td>
							<td>
								<button type="button" class="btn btn-default" name="addShot">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" class="btn btn-default" name="subShot">
									<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
								</button>
								<input type="text" value="0" name="mymenu_shotPrice" readonly="readonly" style="border: none;">
							</td>
						</tr>
					</table>
					<br>
					<label>add WHIP (+ 500)</label>
					<table style="background-color: white;">
						<tr>
							<td rowspan="2" width="50px;">
								<input type="text" name="my_optionWhip" value="0" readonly="readonly" style="color: black; width: 100%; height: 100%; border: none;">
							</td>
							<td>
								<button type="button" class="btn btn-default" name="addWhip">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<button type="button" class="btn btn-default" name="subWhip">
									<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
								</button>
								<input type="text" value="0" name="mymenu_whipPrice" readonly="readonly" style="border: none;">
							</td>
						</tr>
					</table>
				</div>
				<div>
					<label>총 가격</label> <input type="text" name="mymenu_price" value="0"
						readonly="readonly" style="border: none;">
				</div>
			</div>
			<div>
					<button type="reset" onclick="goBack()">취소</button>
					<button type="submit">주문하기</button>
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