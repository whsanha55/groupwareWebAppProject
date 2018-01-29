<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>코드 목록 조회</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>코드관리</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">

					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>코드목록</h2>
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target=".bs-example-modal-lg">등록하기</button>
						</div>
						<div class="modal fade bs-example-modal-lg" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">×</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">코드 등록</h4>
									</div>
									<div class="modal-body">
										<div></div>
										<table id="datatable"
											class="table table-striped table-bordered align-right">
											<tbody>
												<tr>
													<th>코드번호</th>
													<td><input type="text" class="form-control"
														required="required"></td>
												</tr>
												<tr>
													<th>코드명</th>
													<td><input type="text" class="form-control"
														required="required"></td>
												</tr>
											</tbody>
										</table>
										<br>
										<div class="text-center">
											<button type="button" class="btn btn-primary">등록</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="col-md-3 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span id="search_concept">검색</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#contains">코드번호</a></li>
											<li><a href="#its_equal">코드명</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all"
										id="search_param"> <input type="text"
										class="form-control" name="x" placeholder="Search term...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
				<table id="datatable"
					class="table table-striped table-bordered text-center">
					<thead>
						<tr>
							<th>코드번호</th>
							<th>코드명</th>
							<th>등록된 하위 코드 수</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<c:forEach var="code" items="${requestScope.codes }"
						varStatus="loop">
						<c:url var="url" value="/admin/listCode.do" scope="page">
							<c:param name="cNo" value="${pageScope.code.cNo }" />
						</c:url>
						<tbody>
							<tr>
								<td>${pageScope.code.cNo }</td>
								<td>${pageScope.code.cName }</td>
								<td>${pageScope.code.countRelationCode }</td>
								<td><button type="button" data-toggle="modal"
										data-target="#myModal">수정</button></td>
								<td></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">코드 수정</h4>
				</div>


				<div class="modal-body">
					<div></div>

					<table id="datatable" class="table table-striped table-bordered">
						<tbody>
							<tr>
								<th>코드번호</th>
								<td><input type="text" class="form-control"
									required="required" value="100"></td>
							</tr>
							<tr>
								<th>코드명</th>
								<td><input type="text" class="form-control"
									required="required" value="부서"></td>
							</tr>

						</tbody>
					</table>
					<br>
					<div class="text-center">
						<button type="button" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>