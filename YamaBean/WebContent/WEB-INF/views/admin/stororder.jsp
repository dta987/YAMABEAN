<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript">

$(function() {
	$("#mode").change(function() {
		if($("#mode").val() == "sub_day") {
			$("#sub_day").removeAttr("disabled");
			$("#sub_day").removeAttr("style");
			$("#textkeyword").attr("disabled", "disabled");
			$("#textkeyword").attr("style", "display: none;");
		} else {
			$("#sub_day").attr("disabled", "disabled");
			$("#sub_day").attr("style" ,"display: none;");
			$("#textkeyword").removeAttr("disabled");
			$("#textkeyword").removeAttr("style");
			
		}
	})
})
	$(document).ready(
			function() {
				var clareCalendar = {

					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					weekHeader : 'Wk',
					dateFormat : 'yymmdd', //형식(20120303)
					autoSize : false, //오토리사이즈(body등 상위태그의 설정에 따른다)
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
					yearRange : '1900:2020' //1990년부터 2020년까지
				};
				$("#sub_day").datepicker(clareCalendar);
				
				$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
			});
</script>
</head>
<body>
	<div class="container-fluid" style="margin-top: 50px;">
		<div class="row content">

			<div class="col-sm-2 sidenav" align="center">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="${pageContext.request.contextPath}/admin/page">HOME</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/menu">메뉴관리</a></li>
					<li>---- 매장 ----</li>
				</ul>
				<ul class="nav nav-pills nav-stacked">
					<c:forEach var="store" items="${StoreList}">
						<li><a
							href="${pageContext.request.contextPath}/admin/order?store=${store.store_num}">${store.store_name}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="w3-row">
				<div class="col-sm-9">
					<c:forEach var="order" items="${orderList}">
						<div class="w3-third w3-margin-bottom col-sm-4">
							<ul class="w3-ul w3-border w3-center w3-hover-shadow">
								<li class="w3-black">
									<p class="w3-xlarge">${order.member.nickname}</p>(${order.member.id}) <span
									class="w3-opacity">${order.sub_day}</span>
								</li>
								<div style="height: 200px; overflow: auto;">
									<c:forEach var="orderProduct" items="${order.orderProduct}">
										<li class="w3-padding-16"><b>${orderProduct.m_name}</b>
											${orderProduct.order_p_qty} 개</li>
									</c:forEach>
								</div>
								<li class="w3-padding-16">
									<h2 class="w3-wide">${order.totalprice}원</h2>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>
				<table align="center">
					<tr>
						<td colspan="10" align="center">
							<form class="form-inline" role="form" name="myform"
								action="${pageContext.request.contextPath}/admin/stororder"
								method="get">
								<input type="hidden" name="store_num" value="${store_num}">
								<div class="form-group">
									<select class="form-control" name="mode" id="mode">
										<option value="-" selected="selected">--- 선택하세요 ---
										<option value="member_id">ID
										<option value="sub_day">날짜로 검색
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control btn-xs" name="keyword"
										id="textkeyword" placeholder="검색 키워드"> <input
										type="text" class="form-control btn-xs" name="keyword"
										id="sub_day" placeholder="날짜 선택" readonly="readonly" style="display: none;" disabled="disabled">
								</div>
								<button id="search"
									class="w3-btn w3-white w3-border w3-round-large" type="submit">SEARCH</button>
								<button class="w3-btn w3-white w3-border w3-round-large"
									type="button" id="searchAll"
									onclick="location.href='${pageContext.request.contextPath}/admin/stororder?store_num=${store_num}'">ALL</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</form>
						</td>
					</tr>
				</table>
				<div class="w3-container" align="center">
					<ul class="w3-pagination">
						<li><a href="#">&laquo;</a></li>
						<c:forEach begin="${beginPage}" end="${endPage}" step="1"
							var="page" varStatus="pageing">
							<li><a
								href="${pageContext.request.contextPath}/board/stororder?selectPage=${pageing.index}&store_num=${store_num}">${pageing.index}</a></li>
						</c:forEach>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>

			</div>

		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#search").click(
							
							function() {
								if ($("#mode").val() != "-") {
										return true;
								} else {
									alert("검색 모드를 선택해주세요");
									return false;
								}
							});
				});
	</script>
</body>
</html>