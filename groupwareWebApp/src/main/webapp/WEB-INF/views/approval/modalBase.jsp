<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.modal-dialog.modal-cSize {
		width: 350px;
		height : auto;
	}
</style>
<script>
	$(document).ready(function() {
		//결재선 관리 이벤트
		$('#modalChart').on('click',function() {
			$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
			$('#layerpop').modal({
				backdrop: 'static', 
				keyboard: false
			});
		});
		
		$('#modalCloseBtn').on('click',function() {
			$('#chartBody').html("");
			 
		});
		
	});
</script>
<body>
	<button class="btn btn-primary" id='modalChart' type="button">관리</button>
	
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
			
				<div class="modal-body" id="chartBody"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalCloseBtn"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>