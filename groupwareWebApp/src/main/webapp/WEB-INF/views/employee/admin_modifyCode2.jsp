<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>부서 코드 수정</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script type="text/javascript">

	$(document).ready(function() {
		 
		
		$('#close').click(function() {
			close();
		});
		
		
	
		$('.modifyBtn').on('click', function() {
			event.preventDefault();
			swal({
				  title: "코드 수정",
				  text: "코드를 수정합니다. 계속 진행하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						modifyCode();
					}	
				});			
		});
			
			
			function modifyCode() {	
				
				var cNo = $('#cNo').val();
				var cName = $('#cName').val();
				var relationCode = $('#relationCode').val();
				
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/modifyCode2.do'
					,
					method: 'POST'
					,
					data: {
						cNo: cNo,
						cName: cName,
						relationCode: relationCode
					}
					, 
					dataType:'json'
					,
					success: function(data) {
						if(data == 1) {
							swal({
								  title: "수정 완료",
								  text: "코드가 수정되었습니다.",
								  icon: "info",
								  buttons : "확인" 
							}).then((e) => {
								if(e) {
									opener.location.reload();
									window.close();
								}
							});		
						} else {
							swal({
								  title: "수정 실패",
								  text: "중복된 코드번호나 코드명입니다.",
								  icon: "info",
								  buttons : "확인" 
							})
						}
					}
					, 
					error: function(jqXHR, textStatus, error) {
						alert("Error : " + jqXHR.status + "," + error);
					}	 				
				});	
			}
		
		
	});
	</script>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel" style="height: 350px;">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">코드 수정</h4>
			</div>

			<div class="modal-body">
				<div></div>

				<form id="form">
					<div class="modal-body">
						<table id="datatable" class="table table-striped table-bordered">
							<tbody>
								<input type="hidden" id="cNo" name="cNo" value="${param.cNo}">
								<input type="hidden" id="relationCode" name="relationCode"
									value="${requestScope.code.relationCode}">
								<tr>
									<th>코드명</th>
									<td><input type="text" id="cName" name="cName"
										required="required" value="${requestScope.code.cName }"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="text-center">
							<button type="button" class="btn btn-success modifyBtn">수정</button>
							<a href="#" id="close"><button type="button"
									class="btn btn-primary">닫기</button></a>
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>