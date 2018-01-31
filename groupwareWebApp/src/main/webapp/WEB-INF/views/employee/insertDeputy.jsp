<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대결권자 등록</title>
<script>
	$(document).ready(function () {		
		$('#keyfieldItem li > a').on('click', function() {
		    $('#keyfieldBtn').text($(this).text());
		});
		
		$('#pushBtn').click(function() {
			$('#myModal').modal('hide');
			$('#empName').val($('#deptHead').text());
		});
		/* 
		$('#submitBtn').submit(function() {
	
			$.ajax ({
				url : '${pageContext.request.contextPath}/registerDeputy.do'
				,
				method : 'POST'
				,
				dataType : 'json'
				,
				data : {
					
				}
				,
				success : function(data) {
		
				}
				,
				error : function(jqXHR) {
					
				}
					
			});
			
		});	 */
	});
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>대결권자 설정</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group form-inline">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="empName">대결권자 지정 :</label>&nbsp;&nbsp;
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="empName" name="empName" class="form-control" readonly><span class="input-group-btn">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#myModal">검색</button>
							</span>
						</div>
					</div>
					<div class="form-group form-inline col-md-12">
						<div class="form-group">
							<label for="ex3">기간지정 :</label> <input type="date" id="startDate"
								class="form-control" name="startDate">
						</div>
						<div class="form-group">
							<label for="ex4">~</label> <input type="date" id="endDate"
								class="form-control" name="endDate">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="depReason">사유 :</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="depReason" name="depReason"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button id="submitBtn" type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
					<div class="ln_solid"></div>
					<table id="datatable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>사번</th>
								<th>이름</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>사유</th>
								<th>진행여부</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="deputy" items="${requestScope.deputies}" varStatus="loop">
								<c:forEach var="employee" items="${pageScope.deputy.employees }">
								<tr>
									<td>${pageScope.deputy.dempNo }</td>
									<td>${pageScope.employee.empName }</td>
									<td>${pageScope.deputy.startDate }</td>
									<td>${pageScope.deputy.endDate }</td>
									<td>${pageScope.deputy.depReason }</td>
									<td>${pageScope.deputy.progression }</td>
									<td><button type="button">상세보기</button></td>
								</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</form>
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
					<h4 class="modal-title" id="myModalLabel">대결권자 지정</h4>
					※부서와 이름, 기간을 지정해주세요.
				</div>
				<div class="modal-body">
					<div>
						<div class="btn-group">
							<button data-toggle="dropdown"
								id="keyfieldBtn" value="keyfield" class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="true">
								검색조건 <span class="caret"></span>
							</button>
							<ul id="keyfieldItem" role="menu" class="dropdown-menu">
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#" value="경영관리부">경영관리부</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#" value="인사부">인사부</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#" value="회계부">회계부</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#" value="영업부">영업부</a>
								</li>
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#" value="개발부">개발부</a>
								</li>
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
								<tr id="pushBtn" class="even pointer">
									<td>영업부</td>
									<td class=" ">부장</td>
									<td id="deptHead" class=" ">영부장</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<div class="text-center">
						<%-- <button id="pushBtn" type="button" class="btn btn-primary">설정</button> --%>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>