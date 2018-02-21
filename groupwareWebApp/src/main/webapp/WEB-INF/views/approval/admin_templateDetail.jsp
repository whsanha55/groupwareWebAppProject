<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>양식 상세보기</title>
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	
	var tmpUsing;
	var tmpNo;
	var categoryUsing;

	$(document).ready(function(){		
		tmpUsing = ${requestScope.template.tmpUsing};
		tmpNo = ${requestScope.template.tmpNo};
		categoryUsing = ${requestScope.template.templateCategory.categoryUsing};
		
		if(categoryUsing == 1) {
			if(tmpUsing == 0) {
				$('#using').attr('disabled', false);
			} else {
				$('#notUsing').attr('disabled', false);		
			}
		} 
		
		
		$('#using').on('click', function(){
			if(!$(this).attr('disabled')){
			 	swal({
					  title: "사용여부 변경",
					  text: "양식을 사용으로 설정합니다. 계속 진행하시겠습니까?",
					  icon: "info",
					  buttons : true 
				}).then((e) => {
				     if(e) {
				    	 updateTmpUsing();						
					 }
				});	 
			}
		});
		
		
		$('#notUsing').on('click', function(){
			if(!$(this).attr('disabled')){
				swal({
					  title: "사용여부 변경",
					  text: "양식을 미사용으로 설정합니다. 계속 진행하시겠습니까?",
					  icon: "info",
					  buttons : true 
				}).then((e) => {
				     if(e) {
				    	 updateTmpUsing();						
					 }
				});		
			}
		});
		
	})//end of document
	
	
	function updateTmpUsing() {
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/updateTmpUsing.do'
			,
			method: 'GET'
			,
			data: {
				tmpNo: tmpNo,
				tmpUsing: tmpUsing
			},			
			dataType: 'json'
			,
			async: true
			,
			cache: false
			,
			success: function(data, textStatus, jqXHR) {
				if(data == "변경 완료"){
					swal({
						  title: "변경 완료",
						  text: "사용여부가 변경되었습니다.",
						  icon: "success",
						  confirmButton: true,
						  showCancelButton: false
						}).then((e) => {
							if(e) {
								location.href="${pageContext.request.contextPath}/admin/templateDetail.do?tmpNo="+tmpNo;
								opener.templatePaging(1);
							}	
					});	
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('error: ' + jqXHR.status);
			}	
		})
	}
	

</script>


<body>


	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>양식 상세보기</h2>
				<a class="btn btn-primary pull-right" id="notUsing" disabled='true'>미사용</a>
				<a class="btn btn-primary pull-right" id="using" disabled='true'>사용</a>
				<div class="clearfix"></div>
			</div>

			<div class="table-responsive" id="datas">
	            <h2><strong>양식 정보</strong></h2>	            				
			    <table class="table table-striped jambo_table bulk_action">
					<tr class="even pointer">
	                	<td class=" " style="background-color:#3f5367; color:#ECF0F1;">양식명</td> 	           
	                    <td class=" ">${requestScope.template.tmpName }</td>       
						<td class=" " style="background-color:#3f5367; color:#ECF0F1;">구분</td>
	                    <td class=" ">${requestScope.template.templateCategory.categoryName }</td>		
					</tr>
					<tr class="even pointer">
						<td class=" " style="background-color:#3f5367; color:#ECF0F1;">등록일</td>
						<td class=" ">${requestScope.template.tmpDate }</td>
	                    <td class=" " style="background-color:#3f5367; color:#ECF0F1;">사용여부</td>
						<td class=" "><c:choose>
										<c:when test="${requestScope.template.tmpUsing == 0 }">
											미사용
										</c:when>
										<c:when test="${requestScope.template.tmpUsing == 1 }">
											사용
										</c:when>
									 </c:choose></td>	
	                </tr>
	            	<tr class="even pointer">
	                	<td class="column-title" style="background-color:#3f5367; color:#ECF0F1;">양식 설명</td>
	                    <td colspan="3">${requestScope.template.tmpSummary }</td>                     
	                </tr>
					<tr>
						<td colspan="4">${requestScope.template.tmpContent }</td>
					</tr>
	             </table>
			</div>

		</div>
	</div>	
	

</body>
</html>