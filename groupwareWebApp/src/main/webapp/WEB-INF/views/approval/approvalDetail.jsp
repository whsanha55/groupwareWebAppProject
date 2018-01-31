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
	width: 100%;
	height: 570px;
	padding: 10px 17px;
	display: inline-block;
	background: #fff;
	border: 1px solid #E6E9ED;
	-webkit-column-break-inside: avoid;
	-moz-column-break-inside: avoid;
	column-break-inside: avoid;
	opacity: 1;
	transition: all .2s ease;
	margin-top: 14px; # datas { width : 100%;
	height: 400px;
	margin-bottom: 15px;
	overflow-y: hidden;
	-ms-overflow-style: -ms-autohiding-scrollbar;
	border: 1px solid #ddd;
}

.btn-success {
    background: #26B99A;
    border: 1px solid #169F85;
    display: inline;
    margin-right: 15px;
}


</style>

<script>

	$(document).ready(function(){
		
		$('#button1').on('click',function(){
			
			opener.open(); // ㅋㅎ 크롬에선 지원안됨 
		});
		
		 $('#button2').on('click',function(){
			
			location.href = "${pageContext.request.contextPath}/retreiveMessage.do";
		
		}); 

	
	});


</script>



</head>

<body>

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>받은 쪽지</h2>

				<div class="clearfix"></div>
			</div>
			<div class="table-responsive" id="datas">
				<table class="table table-striped jambo_table bulk_action">
					<tbody>

						<tr>
							<td>발신자</td>
							<td>${requestScope.message.senderEmployee.empName }</td>

						</tr>

						<tr>
							<td>제목</td>
							<td>${requestScope.message.msgTitle }</td>

						</tr>

						<tr height="100">
							<td>내용</td>
							<td colspan="2">${requestScope.message.msgContent }</td>
						</tr>
					</tbody>
				</table>
					
			</div>
				
				<div class="buttons text-center">
				<button type="button" id="button1" class="btn btn-success">확인</button>
				<button type="button" id="button2" class="btn btn-success">답장보내기</button>
				</div>
		</div>
	</div>





</body>
</html>