<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 보관함</title>


<style>
.x_panel {
	min-height: 570px;
}

table td:first-child {
	width : 130px;
}
</style>

<script>

	$(document).ready(function(){
		
		$('#button1').on('click',function(){
			window.close();
			
		});
		
		 
	});

	


</script>

</head>

<body>

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
			  <c:if test="${requestScope.isSender==1 }">
				<h2>받은 쪽지</h2>
			   </c:if>
			   <c:if test="${requestScope.isSender==0 }">
				<h2>보낸 쪽지</h2>
			   </c:if>
				<div class="clearfix"></div>
			</div>
			<div class="table-responsive" id="datas">
			
				<form id="form">
				
					<table class="table table-striped jambo_table bulk_action">
								
						<tbody>
	
							<tr>
								<td style="font-weight:bolder;">보낸 사람</td>
								<td id="${requestScope.message.receipientEmployee.empNo }">${requestScope.message.senderEmployee.empName }</td>
								<td></td>
								<td></td>
							
							</tr>
	
							<tr>
								<td style="font-weight:bolder;">제목</td>
								<td >${requestScope.message.msgTitle }</td>
								<td></td>
								<td></td>
	
							</tr>
	
							<tr height="100">
								<td style="font-weight:bolder;">내용</td>
								<td colspan="3" id="textArea">${requestScope.message.msgContent }</td>
								
							</tr>						
							
						</tbody>				
							
					</table>
					
														
			
			<div class="buttons text-center" id="buttons">
						<button type="button" id="button1" class="btn btn-success">확인</button>
						<c:if test="${requestScope.isSender==1 }">
							<a class='btn btn-success' href="${pageContext.request.contextPath}/writeMessage.do?receipientNo=${requestScope.message.senderEmployee.empNo }&receipientName=${requestScope.message.senderEmployee.empName}&respondMsg=RE:">답장보내기</a>
						</c:if>
					</div>	
				
			</form>		
			</div>
			
		</div>
	</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>