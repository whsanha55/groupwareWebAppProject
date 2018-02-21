<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>��������</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
					<div class="profile_img">
						<div id="crop-avatar">
							<img class="img-responsive avatar-view" 
								src="${pageContext.request.contextPath}/resources/upload/employeeFiles/photos/${requestScope.employee.photoName}">
						</div>
					</div>
					<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.employee.empName }</h3>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="mod-emp" href="${pageContext.request.contextPath }/modifyEmployee.do" class="btn btn-success"><i
						class="fa fa-edit m-right-xs"></i>��� ���� ����</a> <br>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="profile_title">
						<div class="col-md-6">
							<h2>�������</h2>
						</div>
						<div class="col-md-6"></div>
					</div>
					<table id="datatable" class="table table-striped table-bordered" style="height:450px;font-size:14px;">
						<tbody>
							<tr>
								<th>���</th>
								<td id="empNo">${requestScope.employee.empNo }</td>
							</tr>
							<tr>
								<th>�̸�</th>
								<td id="empName">${requestScope.employee.empName }</td>
							</tr>
							<tr>
								<th>�Ի�����</th>
								<td id="hireDate">${requestScope.employee.hireDate }</td>
							</tr>
							<tr>
								<th>�μ�</th>
								<td id="department">${requestScope.employee.department }</td>
							</tr>
							<tr>
								<th>��å</th>
								<td id="duty">${requestScope.employee.duty }</td>
							</tr>
							<tr>
								<th>����ó</th>
								<td id="phoneNumber">${requestScope.employee.phoneNumber }</td>
							</tr>
							<tr>
								<th>�̸���</th>
								<td id="email">${requestScope.employee.email }</td>
							</tr>
							<tr>
								<th>�ּ�</th>
								<td id="address">${requestScope.employee.address }&nbsp;${requestScope.employee.detailAddress }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>