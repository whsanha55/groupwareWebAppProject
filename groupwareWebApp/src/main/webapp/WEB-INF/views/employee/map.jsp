<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	
	/* 지도위에 로드뷰의 위치와 각도를 표시하기 위한 map walker 아이콘의 스타일 */
    .MapWalker {position:absolute;margin:-26px 0 0 -51px}
    .MapWalker .figure {position:absolute;width:25px;left:38px;top:-2px;
        height:39px;background:url(http://t1.daumcdn.net/localimg/localimages/07/2012/roadview/roadview_minimap_wk.png) -298px -114px no-repeat}
    .MapWalker .angleBack {width:102px;height:52px;background: url(http://t1.daumcdn.net/localimg/localimages/07/2012/roadview/roadview_minimap_wk.png) -834px -2px no-repeat;}
    .MapWalker.m0 .figure {background-position: -298px -114px;}
    .MapWalker.m1 .figure {background-position: -335px -114px;}
    .MapWalker.m2 .figure {background-position: -372px -114px;}
    .MapWalker.m3 .figure {background-position: -409px -114px;}
    .MapWalker.m4 .figure {background-position: -446px -114px;}
    .MapWalker.m5 .figure {background-position: -483px -114px;}
    .MapWalker.m6 .figure {background-position: -520px -114px;}
    .MapWalker.m7 .figure {background-position: -557px -114px;}
    .MapWalker.m8 .figure {background-position: -2px -114px;}
    .MapWalker.m9 .figure {background-position: -39px -114px;}
    .MapWalker.m10 .figure {background-position: -76px -114px;}
    .MapWalker.m11 .figure {background-position: -113px -114px;}
    .MapWalker.m12 .figure {background-position: -150px -114px;}
    .MapWalker.m13 .figure {background-position: -187px -114px;}
    .MapWalker.m14 .figure {background-position: -224px -114px;}
    .MapWalker.m15 .figure {background-position: -261px -114px;}
    .MapWalker.m0 .angleBack {background-position: -834px -2px;}
    .MapWalker.m1 .angleBack {background-position: -938px -2px;}
    .MapWalker.m2 .angleBack {background-position: -1042px -2px;}
    .MapWalker.m3 .angleBack {background-position: -1146px -2px;}
    .MapWalker.m4 .angleBack {background-position: -1250px -2px;}
    .MapWalker.m5 .angleBack {background-position: -1354px -2px;}
    .MapWalker.m6 .angleBack {background-position: -1458px -2px;}
    .MapWalker.m7 .angleBack {background-position: -1562px -2px;}
    .MapWalker.m8 .angleBack {background-position: -2px -2px;}
    .MapWalker.m9 .angleBack {background-position: -106px -2px;}
    .MapWalker.m10 .angleBack {background-position: -210px -2px;}
    .MapWalker.m11 .angleBack {background-position: -314px -2px;}
    .MapWalker.m12 .angleBack {background-position: -418px -2px;}
    .MapWalker.m13 .angleBack {background-position: -522px -2px;}
    .MapWalker.m14 .angleBack {background-position: -626px -2px;}
    .MapWalker.m15 .angleBack {background-position: -730px -2px;}
</style>
</head>
<body>

	<div><input id="keyWord" placeholder="지도검색 장소입력">	
		<button id="mapSearchBTN" type="button" class="btn btn-default">검색</button>
	</div>

	<div class="map_wrap">
	    <div id="mapWrapper" style="width:50%;height:300px;float:left">
	        <div id="map" style="width:400px;height:400px;"></div> <!-- 지도를 표시할 div 입니다 -->
	    </div>
	    <div id="rvWrapper" style="width:50%;height:300px;float:left">
	        <div id="roadview" style="width:100%;height:100%"></div> <!-- 로드뷰를 표시할 div 입니다 -->
	    </div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4a3a00a16a7cd71ecd7bba0eca8ed4a&libraries=services"></script>
	<script>
	
	$(document).ready(function() {
		/* function MapWalker(position){

		    //커스텀 오버레이에 사용할 map walker 엘리먼트
		    var content = document.createElement('div');
		    var figure = document.createElement('div');
		    var angleBack = document.createElement('div');

		    //map walker를 구성하는 각 노드들의 class명을 지정 - style셋팅을 위해 필요
		    content.className = 'MapWalker';
		    figure.className = 'figure';
		    angleBack.className = 'angleBack';

		    content.appendChild(angleBack);
		    content.appendChild(figure);

		    //커스텀 오버레이 객체를 사용하여, map walker 아이콘을 생성
		    var walker = new daum.maps.CustomOverlay({
		        position: position,
		        content: content,
		        yAnchor: 1
		    });
		
		    this.walker = walker;
		    this.content = content;
		}
		 */
		var mapWrapper = document.getElementById('mapWrapper'); //지도를 감싸고 있는 DIV태그
			
		var container = document.getElementById('map'), //지도를 담을 영역의 DOM 레퍼런스
			mapCenter = new daum.maps.LatLng(37.49952673450098, 127.0292843723033), //지도의 중심좌표. 	
			options = { //지도를 생성할 때 필요한 기본 옵션
			center: mapCenter,
			level: 2 //지도의 레벨(확대, 축소 정도)
		};		
		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴	
		/* 
		map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW); //지도 위에 로드뷰 도로 올리기

		var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		var rv = new daum.maps.Roadview(rvContainer); //로드뷰 객체
		var rvClient = new daum.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

		toggleRoadview(mapCenter); */

		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();
		
		// 지도 타입 컨트롤을 지도에 표시합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var centerMarker = new daum.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		});
		
		// 지도에 마커를 표시합니다
		centerMarker.setMap(map);	
		
		var iwContent = '<div style="padding:5px;text-align:center;"><a href="http://map.daum.net/link/to/출바알!,'+ map.getCenter().getLat()  +','+ map.getCenter().getLng() +'" style="color:red" target="_blank">갓트킹프</a></div>',
			iwRemoveable = true;
		
		var infowindow = new daum.maps.InfoWindow({
			position : map.getCenter(),
			content : iwContent
		});
		
		infowindow.open(map, centerMarker);
		
		var marker = new daum.maps.Marker;
		
		marker.setMap(map);
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다	
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			// 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
			iwContent = '<div style="padding:5px;text-align:center;"><a href="http://map.daum.net/link/map/목적지,'+ latlng.getLat()  +','+ latlng.getLng() +'" style="color:black" target="_blank">큰지도보기</a><br><a href="http://map.daum.net/link/to/목적지,'+ latlng.getLat()  +','+ latlng.getLng() +'" style="color:blue" target="_blank">길찾기</a></div>',
			
			infowindow.close();
			
			// 인포윈도우를 생성합니다
			infowindow = new daum.maps.InfoWindow({
			    content : iwContent,
			    removable : iwRemoveable
			});
			
			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);
		   
			// 위도 latlng.getLat() 경도 latlng.getLng()
		});	
		
		// 마커에 클릭이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow.open(map, marker);  
		});
		
		// 장소 검색 객체를 생성합니다
		var places = new daum.maps.services.Places();
	
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {
			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new daum.maps.LatLngBounds();
			        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }     
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		   // 마커를 생성하고 지도에 표시합니다
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: new daum.maps.LatLng(place.y, place.x) 
		    });
			// 마커에 클릭이벤트를 등록합니다
		    daum.maps.event.addListener(marker, 'click', function() {
		    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="text-align:center;padding:5px;font-size:12px;color:black;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		
		// 엔터키 누르면 위치검색 가능 메서드
		$("#keyWord").keypress(function() {
		    if (event.which == 13) {
		    	$('#mapSearchBTN').trigger('click');
		    }
		});
	
		// 버튼 클릭으로 위치검색 가능 메서드
		$("#mapSearchBTN").click(function() {
			// 값을 입력하지 않았을 때 안내 경고창
			if ($('#keyWord').val() == ''){
				alert('위치를 입력해주세요. ex)비트캠프 강남');
			};
			
			// 키워드로 장소를 검색합니다
			places.keywordSearch($('#keyWord').val(), placesSearchCB);
		});
	});

	</script>
</body>
</html>