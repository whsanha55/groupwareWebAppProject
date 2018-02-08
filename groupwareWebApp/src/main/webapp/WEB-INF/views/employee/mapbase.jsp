<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script>
	$(document).ready(function() {
		$('#searchMap').click(function() {
			$('#mapBody').load('${pageContext.request.contextPath}/admin/map.do');
			$('#layerpop2').modal({
				backdrop : 'static',
				keyboard : false
			});
		});
		
		$('#modalCloseBtn2').on('click',function() {
			$('#mapBody').html("");
		});
	});
	</script>
</head>
<body>

<button class="btn btn-primary" id='searchMap' type="button">관리</button>

<!-- 모달 팝업 -->
	<div class="modal fade" id="layerpop2">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
							
				<div class="modal-body" id="mapBody"></div>
							
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalCloseBtn2"
							data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>