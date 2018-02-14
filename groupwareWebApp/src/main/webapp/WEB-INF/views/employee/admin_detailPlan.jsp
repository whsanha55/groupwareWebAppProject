<%@page import="com.bit.groupware.domain.employee.PlanVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정 상세보기</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=ad3a3657ebba1b7547bc9c0a370b50dc&libraries=services"></script>
<script type="text/javascript">
	/* function msg() {
		if(confirm("이 일정을 삭제하시겠습니까?") == true) {
			alert("일정이 삭제되었습니다.")
			return true;
		} else {
			return false;
		}
	} */
</script>
<script>
	$(document).ready(function(){
		
		$('#modify').on('click', function() {
			var pNo = $(this).val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/modifyPlan.do'
				,
				method: 'GET'
				,
				data: {pNo}
				, 
				async: true
				,
				cache: false
				,
				success: function(data) {
					location.href="${pageContext.request.contextPath}/admin/modifyPlan.do?pNo=" + pNo;
				}
				, 
				error: function(jqXHR) {
					alert('Error : ' + jqXHR.status);
				}	 				
			});	
		})
		
		$('#remove').on('click', function() {
			var pNo = $(this).val();
			
			swal({
				 title: "일정 삭제",
				 text: "일정을 삭제합니다. 계속 진행하시겠습니까?",
				 icon: "info",
				 buttons : true	
			}).then((e) => {
				if(e) {
					removePlan(pNo);
				}
			});
			
			alert($(this).val());
			function removePlan(pNo) {	
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/removePlan.do'
					,
					method: 'GET'
					,
					data: {pNo}
					, 
					async: true
					,
					cache: false
					,
					success: function(data) {
						swal({
							  title: "삭제 완료",
							  text: "일정이 삭제되었습니다.",
							  icon: "info",
							  buttons : "확인" 
						}).then((e) => {
							if(e) {
								location.href='${pageScope.request.ContextPath}/groupware/admin/listPlan.do'
							}
						});		
					}
					, 
					error: function(jqXHR) {
						alert('Error : ' + jqXHR.status);
					}	 				
				});	
			}
		});
	});
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>일정 상세보기</h2>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="profile_title">
						<div class="col-md-6">
							<h2></h2>
						</div>
						<div class="col-md-6"></div>
					</div>
					<table id="datatable" class="table table-striped table-bordered" style="font-size:16px;">
						<tbody>
							<tr>
								<th>일정구분</th>
								<td id="pClass">
									<c:choose>
										<c:when test="${requestScope.plan.pClass == 1}">
											<div>회의</div>
										</c:when>
										<c:when test="${requestScope.plan.pClass == 2}">
											<div>교육</div>
										</c:when>
										<c:otherwise>
											<div>기타</div>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>부서</th>
								<td id="deptNo"><c:if test="${requestScope.plan.deptNo == 'A'}">
								<div>전체</div>
							</c:if>
							<c:if test="${requestScope.plan.deptNo != 'A'}">
								<div>${requestScope.plan.cName }</div>
							</c:if></td>
							</tr>
							<tr>
								<th>제목</th>
								<td id="pTitle">${requestScope.plan.pTitle }</td>
							</tr>
							<tr>
								<th>기간</th>
								<td id="date">${requestScope.plan.startDate } ~ ${requestScope.plan.endDate }</td>
							</tr>
							<tr>
								<th>담당자</th>
								<td id="empName">${requestScope.plan.empName } ${requestScope.plan.dutyName }</td>
							</tr>
							<tr>
								<th>장소</th>
								<td id="destination">${requestScope.plan.destination }</td>
								<input type="hidden" id="latitude" name="latitude"
									 value="${requestScope.plan.latitude }">
								<input type="hidden" id="longitude" name="longitude"
									 value="${requestScope.plan.longitude }">
							</tr>
							<tr>
								<th>상세위치</th>
								<td id="map">
									<div id="map" style="width:300px;height:300px"></div>
									<script>							
									$(document).ready(function() {
										daum.maps.load(function() {
											mapContainer = document.getElementById('map'), 								
											mapCenter = new daum.maps.LatLng($('#latitude').val(), $('#longitude').val()),
											mapOptions = { 
												center: mapCenter,
												level: 3 
											};
												
											var map = new daum.maps.Map(mapContainer, mapOptions);
											
											var mapTypeControl = new daum.maps.MapTypeControl();
											
											map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
											
											var zoomControl = new daum.maps.ZoomControl();
											map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
											
											var centerMarker = new daum.maps.Marker({ 
											    position: map.getCenter() 
											});	
												
											centerMarker.setMap(map);
								
											var iwContent = '<div style="padding:5px;text-align:center;color:red">${requestScope.plan.destination} &nbsp; <a href="http://map.daum.net/link/to/목적지,${requestScope.plan.latitude},${requestScope.plan.longitude}" style="color:blue" target="_blank">길찾기</a></div>',
												iwRemoveable = true;
												
											var infowindow = new daum.maps.InfoWindow({
												position : map.getCenter(),
												content : iwContent
											});
											
											infowindow.open(map, centerMarker);
											
											map.setDraggable(false);
											map.setZoomable(false);
											
										});
									});
									</script>
								</div>
							</td>
							</tr>
							<tr>
								<th>내용</th>
								<td id="pContent">
									${requestScope.plan.pContent }
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td id="planFile"><div class="btn-group">
								<c:forEach var="file" items="${requestScope.plan.files }" varStatus="loop">
									<c:url var="downloadUrl" value="/downloadPlanFile.do">
										<c:param name="fileName" value="${pageScope.file.fileName }" />
										<c:param name="systemFileName" value="${pageScope.file.systemFileName }" />
									</c:url>
									<a href = "${pageScope.downloadUrl }">${pageScope.file.fileName }</a>
										<%-- <img src="${pageContext.request.contextPath}/upload/${pageScope.file.systemFileName}" 
										width="100%" height="100%" id="img" /> --%>
								</c:forEach>
							</div></td>
							</tr>
						</tbody>
					</table>
				</div>

					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<c:url var="listPlanURL" value="/admin/listPlan.do" scope="page" ></c:url>
									<a id="list" href="${pageScope.listPlanURL }"  ><button class="btn btn-primary" type="button">목록</button></a>
							<%-- <c:url var="removeURL" value="/admin/removePlan.do" scope="page" >
								<c:param name="pNo" value="${requestScope.plan.pNo }" />
							</c:url> --%>
							<button type="button" value="${requestScope.plan.pNo }" id="remove" class="btn btn-primary" >삭제</button>
							<button type="button" value="${requestScope.plan.pNo }" id="modify" class="btn btn-success" >수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>