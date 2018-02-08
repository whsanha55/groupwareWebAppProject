<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�μ����</title>

</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>�μ�����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-6">
							<div class="col-md-2">
								<h2>�μ����</h2>
							</div>
						</div>
						<div>
							<div class="col-xs-4 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span id="search_concept">�˻�</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">�μ��ڵ��ȣ</a></li>
											<li><a href="#">�μ���</a></li>
											<li><a href="#">å����</a></li>
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
							<th>�μ��ڵ��ȣ</th>
							<th>�μ���</th>
							<th>���� �����</th>
							<th>����� ����ó</th>
							<th>�μ���</th>
							<th>�μ��� �� ��</th>
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
						<span aria-hidden="true">��</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�μ��� �˻�</h4>
					�غμ��� �̸��� �������ּ���.
				</div>
				<div class="modal-body">
					<div>
						<div class="btn-group">
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="false">
								�˻����� <span class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li><a href="#">�濵������</a></li>
								<li><a href="#">�λ��</a></li>
								<li><a href="#">ȸ���</a></li>
								<li><a href="#">���ߺ�</a></li>
								<li><a href="#">������</a></li>
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
									<th class="column-title">�μ�</th>
									<th class="column-title">��å</th>
									<th class="column-title">�̸�</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>�濵������</td>
									<td class=" ">����</td>
									<td class=" ">�ں���</td>
								</tr>
								<tr>
									<td>�濵������</td>
									<td class=" ">�λ���</td>
									<td class=" ">������</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<div class="text-center">
						<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>