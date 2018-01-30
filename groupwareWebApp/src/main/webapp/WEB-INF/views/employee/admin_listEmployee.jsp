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
				<h2>�������</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>������</h2>
							</div>
							<%-- <c:url var=registerEmployee value="/admin/registerEmployee.do" scope="page" /> --%>
							<button id="regisBtn" type="button" class="btn btn-primary" data-toggle="modal">
								����ϱ�
							</button>
						</div>
						<div class="col-md-3 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<span id="search_concept">�˻�����</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#�����ȣ">�����ȣ</a></li>
										<li><a href="#�̸�">�̸�</a></li>
										<li><a href="#��å">��å</a></li>
										<li><a href="#�μ�">�μ�</a></li>
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
									<th>���</th>
									<th>�̸�</th>
									<th>��å</th>
									<th>�μ�</th>
									<th>����ó</th>
									<th>�Ի�����</th>
									<th>�̸���</th>
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
						<span aria-hidden="true">��</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">��� ������ �� ����</h4>
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
									<th>���</th>
									<td><input type="text" class="form-control"
										disabled="disabled" placeholder="2018-00001"></td>
									<th>��å</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">��å</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">����</a></li>
															<li><a href="#its_equal">�λ���</a></li>
															<li><a href="#greather_than">����</a></li>
															<li><a href="#less_than">����</a></li>
															<li><a href="#greather">�븮</a></li>
															<li><a href="#less">���</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
								<tr>
									<th>�̸�</th>
									<td><input type="text" class="form-control"
										required="required" value="����"></td>
									<th>�����̸�</th>
									<td><input type="text" class="form-control"
										value="Kim Employee"></td>
								</tr>
								<tr>
									<th>����ó</th>
									<td><input type="text" class="form-control"
										required="required" value="010-2345-6789"></td>
									<th>�ֹι�ȣ</th>
									<td><input type="text" class="form-control"
										required="required" value="920815-1081614"></td>
								</tr>
								<tr>
									<th>�μ�</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">�μ�</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">�濵������</a></li>
															<li><a href="#its_equal">�λ��</a></li>
															<li><a href="#greather_than">ȸ���</a></li>
															<li><a href="#less_than">������</a></li>
															<li><a href="#greather">���ߺ�</a></li>
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
															<span id="search_concept">��</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">����1��</a></li>
															<li><a href="#its_equal">����2��</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
									<th>�̸���</th>
									<td><input type="text" class="form-control"
										required="required" value="java1234@naver.com"></td>
								</tr>
								<tr>
									<th>�Ի���</th>
									<td><input type="text" class="form-control"
										required="required" value="2018/01/01"></td>
									<th>���¹�ȣ</th>
									<td><input type="text" class="form-control"
										required="required" value="110-328-521548"></td>
								</tr>
								<tr>
									<th>�����</th>
									<td><input type="text" class="form-control" value="X"></td>
									<th>��翩��</th>
									<td><input type="text" class="form-control"
										required="required" value="X"></td>
								</tr>
								<tr>
									<th>�ּ�</th>
									<td colspan="3"><input type="text" class="form-control"
										required="required" value="����� ���ʱ� �������"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="text-center">
							<button type="button" class="btn btn-primary">����</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">�ݱ�</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>