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

/* #textarea {

    padding: 10px;
    vertical-align: top;
    width: 550px !important;
    height: 330px !important;
} */
</style>

<script
	src = "${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js">
</script>

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
		$('#modalCloseBtn').on('click',function() {
			$('#chartBody').html("");
			 
		});
 		
		
		
 		$('#btnCancle').on('click',function(){
 			
 			window.close();
 		});
 		
 		
 		$('#btnSubmit').on('click',function(){
		
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
				text: "확인을 누르시면 받은 쪽지함으로 이동합니다",
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


<script>
	src = <"${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js">
</script>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/resources/css/custom.min.css"
	rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/google-code-prettify/bin/prettify.min.css"
	rel="stylesheet">

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
							
							<input type="hidden" id="dempNo" name="dempNo" value="" >
							<input type="text" id="empName" name="empName" class="form-control" readonly style="width:137px;height:24px;">
								
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
							<td colspan="2"><textarea style="width:550px; height:340px" name="msgContent"></textarea></td>
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
	
<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
			
				<div class="modal-body" id="chartBody"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalCloseBtn"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</body>
</html>