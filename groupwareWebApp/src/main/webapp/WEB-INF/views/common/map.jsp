<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
map_wrap {overflow:hidden;height:330px}
   
    #container {overflow:hidden;height:500px;position:relative;}
	#mapWrapper {width:100%;height:500px;z-index:1;}
	#rvWrapper {width:100%;height:100%;top:0;right:0;position:absolute;z-index:0;}
	#container.view_roadview #mapWrapper {width: 33%;height: 33%;}
	#roadviewControl {position:absolute;top:5px;left:5px;width:65px;height:24px;padding:2px;z-index: 1;background: #f7f7f7;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;cursor: pointer;}
	#roadviewControl span {background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mapworker.png) no-repeat;  padding-left:23px;height:24px;font-size: 12px;display: inline-block;line-height: 2;font-weight: bold;}
	#roadviewControl.active {background: #ccc;box-shadow: 0px 1px #5F616D;border: 1px solid #7F818A;}
	#roadviewControl.active span {background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mapworker_on.png) no-repeat;color: #4C4E57;}
	#roadviewClose {position: absolute;padding: 4px;bottom: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
	#roadviewClose .img {display: block;background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}
	#keyWord {height: 34px; width: 250px;}
	#mapSearchBTN {height: 35px;}

</style>
</head>
<body>

	<div>
		<input id="keyWord" placeholder="지도검색 장소입력">	
		<button id="mapSearchBTN" type="button" class="btn btn-default">검색</button>
		<a href="#" id="relayout" style="color:white;">'</a>
	</div>

	<div id="container">	
	    <div id="rvWrapper">
	        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
	        <div id="roadviewClose" title="로드뷰닫기"><span class="img"></span></div>
	    </div>
	    <div id="mapWrapper">
	        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
	        <div id="roadviewControl"><span>로드뷰</span></div>
	    </div>
	</div>

		
	<script>
	var selectedDest;//목적지
	var selectedLat;//위
	var selectedLng;//경도도

	$(document).ready(function() {

		daum.maps.load(function() {
			//지도위에 현재 로드뷰의 위치와, 각도를 표시하기 위한 map walker 아이콘 생성 클래스
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

			//로드뷰의 pan(좌우 각도)값에 따라 map walker의 백그라운드 이미지를 변경 시키는 함수
			//background로 사용할 sprite 이미지에 따라 계산 식은 달라 질 수 있음
			MapWalker.prototype.setAngle = function(angle){

			    var threshold = 22.5; //이미지가 변화되어야 되는(각도가 변해야되는) 임계 값
			    for(var i=0; i<16; i++){ //각도에 따라 변화되는 앵글 이미지의 수가 16개
			        if(angle > (threshold * i) && angle < (threshold * (i + 1))){
			            //각도(pan)에 따라 아이콘의 class명을 변경
			            var className = 'm' + i;
			            this.content.className = this.content.className.split(' ')[0];
			            this.content.className += (' ' + className);
			            break;
			        }
			    }
			};

			//map walker의 위치를 변경시키는 함수
			MapWalker.prototype.setPosition = function(position){
			    this.walker.setPosition(position);
			};

			//map walker를 지도위에 올리는 함수
			MapWalker.prototype.setMap = function(map){
			    this.walker.setMap(map);
			};
			 */
			
			var overlayOn = false,
				container = document.getElementById('container'),
				mapWrapper = document.getElementById('mapWrapper'), //지도를 감싸고 있는 DIV태그
				mapContainer = document.getElementById('map'), //지도를 담을 영역의 DOM 레퍼런스
				rvContainer = document.getElementById('roadview');
			 
			if($('#latitude').val() == "" && $('#longitude').val() == "") {		
				var	mapCenter = new daum.maps.LatLng(37.49952673450098, 127.0292843723033); //지도의 중심좌표. 	
			} else {
				var mapCenter = new daum.maps.LatLng($('#latitude').val(), $('#longitude').val());
			}
				mapOptions = { //지도를 생성할 때 필요한 기본 옵션
					center: mapCenter, //지도의 중심좌표.
					level: 3 //지도의 레벨(확대, 축소 정도)
				};
			
			var map = new daum.maps.Map(mapContainer, mapOptions);
			
			map.relayout();
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new daum.maps.MapTypeControl();
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
			
			// 로드뷰 객체를 생성합니다 
			var rv = new daum.maps.Roadview(rvContainer); 
	
			// 좌표로부터 로드뷰 파노라마 ID를 가져올 로드뷰 클라이언트 객체를 생성합니다 
			var rvClient = new daum.maps.RoadviewClient();
				
			// 로드뷰에 좌표가 바뀌었을 때 발생하는 이벤트를 등록합니다 
			daum.maps.event.addListener(rv, 'position_changed', function() {
	
				// 현재 로드뷰의 위치 좌표를 얻어옵니다 
				var rvPosition = rv.getPosition();
		
				// 지도의 중심을 현재 로드뷰의 위치로 설정합니다
				map.setCenter(rvPosition);
		
				// 지도 위에 로드뷰 도로 오버레이가 추가된 상태이면
				if(overlayOn) {
					// 마커의 위치를 현재 로드뷰의 위치로 설정합니다
					marker.setPosition(rvPosition);
				}
			});
				
			// 마커 이미지를 생성합니다
			var markImage = new daum.maps.MarkerImage(
			    'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/roadview_wk.png',
			    new daum.maps.Size(35,39), {
			    //마커의 좌표에 해당하는 이미지의 위치를 설정합니다.
			    //이미지의 모양에 따라 값은 다를 수 있으나, 보통 width/2, height를 주면 좌표에 이미지의 하단 중앙이 올라가게 됩니다.
			    offset: new daum.maps.Point(14, 39)
			});

			// 드래그가 가능한 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    image : markImage,
			    position: mapCenter,
			    draggable: true
			});

			// 마커에 dragend 이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'dragend', function(mouseEvent) {
	
				// 현재 마커가 놓인 자리의 좌표입니다 
			    var position = marker.getPosition();
	
			    // 마커가 놓인 위치를 기준으로 로드뷰를 설정합니다
			    toggleRoadview(position);
			});

			//지도에 클릭 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent){
				    
			    // 지도 위에 로드뷰 도로 오버레이가 추가된 상태가 아니면 클릭이벤트를 무시합니다 
			    if(!overlayOn) {
			        return;
			    }
			    
			    // 클릭한 위치의 좌표입니다 
			    var position = mouseEvent.latLng;

			    // 마커를 클릭한 위치로 옮깁니다
			    marker.setPosition(position);

			    // 클락한 위치를 기준으로 로드뷰를 설정합니다
			    toggleRoadview(position);
			});
			
			// 전달받은 좌표(position)에 가까운 로드뷰의 파노라마 ID를 추출하여
			// 로드뷰를 설정하는 함수입니다
			function toggleRoadview(position){
			    rvClient.getNearestPanoId(position, 50, function(panoId) {
			        // 파노라마 ID가 null 이면 로드뷰를 숨깁니다
			        if (panoId === null) {
			            toggleMapWrapper(true, position);
			        } else {
			         toggleMapWrapper(false, position);

			            // panoId로 로드뷰를 설정합니다
			            rv.setPanoId(panoId, position);
			        }
			    });
			}

			// 지도를 감싸고 있는 div의 크기를 조정하는 함수입니다
			function toggleMapWrapper(active, position) {
			    if (active) {

			        // 지도를 감싸고 있는 div의 너비가 100%가 되도록 class를 변경합니다 
			        container.className = '';

			        // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
			        map.relayout();

			        // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
			        map.setCenter(position);
			    } else {

			        // 지도만 보여지고 있는 상태이면 지도의 너비가 50%가 되도록 class를 변경하여
			        // 로드뷰가 함께 표시되게 합니다
			        if (container.className.indexOf('view_roadview') === -1) {
			            container.className = 'view_roadview';

			            // 지도의 크기가 변경되었기 때문에 relayout 함수를 호출합니다
			            map.relayout();

			            // 지도의 너비가 변경될 때 지도중심을 입력받은 위치(position)로 설정합니다
			            map.setCenter(position);
			        }
			    }
			}

			// 지도 위의 로드뷰 도로 오버레이를 추가,제거하는 함수입니다
			function toggleOverlay(active) {
			    if (active) {
			        overlayOn = true;

			        // 지도 위에 로드뷰 도로 오버레이를 추가합니다
			        map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);

			        // 지도 위에 마커를 표시합니다
			        marker.setMap(map);

			        // 마커의 위치를 지도 중심으로 설정합니다 
			        marker.setPosition(map.getCenter());

			        // 로드뷰의 위치를 지도 중심으로 설정합니다
			        toggleRoadview(map.getCenter());
			    } else {
			        overlayOn = false;

			        // 지도 위의 로드뷰 도로 오버레이를 제거합니다
			        map.removeOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);

			        // 지도 위의 마커를 제거합니다
			        marker.setMap(null);
			    }
			}

			// 지도 위의 로드뷰 버튼을 눌렀을 때 호출되는 함수입니다
			function setRoadviewRoad() {
			    var control = document.getElementById('roadviewControl');

			    // 버튼이 눌린 상태가 아니면
			    if (control.className.indexOf('active') === -1) {
			        control.className = 'active';

			        // 로드뷰 도로 오버레이가 보이게 합니다
			        toggleOverlay(true);
			    } else {
			        control.className = '';

			        // 로드뷰 도로 오버레이를 제거합니다
			        toggleOverlay(false);
			    }
			}

			// 로드뷰에서 X버튼을 눌렀을 때 로드뷰를 지도 뒤로 숨기는 함수입니다
			function closeRoadview() {
			    var position = marker.getPosition();
			    toggleMapWrapper(true, position);
			}	
			
			if($('#destination').val() == "") {
				var iwContent = '<div style="padding:5px;text-align:center;color:red">갓트킹프</div>';
			} else {
				var iwContent = '<div style="padding:5px;text-align:center;color:red">'+ $('#destination').val() +'</div>';
			}
			var iwRemoveable = true;
				
			var infowindow = new daum.maps.InfoWindow({
				position : map.getCenter(),
				content : iwContent
			});
				
			infowindow.open(map, centerMarker);
				
			var myMarker = new daum.maps.Marker;
				
			myMarker.setMap(map);
				 
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
				myMarker.setPosition(latlng);
				selectedDest = '목적지';//목적지
				selectedLat = latlng.getLat();//위
				selectedLng = latlng.getLng();//경도도
				// 위도 latlng.getLat() 경도 latlng.getLng()
			});	
				
			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(myMarker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
				infowindow.open(map, myMarker);  
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
				    infowindow.setContent('<div style="text-align:center;padding:5px;font-size:12px;color:black;"><a href="http://map.daum.net/link/to/목적지,'+ place.y  +','+ place.x +'"style="color:blue" target="_blank">' + place.place_name + '</a></div>');
				    infowindow.open(map, marker);
				    selectedDest = place.place_name;
				    selectedLat = place.y;
				    selectedLng = place.x;
				});
			}
			
			function relayout() {
				map.relayout();
				map.panTo(mapCenter);
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
					swal("장소를 입력해주세요.","ex)비트캠프 강남","info");
				};
					
				// 키워드로 장소를 검색합니다
				places.keywordSearch($('#keyWord').val(), placesSearchCB);
				myMarker.setMap(null);
			});
			
			$('#relayout').on('click', function() {
				relayout();
			});
		
			$('#roadviewControl').on('click',function() {
				 setRoadviewRoad();
			});
			
			$('#roadviewClose').on('click', function() {
				$('#roadviewControl').attr('class', "");
				toggleOverlay(false);
				closeRoadview();
			});
			$('#layerpop2').on('shown.bs.modal', function() {
				relayout();
			});
		});
	});

	</script>
</body>
</html>