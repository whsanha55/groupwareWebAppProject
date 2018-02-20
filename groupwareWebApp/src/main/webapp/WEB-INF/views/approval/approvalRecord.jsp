<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결재현황</title>

<style>
.x_panel {
	min-height: 280px;
}
.popover-title {
	text-align: center !important;
}


</style>

<script>

	$(document).ready(function(){

		$('#close').click(function() {
				window.close();
			});
		$('[data-toggle="popover"]').popover({
			html: true
		});  
	});


</script>



</head>

<body>

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>결재 현황</h2>
				
				<button type="button" class="btn btn-default" id="close" style="float:right;">확인</button>
			
				<div class="clearfix"></div>
			</div>
			
			<div class="table-responsive" id="datas">
			
				<table class="table table-striped jambo_table bulk_action" style="text-align:center;">
	                        <thead>
	                          <tr class="headings">
	                            
	                            <th class="column-title" style="text-align:center;">순번</th>
	                            <th class="column-title" style="text-align:center;">결재자</th>
	                            <th class="column-title" style="text-align:center;">결재유형</th>
								<th class="column-title" style="text-align:center;">배정일시</th>
	                            <th class="column-title" style="text-align:center;">확인일시</th>
	                            <th class="column-title" style="text-align:center;">결재일시</th>      
	                            
	                          </tr>
	                        </thead>
	
	                        <tbody>
	                         <c:forEach var="record" items="${requestScope.records}" >
							<c:if test="${pageScope.record.apprStatus<6 }">
								<tr class="even pointer">
								<c:if test="${record.receiverLine.lineOrder !=9}">
									<td>${pageScope.record.receiverLine.lineOrder}</td>
								</c:if>
								<c:if test="${record.receiverLine.lineOrder ==9}">
									<td>최종</td>
								</c:if>
								<c:choose>
									<c:when test="${record.depEmployee.empNo != null }">
										<td >
											<a data-toggle="popover" data-placement="bottom" style="cursor:pointer;"
											title="${pageScope.record.receiverLine.lineEmployee.department} 
			                            		   ${pageScope.record.receiverLine.lineEmployee.empName} 
			                            	       ${pageScope.record.receiverLine.lineEmployee.duty}" 
			                            	data-content = '사유 : ${record.depEmployee.deputies[0].depReason }
			                            	                &lt;br&gt; 대결 시작일자 : ${record.depEmployee.deputies[0].startDate}
			                            	                &lt;br&gt; 대결 종료일자 : ${record.depEmployee.deputies[0].endDate}'>
												&lt;대결&gt;
												${record.depEmployee.department}
												${record.depEmployee.empName}
												${record.depEmployee.duty}
											</a>
										</td>
									</c:when>
									<c:otherwise>
			                            <td class=" ">
			                            	${pageScope.record.receiverLine.lineEmployee.department} 
			                            	${pageScope.record.receiverLine.lineEmployee.empName} 
			                            	${pageScope.record.receiverLine.lineEmployee.duty}
			                            </td>
									</c:otherwise>
								</c:choose>
								
								
								<td class=" ">
									<c:if test="${pageScope.record.apprStatus==0}">미결 </c:if>
									<c:if test="${pageScope.record.apprStatus==1}">
										<c:choose>
											<c:when test="${pageScope.record.isDelegation==1}">
												전결
											</c:when>
											<c:otherwise>
												결재
											</c:otherwise>
										</c:choose>
									 </c:if>
									<c:if test="${pageScope.record.apprStatus==2}">보류 </c:if>
									<c:if test="${pageScope.record.apprStatus==3}">반려 </c:if>
									<%-- <c:if test="${pageScope.record.apprStatus==4}">전결 </c:if> --%>
									<c:if test="${pageScope.record.apprStatus==5}">대결 </c:if>
								</td>
	                            <td class=" ">${pageScope.record.assignDate}</td>
	                            <td class=" ">${pageScope.record.checkDate}</td>
	                            <td class=" ">${pageScope.record.confirmDate}</td>
	                                                        
								
	                          </tr>
	                         </c:if>
						</c:forEach>
					
					</tbody> 
	                      </table>
			</div>
				
				
		</div>
	</div>





</body>
</html>