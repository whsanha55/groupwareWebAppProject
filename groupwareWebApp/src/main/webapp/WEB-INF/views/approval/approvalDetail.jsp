<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결재문서 상세조회</title>

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
		
		var status = '${param.status}';
				
		if(status==1){
			$('#return').attr('disabled',false);
			$('#appr').hide();
			$('#reject').hide();
			$('#postpone').hide();
			$('#reAppr').hide();
			$('#deleteAppr').hide();
		} else if(status==2){
			$('#return').hide();
			$('#reAppr').hide();
			$('#deleteAppr').hide();
			$('#appr').attr('disabled',false);	
			$('#reject').attr('disabled',false);
			if(${requestScope.apprStatus}!=2){
				$('#postpone').attr('disabled',false);
			}
		} else if(status==3) {
			$('#return').hide();
			$('#appr').hide();
			$('#reject').hide();
			$('#reAppr').hide();
			$('#postpone').hide();
			$('#deleteAppr').hide();
		}else if(status==4){
			$('#return').hide();
			$('#appr').hide();
			$('#reject').hide();
			$('#postpone').hide();
			$('#deleteAppr').hide();
			$('#reAppr').attr('disabled',false);
		}else if(status==5){
			$('#return').hide();
			$('#appr').hide();
			$('#reject').hide();
			$('#postpone').hide();
			$('#reAppr').attr('disabled',false);
			$('#deleteAppr').attr('disabled',false);
		}
		
		//대결권자 변경 
		var records = [];
		<c:forEach items="${approval.approvalRecords}" var="record">
			<c:if test="${record.depEmployee.empNo != null}">
				records.push({
					lineEmpNo : "${record.receiverLine.lineEmployee.empNo }" ,
					depEmpNo : "${record.depEmployee.empNo}" ,
					depEmpName : "${record.depEmployee.empName}" ,
					depDepartment : "${record.depEmployee.department}" ,
					depDuty : "${record.depEmployee.duty}" ,
					depSignName : "${record.depEmployee.signName}",
					depSystemSignName : "${record.depEmployee.systemSignName}"
					});
			</c:if>
		</c:forEach>
		$('.apprLineAppr').each(function() {
			for(var i=0;i<records.length;i++) {
				if(records[i].lineEmpNo == $(this).attr('id')) {
					var thisIndex = $(this).index();
					var trTemp = $(this).closest('tr');
					$(this).text(records[i].depDuty);
					trTemp.next().find('td:nth-child(' + thisIndex + ')').html("<대결><br>" + records[i].depEmpName);
					trTemp.next().next().find('td:nth-child(' + thisIndex + ')').text(records[i].depDepartment);
					trTemp.next().next().next().find('td:nth-child(' + thisIndex + ')').attr('src',records[i].depSystemSignName);
				}
			}
		});
		$('.commentEmp').each(function() {
			for(var i=0;i<records.length;i++) {
				if(records[i].lineEmpNo == $(this).attr('id').substr(7)) {
					$(this).text(records[i].depEmpName);
				}
			}
		});
		
		
		
		//전결 여부 확인
		if($('.delegation1').length) {
			var temp = $('.delegation1').closest('td');
			var index = ${apprCount} -1;
			$('.delegation1').closest('tr').find('td:eq(' + index + ')').html(temp.html());
			$(temp).html('<b>전결</b>');
			
		}
		
		
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
		
		//삭제
		$('#deleteAppr').on('click',function(){
			swal({
				  title: "문서 삭제",
				  text: "선택한 문서를 삭제 하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						executeDelete();
						
					}	
				});
		})
		
		//재기안
		$('#reAppr').on('click',function(){
			var reApprDelete=0;
			if(status!=4){
				reApprDelete=1;
			}
			swal({
				  title: "문서 재기안",
				  text: "선택한 문서를 재기안 하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						window.opener.top.location.href="${pageContext.request.contextPath}/writeApproval.do?apprNo="+${requestScope.approval.apprNo}+"&reApprDelete="+reApprDelete;
						window.close()						
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
						confirmComment();
						function confirmComment() {
								swal({
									  title: "코멘트 입력",
									  text: "결재 문서에 대한 코멘트를 입력해주세요.",
									  content: {
										  element : "input"
									  } ,
									  buttons : '반려하기'						  
								}).then((commentContent) => {
									if(commentContent){
										 executeApproval(commentContent,3);
									}else{
										swal({
											  title: "결재 반려",
											  text: "반려 사유를 작성해주세요",
											  icon: "warning",
											  buttons: "확인"
											}).then(function() {
												confirmComment();
											});
									}
								});
								
						}
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
					if(data){	//data true일때만 회수처리 된거니깐 			
						swal("결재 회수가 완료되었습니다.").then((e)=>{
							self.close();
							opener.location='${pageContext.request.contextPath}/approvalMyRequest.do'
						});				
					}else{
						swal({ 
						  title: "결재 회수",
						  text: "현재 문서는 결재 회수 처리를 할 수 없습니다.",
						  icon: "error"
						});
					}
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
					isDelegation : ${isDelegation},
					recordNo : ${recordNo}
				}
				,
				datatype : 'json'
				,				
				success : function(data) {
					if(data == 1) { // 결재 승인
						swal("결재가 승인되었습니다.").then((e)=>{
							self.close();
							opener.location='${pageContext.request.contextPath}/approvalTodo.do';
						});
					} else if(data ==2) { //결재 보류
						swal("결재가 보류되었습니다.").then((e)=>{
							self.close();
							opener.location='${pageContext.request.contextPath}/approvalTodo.do';
						});	
					} else  {		//반려
						swal("결재가 반려되었습니다.").then((e)=>{
							self.close();
							opener.location='${pageContext.request.contextPath}/approvalTodo.do';
						});
					}
										
				},
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
			});
		}
		
		//삭제
		function executeDelete(){
			
			$.ajax({
				url: '${pageContext.request.contextPath}/removeReturnAppr.do'
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
					swal("문서 삭제가 완료되었습니다.").then((e)=>{
						self.close();
						opener.location='${pageContext.request.contextPath}/approvalMyRequest.do'
					});					
				}
				,
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
			 		<button type="button" class="btn btn-success" id='reAppr' disabled='true'>재기안</button>			 				 		
			 		<button type="button" class="btn btn-success" id='deleteAppr' disabled='true'>삭제</button>			 				 		
			</div>
			<div class="table-responsive" id="datas" style="border:0px;width:100%">
				<h2><strong>결재 라인</strong></h2>
				
				<%-- 결재 --%>
				<table id="table1" class="table table-hover" style="text-align:center; width:100%;">
					<tr class="headings" style=" color:#ECF0F1;">
                    	<th rowspan="5" class="" style="width:60px; height:35px;background-color:#4a6075;text-align:center">결재</th>
                        <c:forEach var="line" items="${requestScope.receiverLine}" >
                           <c:if test="${ line.apprType == 0}">
                              <th class="apprLineAppr" id="${line.lineEmployee.empNo }"
                              	style="width:110px; height:35px; text-align:center; background-color:#4a6075;">
                              ${pageScope.line.lineEmployee.duty }</th>
                     	   </c:if>
                        </c:forEach>
                        <c:forEach begin="1" end="${9-requestScope.apprCount}">
                           <th style="width:50px;background-color:#4a6075;"></th>
                        </c:forEach>
                    </tr>
                    
                    <tr class="">
                    	<c:forEach var="line" items="${requestScope.receiverLine}" >
                        	<c:if test="${ line.apprType == 0}">
                          		<td class="apprLineAppr1" style="background-color:;font-weight: bolder;border:1px #444444;">
                          			${pageScope.line.lineEmployee.empName }
                          		</td>
                           </c:if>	 
				   		</c:forEach>	
				   		<c:forEach begin="1" end="${9-requestScope.apprCount}">
                          	<td style="width:139px; background-color:;"></td>
                        </c:forEach>				
                    </tr>
                      
                    <tr class="">                      
                        <c:forEach var="line" items="${requestScope.receiverLine}" >
                          <c:if test="${ line.apprType == 0}">
                          	 <td class="apprLineAppr1" style="background-color:;">
                          	 	${pageScope.line.lineEmployee.department }
                          	 </td>
                          </c:if>	 
				   	    </c:forEach>	
				  		<c:forEach begin="1" end="${9-requestScope.apprCount}">
                          	<td style="width:139px; background-color:;"></td>
                        </c:forEach>				
                    </tr>
                      
				    <tr class="">
                        <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >                                                    
                      		<td class="apprLineAppr2">
                      			<c:if test="${pageScope.record.confirmDate  !=null}">
                      				<c:choose>
                      					<c:when test="${pageScope.record.receiverLine.lineEmployee.systemSignName!=null}">
			                       			<img class="delegation${record.isDelegation }" 
			                       				src="${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/${pageScope.record.receiverLine.lineEmployee.systemSignName }" 
			                       				style="height:65px; width:65px;">
                      					</c:when>
                      					<c:otherwise>
                      						<img class="delegation${record.isDelegation }" 
			                       				src="${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/도장기본.png" 
			                       				style="height:65px; width:65px;">
                      					</c:otherwise>
                      				</c:choose>
                      				
                       			</c:if>
                       		</td>
						</c:forEach>
						<c:forEach begin="1" end="${9-requestScope.recCount}">
                          	<td style="width:139px; background-color:;"></td>
                        </c:forEach>
                    </tr>
                        
                    <tr class="">                       
                        <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
                            <td class="apprLineAppr3">${pageScope.record.confirmDate }</td>
				        </c:forEach>
				        <c:forEach begin="1" end="${9-requestScope.recCount}">
                          	<td style="width:139px; background-color:;"></td>
                        </c:forEach>
			        </tr>
			   </table>
			   
			   <%-- 참조 --%>
			  <table class='table table-hover' style="text-align:center;width:100%;">
 			  	<c:if test="${requestScope.refCount!=0 }">
                	<tr class=""style=" color:#ECF0F1;">
                    	<th rowspan="3" class="" style="background-color:#4a6075;width:60px;text-align:center">참조</th>
                        <c:forEach var="line" items="${requestScope.receiverLine}" >
                            <c:if test="${ line.apprType == 1}">
                         	   <th class="apprLineRef" style="width:110px; height:35px; text-align:center;background-color:#4a6075;" >
                         		 	${pageScope.line.lineEmployee.duty }
                         	   </th>
                   		   </c:if>
                        </c:forEach>
                        <c:forEach begin="1" end="${9-requestScope.refCount}">
                        	  <th style="width:139px; background-color:#4a6075;"></th>
                        </c:forEach>
                   </tr>
                       
                   <tr class=""> 
                        <c:forEach var="line" items="${requestScope.receiverLine}" >
                            <c:if test="${ line.apprType == 1}">
                           		 <td class="apprLineRef1">${pageScope.line.lineEmployee.empName }</td>
                      		</c:if>
                        </c:forEach>
                        <c:forEach begin="1" end="${9-requestScope.refCount}">
                           	<td style="width:139px;"></td>
                        </c:forEach>
                    </tr>
		 	   </c:if>
          </table>
          
          
	      <h2>
	      	<strong>코멘트</strong>
	      </h2>
	      
	      <%-- 코멘트 --%>
		  <table class="table table-striped jambo_table bulk_action ">
		       <tr class="headings" style="background-color:#4a6075;color:#ECF0F1;">
			       <th class="column-title">사원이름</th>
			       <th class="column-title">코멘트내용</th>
			       <th class="column-title">작성날짜</th>   
		       </tr>

               <c:forEach var="record" items="${requestScope.approval.approvalRecords}" >
	                <c:if test="${record.approvalComment != null }">
	                  <tr class="even pointer">
	                    <td class="commentEmp" id='comment${record.receiverLine.lineEmployee.empNo }'>
	                    	${record.receiverLine.lineEmployee.empName}
	                    </td>
						<td class=" ">${record.approvalComment.commentContent }</td>
	                    <td class="">${record.approvalComment.commentDate }</td>
	                  </tr>
	                </c:if>
                </c:forEach>
          </table>
                      
                      
          <h2>
          	<strong>문서 정보</strong>
          </h2>
			
		  <%-- 문서 --%>
		  <table class="table table-striped jambo_table bulk_action">
	          <tr class="even pointer">
	              <td class="column-title" style="background-color:#4a6075; color:#ECF0F1;">제목</td>
	              <td colspan="2" style="text-align:center;">${requestScope.approval.apprTitle }</td>
	              <td></td> 
	          </tr>
                  
              <tr class="even pointer">
                  <td class=" " style="background-color:#4a6075; color:#ECF0F1;">작성자</td>
                  <td class=" ">${requestScope.approval.employee.empName }</td>
                  <td class=" " style="background-color:#4a6075; color:#ECF0F1;">양식명</td>
                  <td class=" ">${requestScope.approval.template.tmpName }</td>
             </tr>
                       
			 <tr class="even pointer">
                  <td class=" " style="background-color:#4a6075; color:#ECF0F1;">부서</td>
				  <td class=" ">${requestScope.approval.employee.department }</td>
                  <td class=" " style="background-color:#4a6075; color:#ECF0F1;">보존기한</td>
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
              	  <td class=" " style="background-color:#4a6075; color:#ECF0F1;">작성일</td>
				  <td class=" ">${requestScope.approval.apprDate }</td>
                  <td class=" " style="background-color:#4a6075; color:#ECF0F1;">긴급여부</td>
				  <td class=" ">
					  <c:if test="${requestScope.approval.urgency ==1}">긴급</c:if>
				      <c:if test="${requestScope.approval.urgency ==0}"> 일반</c:if>
				  </td>
              </tr>
         </table>

		<%-- 기안서 내용 --%>
        <div>${requestScope.approval.apprContent }</div>
         
         <%-- 첨부파일--%>
		<c:if test="${fn:length(requestScope.approval.approvalFiles) >0 }">
			<table class="table table-striped jambo_table bulk_action">
				<tr>
					<th  class="headings" style="background-color:#4a6075; color:#ECF0F1;">파일번호</th>
					<th class="headings"style="background-color:#4a6075; color:#ECF0F1;" colspan="2">파일이름</th>							
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