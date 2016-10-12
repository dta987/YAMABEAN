<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/rvTOP.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>
	<div class="w3-main"
		style="margin-left: 20%; margin-right: 20%; margin-top: 100px;">

		<div>
			<h1>
				<b>${menuModel.m_name}</b>
			</h1>
		</div>



		<div class="w3-row w3-marginv">
			<div class="w3-third">
				<img src="<%=uploadedFolder%>${menuModel.image_name}"
					style="width: 100%; min-height: 100%">
			</div>
			<div class="w3-twothird w3-container w3-margin-bottom" align="left">
				<h4>${menuModel.m_name}</h4>
				<hr style="color: black;">
			</div>
			<div class="w3-twothird w3-container" align="left">
				<p>${menuModel.content}</p>
			</div>

		</div>
		<!-- <div class="w3-row w3-margin">
		<button type="reset" onclick="goBack()">리스트 보기</button>
		</div> -->
	</div>
</body>
</html>
