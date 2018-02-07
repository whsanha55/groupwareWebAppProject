
<%-- content.jsp --%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	$(document).ready(function(){
		$.ajax({
			url: '${pageContext.request.contextPath}/menuAjax.do'	
			,
			method : 'GET'
			,
			data : $(".boardList").attr("id")
			,
			dataType : 'json'
			,
			async : true
			,
			cache : false
			,
			success : function(data, textStatus, jqXHR){
				var htmlStr = "";
				for(var i=0; i<data.length; i++){
					htmlStr += "<li id=" +data[i].boardNo + " class='boardList'><a href='<c:url value='/postList.do'/>'>" + data[i].boardName + "</a></li>" ; 
					}
					$('#boardNameList').html(htmlStr);
				}
			,
			error: function(jqXHR, textStatus, errorThrown) {
  				alert('error : ' + jqXHR.status);
  			}	
		});
	});
</script>
<title>content</title>

<style>
	#todo, #ref {
		font-size: 10px;
		font-weight: bolder;
		color: red;
	}
</style>

<script>
	$(document).ready(function(){
		$.ajax({
			url: '${pageContext.request.contextPath}/newMark.do'
			,
			method: 'POST'
			,
			dataType: 'json'
			,
			success: function(data){
				if(data.todoCount != 0) $('#todo').text(data.todoCount);
				if(data.refCount != 0) $('#ref').text(data.refCount);
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}			
		});	
	});//end of document.ready

	
	
</script>


</head>
<body>



	<div class="navbar nav_title" style="border: 0;">
		<a href='<c:url value="index.do"/>' class="site_title"><i class="fa fa-paw"></i>
			<span>로고</span></a>
	</div>

	<div class="clearfix"></div>

	<!-- menu profile quick info -->
	<div class="profile clearfix">
		<div class="profile_pic">
			<img src="${pageContext.request.contextPath}/resources/images/img.jpg"
				alt="..." class="img-circle profile_img">
		</div>
		<div class="profile_info">
			<span>Welcome,</span>
			<h2>John Doe</h2>
		</div>
	</div>
	<!-- /menu profile quick info -->

	<br />

	<!-- sidebar menu -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		<div class="menu_section">
			<ul class="nav side-menu">
				<li><h3>전자결재</h3>
					<ul class="nav child_menu" style="display: block;">
						<li><a>기안 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href='<c:url value="/selectTemplate.do"/>'>문서 작성</a></li>
								<li><a href='<c:url value="/approvalTemp.do"/>'>임시 보관함</a></li>
								<li><a href='<c:url value="/approvalMyRequest.do"/>'>결재
										요청함</a></li>
							</ul>
						<li><a>결재 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href='<c:url value="/approvalTodo.do"/>'>결재 대기함&nbsp;&nbsp;<span id="todo"></span></a></li>
								<li><a href='<c:url value="/approvalProceed.do"/>'>결재
										진행함</a></li>
							</ul>
						<li><a>참조 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href='<c:url value="/approvalRef.do"/>'>참조 문서함&nbsp;&nbsp;<span id="ref"></span></a></li>
							</ul>
						<li><a>완료 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href='<c:url value="/approvalFinish.do"/>'>승인
										문서함</a></li>
								<li><a href='<c:url value="/approvalReject.do"/>'>반려
										문서함</a></li>
							</ul>
					</ul></li>
				<br>
				<li><h3>게시판</h3>
					<ul class="nav child_menu" style="display: block;">
						<li><a href='<c:url value="/noticeList.do"/>'>공지사항</a></li>
						<li><a>게시판 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" i id="boardNameList">
								<li><a href='<c:url value="/postList.do"/>'>게시판</a></li>
							</ul>
					</ul></li>
				<br>
				<c:url var="detailEmployee" value="/detailEmployee.do" scope="page"/>
				<c:url var="retrieveSign" value="/retrieveSign.do" scope="page"/>
				<c:url var="registerDeputy" value="/registerDeputy.do" scope="page"/>
				<c:url var="listPlan" value="/listPlan.do" scope="page"/>
				<c:url var="listCodeHistory" value="/listCodeHistory.do" scope="page"/>
				<li><h3>마이페이지</h3>
					<ul class="nav child_menu" style="display: block;">
						<li><a href="${pageScope.detailEmployee }">내 정보 조회/수정</a></li>
						<li><a>개인설정 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href="${pageScope.retrieveSign }">서명설정</a></li>
								<li><a href="${pageScope.registerDeputy }">대결권자 설정</a></li>
							</ul>
						<li><a href="${pageScope.listPlan }">일정조회</a></li>
						<li><a href="${pageScope.listCodeHistory }">이력조회</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</body>
</html>