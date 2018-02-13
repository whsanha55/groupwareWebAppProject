<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>서명등록</title>
<script>

	$(document).ready(function() {
		$('#modifyBtn').click(function() {
			$.ajax ({
				url:'${pageContext.request.contextPath}/removeSign.do',
				method:'POST',
				dataType:'json',
				success:function(data) {
					if(data=="삭제완료"){
						location.href="${pageContext.request.contextPath}/retrieveSign.do"
					}
				},
				error:function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>서명조회</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">서명 </label>
						<div class="form-group" id="img_wrap">
							<%-- <i class="fa fa-picture-o"> --%>
							<img id="img" width="250px" height="250px" 
									src="${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/${requestScope.signName}"
									class="img-responsive"/>
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button id="modifyBtn" type="button" class="btn btn-success">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>