<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>부서 코드 등록</title>
</head>
<body>
<script type="text/javascript">

	$(document).ready(function() {
		 
		
		$('#close').click(function() {
			close();
		});
		
		
	
		$('#button').on('click', function() {
			if(!confirm("입력한 코드 정보를 등록하시겠습니까?")) {
				return false;
			}
			console.log('cNo : ' + $('#cNo').val());
			console.log('cName : ' + $('#cName').val());
			console.log('relationCode : ' + $('#relationCode').val());
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/registerCode2.do'
				,
				method : 'POST'
				,
				dataType : 'json'
				,
				data: $('#form').serialize()
				,
				success : function(data) {
					if(data == 1) {
						alert("코드가 등록되었습니다.")
						opener.location.reload();
						window.close();
					} else {
						alert("중복된 코드번호나 코드명입니다.")
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
		<h4 class="modal-title" id="myModalLabel">코드 등록</h4>
	</div>

	<div class="modal-body">
		<div></div>
		
	<form id="form" >
		<div class="modal-body">
			<table id="datatable" class="table table-striped table-bordered">
				<tbody>
					<tr>
						<th>상위코드</th>
						<td><input type="text" id="relationCode" name="relationCode" value="${param.relationCode}" readonly >
						</td>
					</tr>
					<tr>
						<th>코드번호</th>
						<td><input type="text" id="cNo" name="cNo" required="required" value="${param.relationCode}-" ></td>
					</tr>
					<tr>
						<th>코드명</th>
						<td><input type="text" id="cName" name="cName" required="required" ></td>
					</tr>
				</tbody>
			</table>
			<br>
			<div class="text-center">
				<button type="button" id="button">등록</button>
				<a href="#" id="close">닫기</a>
			</div>
		</div>
	</form>
	
</body>
</html>