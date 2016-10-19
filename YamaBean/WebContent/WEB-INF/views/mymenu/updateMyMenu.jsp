<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript">


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

	<div align="center">
		<br>
		<h1>Update MyMenu</h1>
		<hr width="500px">
	
		<div>
		<form method="POST" action="/YamaBean/mymenu/updateMyMenu" >
			<div style="margin-top: 15px;" align="left">
				<br> <br>
				<div>
					<img src="${uploadedFolder}${myMenuModel.menuEntity.image}">
					<input type="text" disabled="disabled" value="${myMenuModel.menuEntity.m_name}"/>		
				</div>
				<div>
					<label>My Menu NAME</label> <input type="text" name="mymenu_name" value="${myMenuModel.mymenu_name}"/>
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
		<button type="reset" onclick="goBack()">리스트 보기</button>
	</div>
	</div>

</body>
</html>