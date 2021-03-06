<%-- error.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Error : <br>

<c:forEach var="stackTraceElement" items="${requestScope.exception.stackTrace }">
	${pageScope.stackTraceElement }<br>
</c:forEach>
 --%>
 
 <html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>관리자에게 문의하세요 </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/resources/vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md" style="background: white;">
    <div class="container body" style="margin-top:50px;">
      <div class="main_container">
        <!-- page content -->
        <div class="col-md-12">
          <div class="col-middle">
            <div class="text-center text-center">
              <img src="${pageContext.request.contextPath}/resources/images/warningSmall.png"  width="200px"/> 
              <h2 style="margin-top:20px;">시스템 이상으로 접속할 수 없습니다.</h2>
              <p>관리자에게 문의바랍니다. <br><a href="#">ztz33@naver.com</a><br><br>
              <a class="btn btn-default" href='#' onclick="goBack();">뒤로가기</a>
              </p>   
              
            </div>
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/resources/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/resources/vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/resources/build/js/custom.min.js"></script>
    
    <script type="text/javascript">
    	function goBack() {
    		window.history.back();
    	}
    </script>
  </body>
</html>