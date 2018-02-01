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


</style>

<script>

	$(document).ready(function(){
		
		var status=${requestScope.status};
		if(status==1){
			$('#return').attr('disabled',false);
		}else if(status==2){
			$('#appr').attr('disabled',false);
			$('#wait').attr('disabled',false);
			$('#reject').attr('disabled',false);
		}
		
	
		var temp = $('.apprLineAppr').length;
		var text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineAppr').parent().append(text);
		$('.apprLineAppr').parent().next().next().append(text);
		
		temp = $('.apprLineRef').length;
		text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineRef').parent().append(text);
		$('.apprLineRef').parent().next().append(text);
		
		
		$('#return').on('click',function(){
			if(!confirm("결재문서를 회수 하시겠습니까?")) {
				return false;
			}
		
			
			$.ajax({
				url: '${pageContext.request.contextPath}/returnApproval.do'
				,
				method : 'GET'
				,
				data: {
					apprNo : '${requestScope.approval.apprNo}'
				}
				,
				success : function(data) {
					alert('결재 회수가 완료되었습니다.');
					self.close();
					opener.location.reload(true);
				}
				,
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
			});
		})
		
		

	
	});


</script>



</head>

<body>

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>결재 문서 상세보기</h2>

				<div class="clearfix"></div>
			</div>
			 <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="float:right; width:295px;">
			 		<button type="button" class="btn btn-success" id="appr" disabled='true'>결재</button>
			 		<button type="button" class="btn btn-success" id="wait" disabled='true'>보류</button>
			 		<button type="button" class="btn btn-success" id='reject' disabled='true'>반려</button>
			 		<button type="button" class="btn btn-success" id='return' disabled='true'>결재회수</button>			 		
			</div>
			<div class="table-responsive" id="datas">
				<h2><strong>결재 라인</strong></h2>
				<table class="table table-striped jambo_table bulk_action approvalLineTable" style="text-align:center;">
                       

                        
							 <tr class="headings" style="background-color:#3f5367; color:#ECF0F1;">
                            	<td rowspan="3" class="">결재</td>
                            <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
	                            <c:if test="${pageScope.record.apprStatus < 6 }">
	                           		 <td class="apprLineAppr">${pageScope.record.receiverLine.lineEmployee.duty }</td>
	                      		</c:if>
                            </c:forEach>
                          </tr>
                          <tr class="even pointer">
                            
                           <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
	                           <c:if test="${pageScope.record.apprStatus < 6 }">
	                           	 <td>${pageScope.record.receiverLine.lineEmployee.empName }</td>
	                           </c:if>	 
						   </c:forEach>
                            
                            
							
                          </tr>
						  <tr class="even pointer">
                            
                           
                           <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
	                           <c:if test="${pageScope.record.apprStatus < 6 }">
                           			 <td class=" "><img src="images/도장.jpg" style="height:50px; width:50px;"></td>
								</c:if>
							</c:forEach>
                            
                            
							
                          </tr>
                          <tr class="headings"style="background-color:#3f5367; color:#ECF0F1;">
                            
                            <td rowspan="3" class="">참조</td>
                          <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
	                            <c:if test="${pageScope.record.apprStatus == 6 }">
	                           		 <td class="apprLineRef">${pageScope.record.receiverLine.lineEmployee.duty }</td>
	                      		</c:if>
                            </c:forEach>
                            
                          </tr>
                        
                          <tr class="even pointer">
                            
                           <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
	                           <c:if test="${pageScope.record.apprStatus == 6 }">
	                           	 <td>${pageScope.record.receiverLine.lineEmployee.empName }</td>
	                           </c:if>	 
						   </c:forEach>
                            
                            
							
                          </tr>
				
                      </table>
	      <h2><strong>코멘트</strong></h2>
		  <table class="table table-striped jambo_table bulk_action ">
                        <thead>
                        
                          <tr class="headings">
                            
                            <th class="column-title">사원이름</th>
                            <th class="column-title">코멘트내용</th>
                            <th class="column-title">작성날짜</th>   
                            
                          </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
                        <c:if test="${pageScope.record.approvalComment != null }">
                          <tr class="even pointer">
                            
                           
							
                            <td class=" ">${pageScope.record.receiverLine.lineEmployee.empName}</td>
							<td class=" ">${pageScope.record.approvalComment.commentContent }</td>
                            <td class=" ">${pageScope.record.approvalComment.commentDate }</td>
                            
                            
							
                          </tr>
                          </c:if>
                         </c:forEach>
						
				</tbody>
                      </table>
                       <h2><strong>문서 정보</strong></h2>
					   <table class="table table-striped jambo_table bulk_action">
                        
                          <tr class="even pointer">
                            
                            <td class="column-title" style="background-color:#3f5367; color:#ECF0F1;">제목</td>
                            <td colspan="2" style="text-align:center;">${requestScope.approval.apprTitle }</td>
                            <td></td> 
                            
                          </tr>
                     

                    
                          <tr class="even pointer">
                            
                           
							
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">작성자</td>
                            <td class=" ">${requestScope.approval.employee.empName }</td>
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">양식명</td>
                            <td class=" ">${requestScope.approval.template.tmpName }</td>
                            
							
                          </tr>
						  <tr class="even pointer">

                           <td class=" " style="background-color:#3f5367; color:#ECF0F1;">부서</td>
							<td class=" ">${requestScope.approval.employee.department }</td>
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">보존기한</td>
                            <td class=" ">${requestScope.approval.validDate }일</td>
                           
							
                          </tr>
						  <tr class="even pointer">

                           <td class=" " style="background-color:#3f5367; color:#ECF0F1;">작성일</td>
							<td class=" ">${requestScope.approval.apprDate }</td>
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">긴급여부</td>
							<td class=" ">
								<c:if test="${requestScope.approval.urgency ==1}">긴급</c:if>
								<c:if test="${requestScope.approval.urgency ==0}"> 일반</c:if>
							</td>
                           
							
                          </tr>
						 
							<tr>
								<td colspan="4">${requestScope.approval.apprContent }</td>
							</tr>
                      </table>
					
			</div>
				
				
		</div>
	</div>





</body>
</html>