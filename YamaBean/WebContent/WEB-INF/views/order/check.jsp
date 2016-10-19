<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="container-fluid" style="margin-top: 100px;">
		<div class="row content">

			<div class="col-sm-12 col-sm-offset-4">
				<div class="w3-third w3-margin-bottom ">
					<ul class="w3-ul w3-border w3-center w3-hover-shadow">
						<li class="w3-black">
							<p class="w3-xlarge">주문내역</p> <span class="w3-opacity">이용해
								주셔서 감사합니다.</span>
						</li>
						<li class="w3-padding-16"><b>주문자</b>
							${orderCheckModel.member_id}(${sessionScope.loginInfo.name})</li>
						<li class="w3-padding-16"><b>수령매장</b>
							${orderCheckModel.store.store_name}</li>
						<li class="w3-padding-16"><b>결제수단</b>
							${orderCheckModel.payment}</li>
						<li class="w3-padding-16"><b>포인트(사용/발생/현재)</b><br>${orderCheckModel.usePoint}
							/ ${orderCheckModel.addPoint} / ${orderCheckModel.point}</li>
						<li class="w3-padding-16">
							<h2 class="w3-wide">${orderCheckModel.totalprice}원</h2> <span
							class="w3-opacity">결재금액</span>
						</li>
						<li class="w3-padding-16"><b>주문시 바로 음료를 준비합니다. 주문 후 빠른시간에
								수령해가세요</b></li>
						<li class="w3-light-grey w3-padding-24">
							<button class="w3-btn w3-green w3-padding-large"
								onclick="location.href='${pageContext.request.contextPath}/menu/listMenu'">OK</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>