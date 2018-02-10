<%@page import="com.bit.groupware.domain.employee.PlanVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정 상세보기</title>
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
							</label>&nbsp;&nbsp;
							<c:if test="${requestScope.plan.deptNo == 'A'}">
								전체
							</c:if>
							<c:if test="${requestScope.plan.deptNo != 'A'}">
								${requestScope.plan.cName }
							</c:if>
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
									<c:url var="downloadUrl" value="/downloadPlanFile.do">
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
							<c:url var="listPlanURL" value="/listPlanAll.do" scope="page" ></c:url>
								<a id="list" href="${pageScope.listPlanURL }"  ><button class="btn btn-primary" type="button">목록</button></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>