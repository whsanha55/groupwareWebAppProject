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
		
		
	
		/* $('#submit').click(function() {
			if(confirm("입력한 코드 정보를 등록하시겠습니까?") == true) {
				 $(opener.location).attr('href', '${pageContext.request.contextPath}/admin/listCode1.do');
				 self.close();
			} else {
				return;
			}
	
		}); */
		
		
	});
	</script>
	
	<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">코드 수정</h4>
	</div>

	<div class="modal-body">
		<div></div>
		
	<form action="${pageContext.request.contextPath }/admin/modifyCode2.do" method="post" >
		<div class="modal-body">
			<table id="datatable" class="table table-striped table-bordered">
				<tbody>
					<input type="hidden" id="cNo" name="cNo" value="${param.cNo}">
					<input type="hidden" id="relationCode" name="relationCode" value="${param.relationCode}" >
					<tr>
						<th>코드명</th>
						<td><input type="text" id="cName" name="cName" required="required" value="${requestScope.code.cName }" ></td>
					</tr>
				</tbody>
			</table>
			<br>
			<div class="text-center">
				<button type="submit" id="submit">수정</button>
				<a href="#" id="close">닫기</a>
			</div>
		</div>
	</form>
	
</body>
</html>