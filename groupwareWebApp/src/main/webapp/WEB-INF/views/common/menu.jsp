
<%-- content.jsp --%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
</head>
<body>



<div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>로고</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="${pageContext.request.contextPath}/resources/images/img.jpg" alt="..." class="img-circle profile_img">
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
                  <li><h3> 전자결재</h3>
                    <ul class="nav child_menu" style="display: block;">
						<li><a>기안 <span class="fa fa-chevron-down"></span></a>
						 <ul class="nav child_menu">
							  <li><a href="index2.html">문서 작성</a></li>
							  <li><a href="index3.html">임시 보관함</a></li>
							  <li><a href="index3.html">결재</a></li>
					     </ul>
						 <li><a>결재 <span class="fa fa-chevron-down"></span></a>
						 <ul class="nav child_menu">
							  <li><a href="index2.html">결재 대기함</a></li>
							  <li><a href="index3.html">결재 진행함</a></li>
					     </ul>
						 <li><a>완료 <span class="fa fa-chevron-down"></span></a>
						 <ul class="nav child_menu">
							  <li><a href="index2.html">승인 문서함</a></li>
							  <li><a href="index3.html">반려 문서함</a></li>
							  <li><a href="index3.html">결재</a></li>
					     </ul>
                    </ul>
                  </li>
				  <br>
                  <li><h3>게시판</h3>
                    <ul class="nav child_menu" style="display: block;">
                      <li><a href='<c:url value="/notice.do"/>'>공지사항</a></li>
                      <li><a href="article.html">게시판</a></li>
                    </ul>
                  </li>
				  <br>
                  <li><h3>마이페이지</h3>
                    <ul class="nav child_menu" style="display: block;">
                      <li><a href="general_elements.html">내 정보 조회/수정</a></li>
					  <li><a>개인설정 <span class="fa fa-chevron-down"></span></a>
						 <ul class="nav child_menu">
							  <li><a href="index2.html">서명설정</a></li>
							  <li><a href="index3.html">대결권자 설정</a></li>
					     </ul>
                    </ul>
                  </li>
                </ul>
              </div>
              

            </div>
</body>
</html>