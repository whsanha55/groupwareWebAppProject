<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>부서 코드 수정</title>
</head>
<body>
<script type="text/javascript">

	$(document).ready(function() {
		 
		
		$('#close').click(function() {
			close();
		});
		
		
	
		$('#button').on('click', function() {
			if(!confirm("입력한 코드 정보로 수정하시겠습니까?")) {
				return false;
			}
			console.log('cNo : ' + $('#cNo').val());
			console.log('cName : ' + $('#cName').val());
			console.log('relationCode : ' + $('#relationCode').val());
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/modifyCode2.do'
				,
				method : 'POST'
				,
				dataType : 'json'
				,
				data: $('#form').serialize()
				,
				success : function(data) {
					if(data == 1) {
						alert("코드가 수정되었습니다.")
						opener.location.reload();
						window.close();
					} else {
						alert("중복된 코드명입니다.")
					}
				}
				,
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
			});
		});
		
		
	});
	</script>
	
	<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">코드 수정</h4>
	</div>

	<div class="modal-body">
		<div></div>
		
	<form id="form" >
		<div class="modal-body">
			<table id="datatable" class="table table-striped table-bordered">
				<tbody>
					<input type="hidden" id="cNo" name="cNo" value="${param.cNo}">
					<input type="hidden" id="relationCode" name="relationCode" value="${requestScope.code.relationCode}" >
					<tr>
						<th>코드명</th>
						<td><input type="text" id="cName" name="cName" required="required" value="${requestScope.code.cName }" ></td>
					</tr>
				</tbody>
			</table>
			<br>
			<div class="text-center">
				<button type="button" id="button">수정</button>
				<a href="#" id="close">닫기</a>
			</div>
		</div>
	</form>
	
</body>
</html>