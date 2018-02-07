<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	
	/* �������� �ε���� ��ġ�� ������ ǥ���ϱ� ���� map walker �������� ��Ÿ�� */
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

	<div><input id="keyWord" placeholder="�����˻� ����Է�">	
		<button id="mapSearchBTN" type="button" class="btn btn-default">�˻�</button>
	</div>

	<div class="map_wrap">
	    <div id="mapWrapper" style="width:50%;height:300px;float:left">
	        <div id="map" style="width:400px;height:400px;"></div> <!-- ������ ǥ���� div �Դϴ� -->
	    </div>
	    <div id="rvWrapper" style="width:50%;height:300px;float:left">
	        <div id="roadview" style="width:100%;height:100%"></div> <!-- �ε�並 ǥ���� div �Դϴ� -->
	    </div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a4a3a00a16a7cd71ecd7bba0eca8ed4a&libraries=services"></script>
	<script>
	
	$(document).ready(function() {
		/* function MapWalker(position){

		    //Ŀ���� �������̿� ����� map walker ������Ʈ
		    var content = document.createElement('div');
		    var figure = document.createElement('div');
		    var angleBack = document.createElement('div');

		    //map walker�� �����ϴ� �� ������ class���� ���� - style������ ���� �ʿ�
		    content.className = 'MapWalker';
		    figure.className = 'figure';
		    angleBack.className = 'angleBack';

		    content.appendChild(angleBack);
		    content.appendChild(figure);

		    //Ŀ���� �������� ��ü�� ����Ͽ�, map walker �������� ����
		    var walker = new daum.maps.CustomOverlay({
		        position: position,
		        content: content,
		        yAnchor: 1
		    });
		
		    this.walker = walker;
		    this.content = content;
		}
		 */
		var mapWrapper = document.getElementById('mapWrapper'); //������ ���ΰ� �ִ� DIV�±�
			
		var container = document.getElementById('map'), //������ ���� ������ DOM ���۷���
			mapCenter = new daum.maps.LatLng(37.49952673450098, 127.0292843723033), //������ �߽���ǥ. 	
			options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
			center: mapCenter,
			level: 2 //������ ����(Ȯ��, ��� ����)
		};		
		var map = new daum.maps.Map(container, options); //���� ���� �� ��ü ����	
		/* 
		map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW); //���� ���� �ε�� ���� �ø���

		var rvContainer = document.getElementById('roadview'); //�ε�並 ǥ���� div
		var rv = new daum.maps.Roadview(rvContainer); //�ε�� ��ü
		var rvClient = new daum.maps.RoadviewClient(); //��ǥ�κ��� �ε�� �ĳ�ID�� ������ �ε�� helper��ü

		toggleRoadview(mapCenter); */

		
		// �Ϲ� ������ ��ī�̺�� ���� Ÿ���� ��ȯ�� �� �ִ� ����Ÿ�� ��Ʈ���� �����մϴ�
		var mapTypeControl = new daum.maps.MapTypeControl();
		
		// ���� Ÿ�� ��Ʈ���� ������ ǥ���մϴ�
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		
		// ���� Ȯ�� ��Ҹ� ������ �� �ִ�  �� ��Ʈ���� �����մϴ�
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		// ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
		var centerMarker = new daum.maps.Marker({ 
		    // ���� �߽���ǥ�� ��Ŀ�� �����մϴ� 
		    position: map.getCenter() 
		});
		
		// ������ ��Ŀ�� ǥ���մϴ�
		centerMarker.setMap(map);	
		
		var iwContent = '<div style="padding:5px;text-align:center;"><a href="http://map.daum.net/link/to/��پ�!,'+ map.getCenter().getLat()  +','+ map.getCenter().getLng() +'" style="color:red" target="_blank">��Ʈŷ��</a></div>',
			iwRemoveable = true;
		
		var infowindow = new daum.maps.InfoWindow({
			position : map.getCenter(),
			content : iwContent
		});
		
		infowindow.open(map, centerMarker);
		
		var marker = new daum.maps.Marker;
		
		marker.setMap(map);
		
		// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
		// ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�	
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
			// Ŭ���� ����, �浵 ������ �����ɴϴ� 
		    var latlng = mouseEvent.latLng; 
		    
			iwContent = '<div style="padding:5px;text-align:center;"><a href="http://map.daum.net/link/map/������,'+ latlng.getLat()  +','+ latlng.getLng() +'" style="color:black" target="_blank">ū��������</a><br><a href="http://map.daum.net/link/to/������,'+ latlng.getLat()  +','+ latlng.getLng() +'" style="color:blue" target="_blank">��ã��</a></div>',
			
			infowindow.close();
			
			// ���������츦 �����մϴ�
			infowindow = new daum.maps.InfoWindow({
			    content : iwContent,
			    removable : iwRemoveable
			});
			
			// ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
			marker.setPosition(latlng);
		   
			// ���� latlng.getLat() �浵 latlng.getLng()
		});	
		
		// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
		daum.maps.event.addListener(marker, 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow.open(map, marker);  
		});
		
		// ��� �˻� ��ü�� �����մϴ�
		var places = new daum.maps.services.Places();
	
		// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
		function placesSearchCB (data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {
			    // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
		        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
		        var bounds = new daum.maps.LatLngBounds();
			        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }     
				// �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
		        map.setBounds(bounds);
		    } 
		}
		
		// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(place) {
		   // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
		    var marker = new daum.maps.Marker({
		        map: map,
		        position: new daum.maps.LatLng(place.y, place.x) 
		    });
			// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
		    daum.maps.event.addListener(marker, 'click', function() {
		    // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
		        infowindow.setContent('<div style="text-align:center;padding:5px;font-size:12px;color:black;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		
		// ����Ű ������ ��ġ�˻� ���� �޼���
		$("#keyWord").keypress(function() {
		    if (event.which == 13) {
		    	$('#mapSearchBTN').trigger('click');
		    }
		});
	
		// ��ư Ŭ������ ��ġ�˻� ���� �޼���
		$("#mapSearchBTN").click(function() {
			// ���� �Է����� �ʾ��� �� �ȳ� ���â
			if ($('#keyWord').val() == ''){
				alert('��ġ�� �Է����ּ���. ex)��Ʈķ�� ����');
			};
			
			// Ű����� ��Ҹ� �˻��մϴ�
			places.keywordSearch($('#keyWord').val(), placesSearchCB);
		});
	});

	</script>
</body>
</html>