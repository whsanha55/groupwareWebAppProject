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
		
		var status = ${requestScope.status};
		var finalStatus = "${param.finalStatus}";
				
		if(status==1){
			$('#return').attr('disabled',false);
			$('#appr').hide();
			$('#reject').hide();
			$('#postpone').hide();
		} else if(status==2){
			$('#return').hide();
			$('#appr').attr('disabled',false);	
			$('#reject').attr('disabled',false);
			if(finalStatus==0){
				$('#postpone').attr('disabled',false);
			}
		} else if(status==3) {
			$('#return').hide();
			$('#appr').hide();
			$('#reject').hide();
			$('#postpone').hide();
		}
		
		
	
		/* var temp = $('.apprLineAppr').length;
		var text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineAppr').parent().append(text);
		$('.apprLineAppr').parent().next().next().append(text);
		 temp = $('.apprLineAppr1').length;
		 text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineAppr1').parent().append(text);
		$('.apprLineAppr1').parent().next().next().append(text);*/
		var temp = $('.apprLineAppr2').length;
		var text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineAppr2').parent().append(text);
		$('.apprLineAppr2').parent().next().next().append(text);
		 temp = $('.apprLineAppr3').length;
		 text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineAppr3').parent().append(text);
		$('.apprLineAppr3').parent().next().next().append(text);/*
		temp = $('.apprLineRef').length;
		text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineRef').parent().append(text);
		$('.apprLineRef').parent().next().append(text);
		temp = $('.apprLineRef1').length;
		text = "";
		for(var i =temp; i<9;i++) {
			//$('.apprLineAppr').parent().append('<td></td>');
			text += "<td></td>";
		}
		$('.apprLineRef1').parent().append(text);
		$('.apprLineRef1').parent().next().append(text); */
		
	
		
		//결재 회수
		$('#return').on('click',function(){
			swal({
				  title: "결재 회수",
				  text: "선택한 문서를 회수 하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						executeReturn();
					}	
				});
		})
		
		//결재 보류
		$('#postpone').on('click',function(){
			swal({
				  title: "결재 보류",
				  text: "결재를 보류 하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						executeApproval('',2);
					}	
				});
		})
		
		//결재 반려
		$('#reject').on('click',function(){
			swal({
				  title: "결재 반려",
				  text: "문서를 반려 하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {												
					  swal({
							  title: "코멘트 입력",
							  text: "결재 문서에 대한 코멘트를 입력해주세요.",
							  content: {
								  element : "input"
							  } ,
							  buttons : ['건너뛰기','저장']							  
						}).then(commentContent => {
				            executeApproval(commentContent,3);						
						});
					}	
				});
		})//end of reject.on
			
		
		//결재문서 결재
		$('#appr').on('click',function() {
			swal({
				  title: "결재 승인",
				  text: "문서를 승인 하시겠습니까?",
				  icon: "success",
				  buttons : true 
				}).then((e) => {
					if(e) {												
					  swal({
							  title: "코멘트 입력",
							  text: "결재 문서에 대한 코멘트를 입력해주세요.",
							  content: {
								  element : "input"
							  } ,
							  buttons : ['건너뛰기','저장']							  
						}).then(commentContent => {
				            executeApproval(commentContent,1);						
						});
					}	
				});
		});
		
		
		
		//결재 회수	
		function executeReturn(){
			
			$.ajax({
				url: '${pageContext.request.contextPath}/returnApproval.do'
				,
				method : 'GET'
				,
				data: {
					apprNo : '${requestScope.approval.apprNo}'
				}
				,
				datatype : 'json'
				,
				
				success : function(data) {
					swal("결재 회수가 완료되었습니다.").then((e)=>{
						self.close();
						opener.location='http://localhost:9000/groupware/approvalMyRequest.do'
					});					
				}
				,
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
			});
		}
		
		//결재 반려 또는 승인 
		function executeApproval(commentContent,apprStatus) {
			
			$.ajax({
				url: '${pageContext.request.contextPath}/executeApprovalAjax.do'
				,
				method : 'GET'
				,
				data: {
					apprNo : '${requestScope.approval.apprNo}',
					commentContent: commentContent ,
					apprStatus : apprStatus ,
					recordNo : $('input[name=recordNo]').val()
				}
				,
				datatype : 'json'
				,				
				success : function(data) {
					if(data == 1) { // 결재 승인
						swal("결재가 승인되었습니다.").then((e)=>{
							self.close();
							opener.location='http://localhost:9000/groupware/approvalTodo.do';
						});
					} else if(data ==2) { //결재 보류
						swal("결재가 보류되었습니다.").then((e)=>{
							self.close();
							opener.location='http://localhost:9000/groupware/approvalTodo.do';
						});	
					} else  {		//반려
						swal("결재가 반려되었습니다.").then((e)=>{
							self.close();
							opener.location='http://localhost:9000/groupware/approvalTodo.do';
						});
					}
										
				},
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
			});
		}
		
		
		function checkDate() {
			
		}
		
		
		
		
		

	
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
			 <span><button type="button" class="btn btn-success" id='return' disabled='true'>결재회수</button></span>
			 <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="float:right; width:210px;">
			 		<button type="button" class="btn btn-success" id="appr" disabled='true'>결재</button>
			 		<button type="button" class="btn btn-success" id="postpone" disabled='true'>보류</button>
			 		<button type="button" class="btn btn-success" id='reject' disabled='true'>반려</button>			 				 		
			</div>
			<div class="table-responsive" id="datas">
				<h2><strong>결재 라인</strong></h2>
				<table class="table table-striped jambo_table bulk_action approvalLineTable" style="text-align:center; width:100%;">
                       

                        
						  <tr class="headings" style="background-color:#3f5367; color:#ECF0F1;">
                            	<td rowspan="4" class="">결재</td>
                            <c:forEach var="line" items="${requestScope.receiverLine}" >
	                            
	                            <c:if test="${ line.apprType == 0}">
	                           		 <th class="apprLineAppr" style="width:139px; text-align:center;">${pageScope.line.lineEmployee.duty }</th>
	                      		</c:if>
	                      		
	                      	    <c:if test="${line.lineEmployee.empNo == empNo}">
	                      			<input type="hidden" name='recordNo' value="${line.approvalRecords[0].recordNo}">
	                      		</c:if> 
                            </c:forEach>
                            <c:forEach begin="1" end="${17- fn:length(requestScope.receiverLine) }">
                            	<th style="width:68px;"></td>
                            </c:forEach>
                          </tr>
                          
                          <tr class="even pointer">                      
                           <c:forEach var="line" items="${requestScope.receiverLine}" >
	                           <c:if test="${ line.apprType == 0}">
	                           	 <td class="apprLineAppr1">${pageScope.line.lineEmployee.empName }</td>
	                           </c:if>	 
						   </c:forEach>	
						   <c:forEach begin="1" end="${17- fn:length(requestScope.receiverLine) }">
                            	<td style="width:139px;"></td>
                            </c:forEach>				
                          </tr>
                        
						  <tr class="even pointer">
                           <c:forEach var="line" items="${requestScope.receiverLine}" >                                                    
	                           <c:if test="${pageScope.line.approvalRecords!=null && pageScope.line.approvalRecords[0].apprStatus < 6 && pageScope.line.approvalRecords[0].confirmDate !=null }">	                             
                           			 <td class="apprLineAppr2"><img src="${pageScope.line.lineEmployee.systemSignName }" style="height:40px; width:40px;"></td>
								</c:if>
							</c:forEach>
							
                          </tr>
                          
                          <tr class="even pointer">                       
                           <c:forEach var="line" items="${requestScope.receiverLine}" >
	                           <c:if test="${pageScope.line.approvalRecords!=null && pageScope.line.approvalRecords[0].apprStatus < 6 && pageScope.line.approvalRecords[0].confirmDate !=null}">
	                           	 <td class="apprLineAppr3">${line.approvalRecords[0].confirmDate }</td>
	                           </c:if>	 
						   </c:forEach>
						   
  			              </tr>
  			              
                          <tr class="headings"style="background-color:#3f5367; color:#ECF0F1;">
                            <td rowspan="3" class="">참조</td>
                            <c:forEach var="line" items="${requestScope.receiverLine}" >
	                            <c:if test="${ line.apprType == 1}">
	                           		 <td class="apprLineRef">${pageScope.line.lineEmployee.duty }</td>
	                      		</c:if>
                            </c:forEach>
                            <c:forEach begin="1" end="${13- fn:length(requestScope.receiverLine) }">
                            	<td style="width:139px;"></td>
                            </c:forEach>
                          </tr>
                        
                          <tr class="even pointer"> 
                          <c:forEach var="line" items="${requestScope.receiverLine}" >
	                            <c:if test="${ line.apprType == 1}">
	                           		 <td class="apprLineRef1">${pageScope.line.lineEmployee.empName }</td>
	                      		</c:if>
                            </c:forEach>
                            <c:forEach begin="1" end="${13- fn:length(requestScope.receiverLine) }">
                            	<td style="width:139px;"></td>
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
                        <c:forEach var="line" items="${requestScope.receiverLine}" >
                        <c:if test="${line.approvalRecords[0].approvalComment != null }">
                          <tr class="even pointer">
                            
                           
							
                            <td class=" ">${line.lineEmployee.empName}</td>
							<td class=" ">${line.approvalRecords[0].approvalComment.commentContent }</td>
                            <td class=" ">${line.approvalRecords[0].approvalComment.commentDate }</td>
                            
                            
							
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
                            <td class=" ">
                            	<c:choose>
                            		<c:when test="${requestScope.approval.validDate != 0}">
                            			${requestScope.approval.validDate}년
                            		</c:when>
                            		<c:otherwise>영구보존</c:otherwise>
                            	</c:choose>
                            </td>
                           
							
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
						<c:if test="${fn:length(requestScope.approval.approvalFiles) >0 }">
							<table class="table table-striped jambo_table bulk_action">
								<tr>
									<th  class="headings" style="background-color:#3f5367; color:#ECF0F1;">파일번호</th>
									<th class="headings"style="background-color:#3f5367; color:#ECF0F1;" colspan="2">파일이름</th>							
								</tr>
								<c:forEach var="apprFile" items="${requestScope.approval.approvalFiles }" varStatus="loop">
									<tr>
										<td>파일${pageScope.loop.count }</td>
										<c:url var="downloadUrl" value="/downloadApprFile.do">
											<c:param name="originalFileName" value="${pageScope.apprFile.originalFileName }"/>
											<c:param name="systemFileName" value="${pageScope.apprFile.systemFileName }"/>
										</c:url>
										
										<td><a href = "${pageScope.downloadUrl }">${pageScope.apprFile.originalFileName }</a></td>
										
										<td></td>
									</tr>
								</c:forEach>
							</table>
						</c:if>					
			</div>
								
		</div>
	</div>



 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>