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
			alert($(this).val());
			
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
							  	location.reload();
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
			<div class="x_content">
				<br>
				<form id="demo-form2" data-parsley-validate=""
					class="form-horizontal form-label-left">

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">일정구분</span>
						</label>&nbsp;&nbsp; 
						<c:choose>
							<c:when test="${requestScope.plan.pClass == 1}">
								회의
							</c:when>
							<c:when test="${requestScope.plan.pClass == 2}">
								교육
							</c:when>
							<c:otherwise>
								기타
							</c:otherwise>
						</c:choose>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">부서</span>
							</label>&nbsp;&nbsp; ${requestScope.plan.cName }
					</div>

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">제목
						</label> ${requestScope.plan.pTitle }
					</div>

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">기간
						</label> ${requestScope.plan.startDate } - ${requestScope.plan.endDate }
					</div>



					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">장소</label>
						<div class="col-md-6 col-sm-6 col-xs-12">${requestScope.plan.latitude },${requestScope.plan.longitude }</div>
					</div>


					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">내용 </label>
						${requestScope.plan.pContent }
					</div>

					<div class="col-md-12">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">중요도</label> 
						<c:choose>
							<c:when test="${requestScope.plan.pImpt == 1}">
								하
							</c:when>
							<c:when test="${requestScope.plan.pImpt == 2}">
								중
							</c:when>
							<c:otherwise>
								상
							</c:otherwise>
						</c:choose>
					</div>

					<div class="form-group form-inline">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">담당자 </label>&nbsp;&nbsp; ${requestScope.plan.empName }
					</div>
					
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="last-name">첨부파일 </label>&nbsp;&nbsp;
							<div class="btn-group">
								<c:forEach var="file" items="${requestScope.plan.files }" varStatus="loop">
									<c:url var="downloadUrl" value="/download.do">
										<c:param name="fileName" value="${pageScope.file.fileName }" />
										<c:param name="systemFileName" value="${pageScope.file.systemFileName }" />
									</c:url>
									<a href = "${pageScope.downloadUrl }">${pageScope.file.fileName }</a>
										<%-- <img src="${pageContext.request.contextPath}/upload/${pageScope.file.systemFileName}" 
										width="100%" height="100%" id="img" /> --%>
								</c:forEach>
							</div>
						</div>
					

					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">뒤로가기</button>
							<!-- <button class="btn btn-primary" type="reset">삭제</button> -->
							<c:url var="removeURL" value="/admin/removePlan.do" scope="page" >
								<c:param name="pNo" value="${requestScope.plan.pNo }" />
							</c:url>
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