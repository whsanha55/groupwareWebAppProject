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
		
			$('#close').click(function() {
				window.close();
			});
	
	/* 	var temp = $('.apprLineAppr').length;
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
		 */
		
	

	
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
	                            
	                            <th class="column-title">순번</th>
	                            <th class="column-title">결재자</th>
	                            <th class="column-title">결재유형</th>
								<th class="column-title">배정일시</th>
	                            <th class="column-title">확인일시</th>
	                            <th class="column-title">결재일시</th>      
	                            
	                          </tr>
	                        </thead>
	
	                        <tbody>
	                         <c:forEach var="record" items="${requestScope.records}" >
							<c:if test="${pageScope.record.apprStatus<6 }">
								<tr class="even pointer">

	                            <td>${pageScope.record.receiverLine.lineOrder}</td>
	                            <td class=" ">${pageScope.record.receiverLine.lineEmployee.department} ${pageScope.record.receiverLine.lineEmployee.empName} ${pageScope.record.receiverLine.lineEmployee.duty}</td>
								
								<td class=" ">
									<c:if test="${pageScope.record.apprStatus==0}">진행중 </c:if>
									<c:if test="${pageScope.record.apprStatus==1}">결재 </c:if>
									<c:if test="${pageScope.record.apprStatus==2}">보류 </c:if>
									<c:if test="${pageScope.record.apprStatus==3}">반려 </c:if>
									<c:if test="${pageScope.record.apprStatus==4}">전결 </c:if>
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