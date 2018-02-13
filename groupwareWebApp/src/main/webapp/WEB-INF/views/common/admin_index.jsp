<%--admin_index.jsp --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String footer = request.getParameter("admin_footer") + ".jsp";
	String header = request.getParameter("admin_header") + ".jsp";
	String content = request.getParameter("admin_content") + ".jsp";
	String menu = request.getParameter("admin_menu") + ".jsp";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cont

ent-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico"
	type="image/ico" />

<title>전자결재관리시스템</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath}/resources/css/custom.min.css"
	rel="stylesheet">
	
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
		
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<tiles:insertAttribute name="menu" ignore="true" />
				</div>
			</div>
		</div>
		
		<!-- top navigation -->
		<div class="top_nav">
			<tiles:insertAttribute name="header" />
		</div>
		<!-- /top navigation -->

		<!-- page content -->
		<div class="right_col" role="main">
		<tiles:insertAttribute name="content"  ignore="true"/>
		</div>

		<!-- end of weather widget -->

		</div>
		<!-- /page content -->
		<footer> <tiles:insertAttribute name="footer" ignore="true" /></footer>

	
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>

</body>
</html>