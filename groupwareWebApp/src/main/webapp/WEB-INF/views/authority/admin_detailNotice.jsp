<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>공지사항</h2>
				<div class="text-right">
				<c:url var="modifyUrl" value="/admin/modifyNotice.do" scope="page">
					<c:param name="noticeNo" value="${requestScope.notice.noticeNo }" />
				</c:url>
                  <a class="btn btn-primary" href="${modifyUrl}">수정</a>
                  <a class="btn btn-primary" href='<c:url value="/admin/noticeList.do"/>'>목록</a>
               </div>
				<div class="clearfix"></div>
			</div>
			<div>
				<table class="table table-striped jambo_table bulk_action">
					<tr>
						<td>${requestScope.notice.noticeNo}</td>
						<td>${requestScope.notice.noticeTitle}</td>

					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="2"><c:forEach var="file" items="${requestScope.notice.files }" varStatus="loop">
						${pageScope.file.originalFileName}<br>
						</c:forEach></td>
					</tr>
					<tr height="100">
						<td>내용</td>
						<td colspan="2">${requestScope.notice.noticeContents}<br></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>