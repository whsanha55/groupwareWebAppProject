<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey= a4a3a00a16a7cd71ecd7bba0eca8ed4a"></script>
<script>
	var container = document.getElementById('map'); //������ ���� ������ DOM ���۷���
	var options = { //������ ������ �� �ʿ��� �⺻ �ɼ�
		center: new daum.maps.LatLng(33.450701, 126.570667), //������ �߽���ǥ.
		level: 3 //������ ����(Ȯ��, ��� ����)
	};
	
	var map = new daum.maps.Map(container, options); //���� ���� �� ��ü ����
</script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
</body>
</html>