<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>최상위 코드 등록</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script type="text/javascript">

	$(document).ready(function() {
		 
		$('#close').click(function() {
			close();
		});
		
		
		$('.registerBtn').on('click', function() {
			event.preventDefault();
			swal({
				  title: "코드 등록",
				  text: "코드를 등록합니다. 계속 진행하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						registerCode();
					}	
				});			
		});
			
			
			function registerCode() {	
				
				var cNo = $('#cNo').val();
				var cName = $('#cName').val();
				var relationCode = $('#relationCode').val();
				
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/registerCode1.do'
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
								  title: "등록 완료",
								  text: "코드가 등록되었습니다.",
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
								  title: "등록 실패",
								  text: "중복된 코드번호나 코드명입니다.",
								  icon: "info",
								  buttons : "확인" 
							})
						}
					}
					, 
					error: function(jqXHR, textStatus, error) {
						swal({
							  title: "등록 실패",
							  text: "정보를 모두 입력해주세요.",
							  icon: "info",
							  buttons : "확인" 
						})
					}	 				
				});	
			}
		
	
		/* $('#button').click(function() {
			if(confirm("입력한 코드 정보를 등록하시겠습니까?") == true) {
				$('#form').submit();
			} else {
				return false;
			}
		}); */
	});
	</script>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel" style="height: 350px;">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">코드 등록</h4>
			</div>

			<div class="modal-body">
				<div></div>

				<form id="form">
					<div class="modal-body">
						<table id="datatable" class="table table-striped table-bordered">
							<tbody>
								<input type="hidden" id="relationCode" name="relationCode"
									value="">
								<tr>
									<th>코드번호</th>
									<td><input type="text" id="cNo" name="cNo"
										required="required"></td>
								</tr>
								<tr>
									<th>코드명</th>
									<td><input type="text" id="cName" name="cName"
										required="required"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="text-center">
							<button type="button" class="btn btn-success registerBtn">등록</button>
							<a href="#" id="close"><button type="button"
									class="btn btn-primary">닫기</button></a>
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>