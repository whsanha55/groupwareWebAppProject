<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeHistoryVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원_이력조회</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>이력조회</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div class="col-md-6"></div>
				</div>
				<table id="datatable"
					class="table table-striped jambo_table bulk_action" style="text-align:center;">
					<thead>
						<tr>
							<th class="text-center">부서</th>
							<th class="text-center">직책</th>
							<th class="text-center">시작일</th>
							<th class="text-center">종료일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${requestScope.codeHistories } == null" > 			
								<tr><td colspan=4>조회된 검색결과가 없습니다</td></tr>	
							</c:when>
							<c:otherwise>
								<c:forEach var="codeHistory" items="${requestScope.codeHistories }" varStatus="loop" >
									<tr>
										<td>${pageScope.codeHistory.deptName }</td>
										<td>${pageScope.codeHistory.dutyName }</td>
										<td>${pageScope.codeHistory.startDate }</td>
										<td>${pageScope.codeHistory.endDate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>