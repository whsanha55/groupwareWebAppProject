<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֻ��� �ڵ� ����</title>
</head>
<body>
<script type="text/javascript">

	$(document).ready(function() {
		 
		
		$('#close').click(function() {
			close();
		});
		
		
	
		/* $('#submit').click(function() {
			if(confirm("�Է��� �ڵ� ������ ����Ͻðڽ��ϱ�?") == true) {
				 $(opener.location).attr('href', '${pageContext.request.contextPath}/admin/listCode1.do');
				 self.close();
			} else {
				return;
			}
	
		}); */
		
		
	});
	</script>
	
	<div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">�ڵ� ����</h4>
	</div>

	<div class="modal-body">
		<div></div>
		
	<form action="<%=request.getContextPath() %>/admin/modifyCode.do" method="post" >
		<div class="modal-body">
			<table id="datatable" class="table table-striped table-bordered">
				<tbody>
					<input type="hidden" id="relationCode" name="relationCode" value="" >
					<tr>
						<th>�ڵ��ȣ</th>
						<td><input type="text" id="cNo" name="cNo" required="required"  value="${requestScope.code.cNo }"></td>
					</tr>
					<tr>
						<th>�ڵ��</th>
						<td><input type="text" id="cName" name="cName" required="required" value="${requestScope.code.cName }" ></td>
					</tr>
				</tbody>
			</table>
			<br>
			<div class="text-center">
				<button type="submit" id="submit">���</button>
				<a href="#" id="close">�ݱ�</a>
			</div>
		</div>
	</form>
	
</body>
</html>