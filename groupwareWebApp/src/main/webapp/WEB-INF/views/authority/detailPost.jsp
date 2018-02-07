<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	$(document)
			.ready(
					function() {

						// listReply(); // **댓글 목록 불러오기
						//listReply2(); // ** json 리턴방식

						// ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
						$("#btnReply")
								.click(
										function() {
											var cmtContent = $("#cmtContent")
													.val();
											var postNo = "${requestScope.post.postNo }"
											var param = "cmtContent="
													+ cmtContent + "&postNo="
													+ postNo;
											$
													.ajax({
														type : "POST",
														url : "${pageContext.request.contextPath}/insert.do",
														data : param,
														success : function() {
															alert("댓글이 등록되었습니다.");
															location.reload();
														}
													});
										});

						// Controller방식
						// **댓글 목록1
						function listReply() {
							$
									.ajax({
										type : "GET",
										url : "${pageContext.request.contextPath}/list.do?postNo=${requestScope.post.postNo }",
										success : function(result) {
											// responseText가 result에 저장됨.
											$("#listReply").html(result);
										}
									});
						}
						// RestController방식 (Json)
						// **댓글 목록2 (json)
						function listReply2() {
							$
									.ajax({
										type : "GET",
										//contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
										url : "postNo/listJson.do?postNo=${requestScope.post.postNo }",
										success : function(result) {
											console.log(result);
											var output = "<table>";
											for ( var i in result) {
												output += "<tr>";
												output += "<td>"
														+ result[i].userName;
												output += "("
														+ changeDate(result[i].regdate)
														+ ")<br>";
												output += result[i].replytext
														+ "</td>";
												output += "<tr>";
											}
											output += "</table>";
											$("#listReply").html(output);
										}
									});
						}
					});
</script>
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
					<a class="btn btn-primary" href="${modifyUrl}">수정</a> <a
						class="btn btn-danger" href="${removeUrl}">삭제</a> <a
						class="btn btn-primary" href='<c:url value="postList.do"/>'>목록</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div>
				<table class="table table-striped jambo_table bulk_action">
					<tr>
						<td width=200 style="word-break: break-all">제목</td>
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
								<c:url var="downloadUrl" value="/downloadFile.do">
									<c:param name="originalFileName"
										value="${pageScope.file.originalFileName }" />
									<c:param name="systemFileName"
										value="${pageScope.file.systemFileName }" />
								</c:url>
								<a href="${pageScope.downloadUrl }">${pageScope.file.originalFileName}</a>
								<br>
							</c:forEach></td>
					</tr>
					<tr height="150">
						<td>내용</td>
						<td colspan="2">${requestScope.post.postContent}<br></td>
					</tr>
				</table>
			</div>
			<div class="ln_solid"></div>


			<!--------------------- 댓글 ----------------------->
			<!-- 댓글 조회 -->
			<div>
			<c:if test="${fn: length(sessionScope.post.cmts ) > 0 }">
				<table>
					<c:forEach var="cmt" items="${sessionScope.post.cmts }"
						varStatus="loop">
						<tr>
							<td>${pageScope.cmt.cmtWriter }</td>
							<td>(${pageScope.cmt.cmtDate })</td>
						</tr>
						<tr>
							<td colspan="2">${pageScope.cmt.cmtContent }</td>
							<%-- <td><button type="button"  value="${pageScope.cmt.cmtNo }"  id="deleteBtn" class="btn btn-primary pull-right" >삭제</button></td> --%>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			</div>
			

			<!-- 댓글 입력 -->
			<div style="width: 200px; text-align: center;">
				<br>
				<textarea rows="5" cols="80" id="cmtContent"
					placeholder="댓글을 작성해주세요"></textarea>
				<br>
				<button type="button" id="btnReply">댓글 작성</button>
			</div>




		</div>
	</div>
</body>
</html>
