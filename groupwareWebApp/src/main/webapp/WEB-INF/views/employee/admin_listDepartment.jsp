<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>부서목록</title>

</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>부서관리</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-6">
							<div class="col-md-2">
								<h2>부서목록</h2>
							</div>
						</div>
						<div>
							<div class="col-xs-4 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span id="search_concept">검색</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">부서코드번호</a></li>
											<li><a href="#">부서명</a></li>
											<li><a href="#">책임자</a></li>
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
				<table id="datatable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>부서코드번호</th>
							<th>부서명</th>
							<th>업무 담당자</th>
							<th>담당자 연락처</th>
							<th>부서원</th>
							<th>부서별 팀 수</th>
						</tr>
					</thead>
					<tbody>
						<script>
							$(document).ready(function() {
								
							});
						</script>
						<c:forEach var="department" items="${requestScope.departments }" varStatus="loop">
							<tr>
								<td>${pageScope.department.cNo }</td>
								<td>${pageScope.department.cName }</td>
								<td><a data-toggle='modal' data-target='#myModal'>${pageScope.department.headDept }</a></td>
								<td>${pageScope.department.phoneNumber }</td>
								<td>${pageScope.department.memberCount }</td>
								<td>${pageScope.department.teamCount }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">부서원 검색</h4>
					※부서와 이름을 지정해주세요.
				</div>
				<div class="modal-body">
					<div>
						<div class="btn-group">
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="false">
								검색조건 <span class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li><a href="#">경영관리부</a></li>
								<li><a href="#">인사부</a></li>
								<li><a href="#">회계부</a></li>
								<li><a href="#">개발부</a></li>
								<li><a href="#">영업부</a></li>
							</ul>
							<div class="col-sm-6">
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
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">
									<th class="column-title">부서</th>
									<th class="column-title">직책</th>
									<th class="column-title">이름</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>경영관리부</td>
									<td class=" ">사장</td>
									<td class=" ">박병진</td>
								</tr>
								<tr>
									<td>경영관리부</td>
									<td class=" ">부사장</td>
									<td class=" ">원정우</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<div class="text-center">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>