<%-- error.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

Error : <br>

<c:forEach var="stackTraceElement" items="${requestScope.exception.stackTrace }">
	${pageScope.stackTraceElement }<br>
</c:forEach>
