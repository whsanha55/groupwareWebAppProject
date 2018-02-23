<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
</head>
<body>


	<br>
	<!-- /top tiles -->

	<div class="row">
		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<a href='<c:url value="/admin/approval.do"/>'><img alt="결재" src="${pageContext.request.contextPath}/resources/images/icon6.png">
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/approval.do"/>'><strong>결재</strong></a>
						</h2>
					</dd>
				</dl>
			</div>
		</div>

		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<a href='<c:url value="/admin/template.do"/>'><img alt="양식" src="${pageContext.request.contextPath}/resources/images/icon2.png">
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/template.do"/>'><strong>양식</strong></a>
						</h2>
					</dd>
				</dl>
			</div>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<a href='<c:url value="/admin/listDepartment.do"/>'><img alt="부서" src="${pageContext.request.contextPath}/resources/images/icon8.png">
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/listDepartment.do"/>'><strong>부서</strong></a>
						</h2>
					</dd>
				</dl>
			</div>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<a href='<c:url value="/admin/listPlan.do"/>'><img alt="일정" src="${pageContext.request.contextPath}/resources/images/icon5.png"></i>
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/listPlan.do"/>'><strong>일정</strong></a>
						</h2>
					</dd>
				</dl>
			</div>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<a href='<c:url value="/admin/listEmployee.do"/>'><img alt="사원" src="${pageContext.request.contextPath}/resources/images/icon1.png" ></a>
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/listEmployee.do"/>'><strong>사원</strong></a>
						</h2>
					</dd>
				</dl>

			</div>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<a href='<c:url value="/admin/noticeList.do"/>'><img alt="공지사항" src="${pageContext.request.contextPath}/resources/images/icon4.png"></a>
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/noticeList.do"/>'><strong>공지사항</strong></a>
						</h2>
					</dd>
				</dl>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<img alt="admin" src="${pageContext.request.contextPath}/resources/images/admin.jpg" width=100%; height=100%;/>
			</div>
		</div>

	</div>

</body>
</html>