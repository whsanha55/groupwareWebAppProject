<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	$(document).ready(function() {
		$('#regisBtn').click(function(){
			location.href="${pageContext.request.contextPath}/admin/registerEmployee.do";
		});
	});
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>사원관리</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>사원명부</h2>
							</div>
							<%-- <c:url var=registerEmployee value="/admin/registerEmployee.do" scope="page" /> --%>
							<button id="regisBtn" type="button" class="btn btn-primary" data-toggle="modal">
								등록하기
							</button>
						</div>
						<div class="col-md-3 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<span id="search_concept">검색조건</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#사원번호">사원번호</a></li>
										<li><a href="#이름">이름</a></li>
										<li><a href="#직책">직책</a></li>
										<li><a href="#부서">부서</a></li>
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
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>직책</th>
									<th>부서</th>
									<th>연락처</th>
									<th>입사일자</th>
									<th>이메일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="employee" items="${requestScope.employees }" varStatus="loop">
								<tr>
									<td><a data-toggle="modal" data-target="#myModal">${pageScope.employee.empNo}</a></td>
									<td>${pageScope.employee.empName}</td>
									<td>${pageScope.employee.duty}</td>
									<td>${pageScope.employee.department}</td>
									<td>${pageScope.employee.phoneNumber}</td>
									<td>${pageScope.employee.hireDate}</td>
									<td>${pageScope.employee.email}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">사원 상세정보 및 수정</h4>
				</div>
				<div class="modal-body">
					<div>
						<div class="col-md-5 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img class="img-responsive avatar-view"
										src="images/picture.jpg" alt="Avatar"
										title="Change the avatar">
								</div>
							</div>
							<br> <input type="file" data-role="magic-overlay"
								data-target="#pictureBtn" data-edit="insertImage">
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img class="img-responsive avatar-view"
										src="images/picture.jpg" alt="Avatar"
										title="Change the avatar">
								</div>
							</div>
						</div>
						<br> <br> <br>
						<table id="datatable" class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th>사번</th>
									<td><input type="text" class="form-control"
										disabled="disabled" placeholder="2018-00001"></td>
									<th>직책</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">직책</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">사장</a></li>
															<li><a href="#its_equal">부사장</a></li>
															<li><a href="#greather_than">부장</a></li>
															<li><a href="#less_than">팀장</a></li>
															<li><a href="#greather">대리</a></li>
															<li><a href="#less">사원</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" class="form-control"
										required="required" value="김사원"></td>
									<th>영문이름</th>
									<td><input type="text" class="form-control"
										value="Kim Employee"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" class="form-control"
										required="required" value="010-2345-6789"></td>
									<th>주민번호</th>
									<td><input type="text" class="form-control"
										required="required" value="920815-1081614"></td>
								</tr>
								<tr>
									<th>부서</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">부서</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">경영관리부</a></li>
															<li><a href="#its_equal">인사부</a></li>
															<li><a href="#greather_than">회계부</a></li>
															<li><a href="#less_than">영업부</a></li>
															<li><a href="#greather">개발부</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">팀</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">영업1팀</a></li>
															<li><a href="#its_equal">영업2팀</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
									<th>이메일</th>
									<td><input type="text" class="form-control"
										required="required" value="java1234@naver.com"></td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><input type="text" class="form-control"
										required="required" value="2018/01/01"></td>
									<th>계좌번호</th>
									<td><input type="text" class="form-control"
										required="required" value="110-328-521548"></td>
								</tr>
								<tr>
									<th>퇴사일</th>
									<td><input type="text" class="form-control" value="X"></td>
									<th>퇴사여부</th>
									<td><input type="text" class="form-control"
										required="required" value="X"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="3"><input type="text" class="form-control"
										required="required" value="서울시 서초구 테헤란로"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="text-center">
							<button type="button" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>