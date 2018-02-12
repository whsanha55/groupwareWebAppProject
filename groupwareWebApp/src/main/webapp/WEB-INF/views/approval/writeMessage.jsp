<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 작성</title>

<style>
.x_panel {
	width: 100%;
	height: 100%;
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

#counter {
  background:rgba(255,0,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
}


</style>

<script>

 	$(document).ready(function(){
 		
 		//결재선 관리 이벤트
		$('#modalChart').on('click',function() {
			$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
			$('#layerpop').modal({
				backdrop: 'static', 
				keyboard: false
			});
		});
		$('#modalChooseBtn').on('click',function() {
			//사원관리 - 대결권자설정
			$('input[name=dempNo]').val(selectedEmpNo);
			$('input[name=empName]').val(selectedNameAndDuty);
			
			//일정관리 - 담당자설정
			$('input[name=rspbNo]').val(selectedEmpNo);
			$('input[name=empName]').val(selectedNameAndDuty);
		
			$('#chartBody').html("");
			 
		});
 		$('#modalClose').click(function(){
 			$('#chartBody').html("");
 		});
 		
		
		
 		$('#btnCancle').on('click',function(){
 			
 			window.close();
 		});
 		
 		//1000바이트 넘으면 유효성 체크 
 			
 	 	$('#textArea').on('keyup',function(){
 			    
 			  if($(this).val().length > 1000){
 				
 				 swal({title: "글자수는 1000글자로 제한됩니다.",
					   icon: "warning"});
		 		 return;
 			  
 			  }			  
 		
 		});
 			
 		
 		
 		$('#btnSubmit').on('click',function(){
 			
 			var respondMsg = $('tr:nth-child(2)').find('td:first').attr('id');
 			
		$.ajax({
			
			
			url: '${pageContext.request.contextPath}/registerMessage.do'
			,
			method: 'POST'
			,
			dataType: 'json'
			,
			data: $('#form').serialize()
			,
			success: function(data){
				
				//성공시 sweetAlert
				swal({
				title: "쪽지 전송 완료",
				text: "쪽지를 전송하였습니다.",
				icon: "success"
				}).then((e)=>{
					opener.parent.location.reload();
					window.close();
					

				});
				
			}
			,
			
			error: function(jqXHR) {
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
				<h2>쪽지 작성</h2>

				<div class="clearfix"></div>
			</div>
			<form id="form">
			<div class="table-responsive" id="datas" style="margin-bottom: 8px">
				<table class="table table-striped jambo_table bulk_action">
					<tbody>

						<tr>
							<td>수신자</td>
							<td>
							<div class="input-group col-md-6 col-sm-6 col-xs-12" style="margin-bottom:0px;">
							
							<input type="hidden" id="dempNo" name="dempNo" value="${requestScope.receipientNo}" >
							<input type="hidden" id="respondMsg" name="respondMsg" value="${requestScope.respondMsg}" >
							<input type="text" id="empName" name="empName" class="form-control" readonly  value="${requestScope.receipientName}" style="width:137px;height:24px;">
							
							<button class="btn btn-primary" id='modalChart' type="button" style="height:27px; margin-left:5px; padding-top:3px;">검색</button>
								
							</div>
							</td>
						</tr>

						<tr>
							<td>제목</td>
							<td><input type="text" name="msgTitle" size="40"></input></td>

						</tr>

						<tr height="340px">
							<td>내용</td>
							<td colspan="2"><textarea style="width:550px; height:340px" name="msgContent" id="textArea"></textarea></td>
							
						</tr>
					</tbody>
				</table>
					
			</div>
				
				<div class="buttons text-center">
				<button type="button" id="btnCancle" class="btn btn-success">취소</button>
				<button type="button" id="btnSubmit" class="btn btn-success">작성</button>
				</div>
		</div>
	</div>
	</form>
	
<div class="modal fade" id="layerpop" style="margin-top:80px;">
		<div class="modal-dialog modal-cSize" id="modal1" style="width:350px;margin:auto;">
			<div class="modal-content modal-cSize">
			
				<div class="modal-body" id="chartBody"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="modalChooseBtn"
						data-dismiss="modal">선택</button>
					<button class="btn btn-dark" id="modalClose" data-dismiss="modal">닫기</button>	
				</div>
			</div>
		</div>
	</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</body>
</html>