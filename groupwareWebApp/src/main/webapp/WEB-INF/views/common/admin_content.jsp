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
						<a href='<c:url value="/admin/approval.do"/>'><i class="fa fa-chevron-circle-down fa-5x"
							aria-hidden="true"></i>
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
						<a href='<c:url value="/admin/template.do"/>'><i class="fa fa-briefcase fa-5x" aria-hidden="true"></i>
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
						<a href='<c:url value="/admin/listCode1.do"/>'><i class="fa fa-smile-o fa-5x" aria-hidden="true"></i>
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/listCode1.do"/>'><strong>코드</strong></a>
						</h2>
					</dd>
				</dl>
			</div>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<a href='<c:url value="/admin/listPlan.do"/>'><i class="fa fa-comments-o fa-5x" aria-hidden="true"></i>
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
						<a href='<c:url value="/admin/listEmployee.do"/>'><i class="fa fa-picture-o fa-5x" aria-hidden="true"></i></a>
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
						<a href='<c:url value="/admin/noticeList.do"/>'><i class="fa fa-file-text fa-5x" aria-hidden="true"></i></a>
					</dt>
					<dd>
						<h2 class="text-center">
							<a href='<c:url value="/admin/noticeList.do"/>'><strong>공지사항</strong></a>
						</h2>
					</dd>
				</dl>
			</div>
		</div>

	</div>

</body>
</html>