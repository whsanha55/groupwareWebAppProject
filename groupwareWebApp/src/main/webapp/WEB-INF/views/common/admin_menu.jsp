
<%-- content.jsp --%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url var="url1" value="/admin/admin_authority.do" scope="page">
</c:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
</head>
<body>
	<div class="navbar nav_title" style="border: 0;">
		<a href='<c:url value="/admin/index.do"/>' class="site_title"><i class="fa fa-paw"></i>
			<span>로고</span></a>
	</div>
	<div class="clearfix"></div>
	<br>

	<!-- sidebar menu -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		<div class="menu_section">
			<ul class="nav side-menu">
				<li><h3>결재관리</h3>
					<ul class="nav child_menu" style="display: block;">
						<li><a href='<c:url value="/admin/approval.do" />'>결재조회</a></li>
						<li><a href='<c:url value="/admin/template.do" />'>양식관리</a></li>
					</ul></li>
				<br>
				<li><h3>권한관리</h3>
					<ul class="nav child_menu" style="display: block;">
						<li class=""><a>관리 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none;">
								<%-- <li><a href="${pageScope.url1 }">권한 관리</a></li> --%>
								<li><a href='<c:url value="/admin/authorityAllList.do"/>'>권한
										관리</a></li>
								<li><a href='<c:url value="/admin/roleList.do"/>'>역할 관리</a></li>
							</ul></li>
						<li><a>커뮤니티 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href='<c:url value="/admin/noticeList.do"/>'>공지사항 관리</a></li>
								<li><a href='<c:url value="/admin/board.do"/>'>게시판 관리</a></li>
							</ul></li>
					</ul></li>
				<br>
				<li><h3>인사관리</h3>
				<c:url var="listEmployee" value="/admin/listEmployee.do" scope="page"/>
				<c:url var="listCode" value="/admin/listCode1.do" scope="page"/>
				<c:url var="listCodeHistory" value="/admin/listCodeHistory.do" scope="page"/>
				<c:url var="listDepartment" value="/admin/listDepartment.do" scope="page"/>
				<c:url var="callendar" value="/admin/Callendar.do" scope="page"/>
					<ul class="nav child_menu" style="display: block;">
						<li><a>사원관리 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href='${pageScope.listEmployee }'>사원명부</a></li>
								<li><a href="${pageScope.listCodeHistory }">이력조회</a></li>
							</ul>
						<li><a href="${pageScope.listCode }">코드관리</a></li>
						<li><a href="${pageScope.listDepartment }">부서관리</a></li>
						<li><a href="${pageScope.callendar }">일정관리</a></li>
					</ul></li>
			</ul>
		</div>


	</div>
	<!-- /sidebar menu -->



</body>
</html>