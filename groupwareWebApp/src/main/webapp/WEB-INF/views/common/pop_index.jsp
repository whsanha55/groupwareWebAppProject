<%--index.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>전자결재관리시스템</title>
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>

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
<!-- bootstrap-wysiwyg -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/google-code-prettify/bin/prettify.min.css"
	rel="stylesheet">

</head>


<tiles:insertAttribute name="content" ignore="true" />



<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/vendors/starrr/dist/starrr.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script src="${pageContext.request.contextPath}/resources/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/google-code-prettify/src/prettify.js"></script>

</body>
</html>