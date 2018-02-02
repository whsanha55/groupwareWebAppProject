<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>게시글</h2>
				<div class="text-right">
					<c:url var="modifyUrl" value="/modifyPost.do" scope="page">
						<c:param name="postNo" value="${requestScope.post.postNo }" />
					</c:url>
					<c:url var="removeUrl" value="/removePost.do" scope="page">
						<c:param name="postNo" value="${requestScope.post.postNo }" />
					</c:url>
                  	<a class="btn btn-primary" href="${modifyUrl}">수정</a>
                  	<a class="btn btn-danger" href="${removeUrl}">삭제</a>
                  	
					<a class="btn btn-primary" href='<c:url value="postList.do"/>'>목록</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div>
				<table class="table table-striped jambo_table bulk_action">
					<tr>
						<td  width=200 style="word-break:break-all">제목</td>
						<td>${requestScope.post.postTitle}</td>
					</tr>
					<tr>
						<td>부서구분</td>
						<td>${requestScope.post.cNo}</td>
					</tr>
					<tr>
						<td>문서종류</td>
						<td>${requestScope.post.documentNo}</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="2"><c:forEach var="file" items="${requestScope.post.postFiles }" varStatus="loop">
						${pageScope.file.originalFileName}<br>
						</c:forEach></td>
					</tr>
					<tr height="150">
						<td>내용</td>
						<td colspan="2">${requestScope.post.postContent}<br></td>
					</tr>
				</table>
			</div>
			<div class="ln_solid"></div>
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">홍길동
				</label>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<textarea class="resizable_textarea form-control"
						placeholder="댓글작성"></textarea>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
