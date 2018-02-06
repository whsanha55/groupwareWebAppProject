<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내 정보</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>개인정보</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
					<div class="profile_img">
						<div id="crop-avatar">
							<!-- Current avatar -->
							<img class="img-responsive avatar-view" src="${pageContext.request.contextPath}/resources/upload/employeeFiles/signs/${requestScope.employee.photoName}"
								alt="Avatar" title="Change the avatar">
						</div>
					</div>
					<h3>${requestScope.employee.empName }</h3>
					
					<%-- <script>
						$(document).ready(function() {
							var employee = {
								empNo : $('#empNo').text(),
								empName : $('#empName').text(),
								hireDate : $('#hireDate').text(),
								department : $('#department').text(),
								duty : $('#duty').text(),
								phoneNumber : $('#phoneNumber').text(),
								email : $('#email').text(),
								address : $('#address').text()								
							}

							$('#mod-emp').click(function() {
								$.ajax ({
									url:"${pageContext.request.contextPath }/modifyEmployee.do",
									method:"POST",
									data:{
										employee : employee
									},
									dataType:'json',
									success: function(data) {
										
									},
									error: function(jqXHR) {
										alert("error:"+jqXHR.status);
									}
								});
							});							
						});
					</script> --%>
					<br> <a id="mod-emp" href="${pageContext.request.contextPath }/modifyEmployee.do" class="btn btn-success"><i
						class="fa fa-edit m-right-xs"></i>사원 정보 수정</a> <br>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="profile_title">
						<div class="col-md-6">
							<h2>사원정보</h2>
						</div>
						<div class="col-md-6"></div>
					</div>
					<table id="datatable" class="table table-striped table-bordered">
						<tbody>
							<tr>
								<th>사번</th>
								<td id="empNo">${requestScope.employee.empNo }</td>
							</tr>
							<tr>
								<th>이름</th>
								<td id="empName">${requestScope.employee.empName }</td>
							</tr>
							<tr>
								<th>입사일자</th>
								<td id="hireDate">${requestScope.employee.hireDate }</td>
							</tr>
							<tr>
								<th>부서</th>
								<td id="department">${requestScope.employee.department }</td>
							</tr>
							<tr>
								<th>직책</th>
								<td id="duty">${requestScope.employee.duty }</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td id="phoneNumber">${requestScope.employee.phoneNumber }</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td id="email">${requestScope.employee.email }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td id="address">${requestScope.employee.address }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>