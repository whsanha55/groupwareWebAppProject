<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 보관함</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/resources/css/custom.min.css"
	rel="stylesheet">

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
<script
	src = "${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js">
</script>

<script>

	$(document).ready(function(){
		
	
		$('#form').on('click', '#button4', function() {
			 
					
			$.ajax({
				
				url: '${pageContext.request.contextPath}/registerResponseMsg.do'
				,
				method: 'POST'
				,
				dataType: 'json'
				,
				data: $('#form').serialize()		
				,
				success : function(data) {
					//성공했을때 sweetAlert
					swal({
						
						title: "답장 전송 완료",
						text: "확인을 누르시면 보낸 쪽지함으로 이동합니다",
						icon: "success"
						
																		
					}).then((s) => {
						window.close();
						location.href= '${pageContext.request.contextPath}/retrieveSendMessageList.do';
					});
				}
				,
				 
				 error: function(jqXHR) {
						alert("error : " + jqXHR.status);
					}
							
			});
			
		});
	    
		
		$('#button1').on('click',function(){
			opener.parent.location.reload();		
			window.close();
			
		});
		
		
		
		
		 $('#button2').on('click',function(){
			 
			 $('#form').empty();
			 
			 var htmlStr = "";
			 
			 htmlStr += "<table class='table table-striped jambo_table bulk_action'>";
			 htmlStr += "<tbody>";		
			 htmlStr += "<tr>";				
			 htmlStr += "<input type = 'hidden' name='senderNo' value='${requestScope.message.receipientEmployee.empNo }'>";
			 htmlStr += "<td>수신자</td>";
			 htmlStr += "<td> ${requestScope.message.senderEmployee.empName } </td>";
			 htmlStr += "</tr>";
			 
			 htmlStr += "<tr>";
			 htmlStr += "<td>제목</td>";
			 htmlStr += "<td>"+ '<input type="text" name="msgTitle" size="40"></input>'+"</td>";
			 htmlStr += "</tr>"
			 
			 htmlStr += '<tr height="340px">';
			 htmlStr += "<td>내용</td>";
			 htmlStr += '<td colspan="2"><textarea style="width:550px; height:340px" name="msgContent"></textarea>'+"</td>";
			 htmlStr += "</tr>";
			 htmlStr += "</tbody>";
			 htmlStr += "</table>";
							 				
					 
			 htmlStr += '<div class="buttons text-center">';
			 htmlStr += '<button type="button" id="button3" class="btn btn-success">취소</button>';
			 htmlStr += '<button type="button" id="button4" class="btn btn-success">쪽지보내기</button>';
		
			 htmlStr += "</div>";
						 
			 $(htmlStr).appendTo('#form');
			 
			
			 /*
			 $.ajax({
				 
				 url: '${pageContext.request.contextPath}/registerReponseMsgForm.do'
				 ,
				 
				 method: 'POST'
				 ,
				 dataType: 'json'
				 ,
				 data: {
					
					 recEmpNo: $('tbody').find('tr:nth-child(1)').find('td:nth-child(2)').attr('id'),
					 recEmpName: $('tbody').find('tr:nth-child(1)').find('td:nth-child(2)').text()
				 	
				 }
				 
				 ,
				 success : function(data) {
					
					 
					 $('#form').empty();
					 
					 var htmlStr = "";
					 
					 htmlStr += "<tbody>";		
					 htmlStr += "<tr>";				
					 htmlStr += '<input type = "hidden" name="receipientEmployee.empNo" value="'+data.senderEmployee.empNo+'">'
					 htmlStr += "<td>수신자</td>";
					 htmlStr += "<td>" + data.senderEmployee.empName + "</td>";
					 htmlStr += "</tr>";
					 
					 htmlStr += "<tr>";
					 htmlStr += "<td>제목</td>";
					 htmlStr += "<td>"+ '<input type="text" name="msgTitle" size="40"></input>'+"</td>";
					 htmlStr += "</tr>"
					 
					 htmlStr += '<tr height="340px">';
					 htmlStr += "<td>내용</td>";
					 htmlStr += '<td colspan="2"><textarea style="width:550px; height:340px" name="msgContent"></textarea>'+"</td>";
					 htmlStr += "</tr>";
					 htmlStr += "</tbody>";
									 				 
					 $(htmlStr).appendTo('#form');
					 
					 alert($('#form').html());
					 
					 htmlStr = "";
					 
					 $('#buttons').find('button').remove();
					 
					 var htmlStr2 = "";
					 
					 htmlStr2 += '<div class="buttons text-center">';
					 htmlStr2 += '<button type="button" id="button3" class="btn btn-success">취소</button>';
					 htmlStr2 += '<button type="button" id="button4" class="btn btn-success">답장보내기</button>';
					 htmlStr2 += "</div>";
					 
					 $(htmlStr2).appendTo('#buttons');
					 htmlStr2 = "";					 
				
				 }
				 
				 ,
				 
				 error: function(jqXHR) {
						alert("error : " + jqXHR.status);
					}
				 				 		 
		 	});
			 */
			
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
							
								<td style="font-weight:bolder;">발신자</td>
								<td id="${requestScope.message.receipientEmployee.empNo }">${requestScope.message.senderEmployee.empName }</td>
								<td style="font-weight:bolder;">수신자</td>
								<td >${requestScope.message.receipientEmployee.empName }</td>
							
							</tr>
	
							<tr>
								<td style="font-weight:bolder;">제목</td>
								<td colpan="3">${requestScope.message.msgTitle }</td>
								<td></td>
								<td></td>
	
							</tr>
	
							<tr height="100">
								<td style="font-weight:bolder;">내용</td>
								<td colspan="3" >${requestScope.message.msgContent }</td>
								
							</tr>						
							
						</tbody>				
							
					</table>
					
														
			</div>
			
			<div class="buttons text-center" id="buttons">
						<button type="button" id="button1" class="btn btn-success">확인</button>
						<c:if test="${requestScope.isSender==1 }">
							<button type="button" id="button2" class="btn btn-success">답장보내기</button>
						</c:if>
					</div>	
				
			</form>		
			
		</div>
	</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>