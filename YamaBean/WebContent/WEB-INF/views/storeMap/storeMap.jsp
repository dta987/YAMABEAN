<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>StoreMap</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>

	<div align="center">

		<br>
		<h1>StoreMap</h1>
		<hr width="500px">

		<div id="map" style="width: 750px; height: 350px;"></div>


		<script
			src="//apis.daum.net/maps/maps3.js?apikey=50ee14e477fa3049e3926fbe6cba0573&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450705, 126.570677), // 지도의 중심좌표
				level : 10, // 지도의 확대 레벨
				mapTypeId : daum.maps.MapTypeId.ROADMAP
			// 지도종류
			};
			// 지도를 생성한다 
			var map = new daum.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
		</script>
		<c:forEach var="store" items="${stores}">
			<script type="text/javascript">
				var geocoder = new daum.maps.services.Geocoder();

				geocoder
						.addr2coord(
								'${store.store_address}',
								function(status, result) {
									// 정상적으로 검색이 완료됐으면 
									if (status === daum.maps.services.Status.OK) {

										var coords = new daum.maps.LatLng(
												result.addr[0].lat,
												result.addr[0].lng);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new daum.maps.Marker({
											map : map,
											position : coords
										});

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);

										var content = '<div class="wrap">';
										+'    <div class="info">';
										+'        <div class="title">';
										+'            ${store.store_name}';
										+'            <div class="close" onclick="closeOverlay()" title="닫기"></div>';
										+'        </div>';
										+'        <div class="body">';
										+'            <div class="img">';
										+'                <img src="http://t1.daumcdn.net/thumb/C198x156/?fname=http://t1.daumcdn.net/local/review/27d42e540d15a42d99dd02e35f3bf4dc3aa88440c7f3e11b77e4f36754f06846" width="73" height="70">';
										+'           </div>';
										+'            <div class="desc">';
										+'                <div class="ellipsis">${store.store_address}</div>';
										+'                <div><a href="http://place.map.daum.net/26611597" target="_blank" class="link">홈페이지</a></div>';
										+'            </div>'
												+ '        </div>';
										+'    </div>' + '</div>';

										var customOverlay = new daum.maps.CustomOverlay(
												{
													content : content,
													map : map,
													position : marker.getPosition()
												});
										
										
										customOverlay.setMap(map);
									}

								});
			</script>
		</c:forEach>

		<script type="text/javascript">
			function closeOverlay() {
				overlay.setMap(null);
			}
		</script>

		<hr width="500px">
		<div>
			<a href="/YamaBean/storeMap/create">추가</a>
		</div>

		<hr width="500px">
		<div>
			<c:forEach var="store" items="${stores}">
				<fieldset>
					<div class="storeList">
						<input type="text" style="border: none;" name="name" id="name"
							value="${store.store_name}"> <br> <input type="text"
							style="border: none;" name="phone" id="phone"
							value="${store.store_phone}"> <br> <input
							type="text" style="border: none;" name="address" id="phone"
							value="${store.store_address}"> <br>
					</div>
				</fieldset>

			</c:forEach>
		</div>
	</div>

</body>
</html>