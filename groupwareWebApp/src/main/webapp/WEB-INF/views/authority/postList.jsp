<%-- postList.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.authority.PostVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!--게시판 리스트 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>게시판</h2>

				<div class="clearfix"></div>
			</div>
			<div>
				<div class="btn-group">
					<button data-toggle="dropdown"
						class="btn btn-default dropdown-toggle" type="button"
						aria-expanded="false">
						검색조건 <span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu">
						<li><a href="#">문서종류</a></li>
						<li><a href="#">제목</a></li>
						<li><a href="#">부서구분</a></li>
						<li><a href="#">작성자</a></li>
					</ul>
					<div class="col-sm-3">
						<div id="imaginary_container">
							<div class="input-group stylish-input-group">
								<input type="text" class="form-control" placeholder="Search">
								<span class="input-group-addon" style="padding: 3px 10px">
									<button type="submit">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</div>

				</div>

			</div>
			<div class="x_content">



				<div class="table-responsive">
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th class="column-title">번호</th>
								<th class="column-title">문서종류</th>
								<th class="column-title">제목</th>
								<th class="column-title">부서구분</th>
								<th class="column-title">작성자</th>
								<th class="column-title">등록일</th>

							</tr>
						</thead>

						<tbody>
							<c:forEach var="post" items="${requestScope.posts }"
								varStatus="loop">
								<c:url var="url" value="/detailPost.do" scope="page">
									<c:param name="postNo" value="${pageScope.post.postNo }" />
								</c:url>
								<tr class="even pointer">
									<td>${fn:length(requestScope.posts) - loop.index }</td>
									<td>${pageScope.post.documentNo }</td>
									<td><a href="${pageScope.url }">${pageScope.post.postTiltle }</a></td>
									<td>${pageScope.post.cNo }</td>
									<td>${pageScope.post.writer }</td>
									<td>${pageScope.post.postDate }</td>									
								</tr>
							</c:forEach>
							
							<%-- <tr class="even pointer">
								<td class=" ">6</td>
								<td class=" ">회의문서</td>
								<td><a href='<c:url value="detailPost.do"/>'>회의문서입니다.<a></td>
								<td class=" ">영업부</td>
								<td class=" ">일길동</td>
								<td class=" ">2018.01.05</td>
							</tr>
							<tr class="even pointer">
								<td class=" ">5</td>
								<td class=" ">각종 증명서</td>
								<td><a data-toggle="modal" data-target="#myModal">업무문서
										작성용 폰트.<a></td>
								<td class=" ">영업부</td>
								<td class=" ">일길동</td>
								<td class=" ">2017.12.28</td>
							</tr>
							<tr class="even pointer">
								<td class=" ">4</td>
								<td class=" ">공문서</td>
								<td><a data-toggle="modal" data-target="#myModal">외주시
										계약서.<a></td>
								<td class=" ">영업부</td>
								<td class=" ">이길동</td>
								<td class=" ">2017.12.27</td>
							</tr>
							<tr class="even pointer">
								<td class=" ">3</td>
								<td class=" ">거래문서</td>
								<td><a data-toggle="modal" data-target="#myModal">회의록
										문서입니다.<a></td>
								<td class=" ">영업부</td>
								<td class=" ">삼길동</td>
								<td class=" ">2017.12.22</td>
							</tr>
							<tr class="even pointer">
								<td class=" ">2</td>
								<td class=" ">기타</td>
								<td><a data-toggle="modal" data-target="#myModal">기타입니다.<a></td>
								<td class=" ">영업부</td>
								<td class=" ">사길동</td>
								<td class=" ">2017.12.11</td>
							</tr>
							<tr class="even pointer">
								<td class=" ">1</td>
								<td class=" ">공문서</td>
								<td><a data-toggle="modal" data-target="#myModal">공문서입니다.<a></td>
								<td class=" ">영업부</td>
								<td class=" ">오길동</td>
								<td class=" ">2017.12.01</td>
							</tr> --%>
						</tbody>
					</table>
					<div>
						<div class="text-center">
							<ul class="pagination ">
								<li class="disabled"><a href="#"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#"><span
										class="glyphicon glyphicon-chevron-right"></span></a></li>
							</ul>
							<a class="btn btn-primary pull-right"
								href='<c:url value="addPost.do"/>'>글쓰기</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>