<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������� ����</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>������� ����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" action="${pageContext.request.contextPath }/modifyEmployee.do" method="POST" 
					data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">���
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control" 
								id="empNo" name="empNo" readonly value="${requestScope.employee.empNo }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">��й�ȣ <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwd" name="empPwd" value="${requestScope.employee.empPwd }"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">��й�ȣ Ȯ�� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="pwdCheck" name="pwdCheck" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">�̸�
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control" readonly
								id="empName" name="empName" value="${requestScope.employee.empName }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">�����̸�
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control" 
								id="engName" name="engName" value="${requestScope.employee.engName }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">����ó <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="phoneNumber" name="phoneNumber"
								required="required" class="form-control col-md-7 col-xs-12"
								value="${requestScope.employee.phoneNumber }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">�̸��� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="email" name="email"
								required="required" class="form-control col-md-7 col-xs-12"
								value="${requestScope.employee.email }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">�ּ� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address"
								required="required" class="form-control col-md-7 col-xs-12"
								value="${requestScope.employee.address }">
						</div>
						<button type="button" class="btn btn-success">�ּ�ã��</button>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">���</button>
							<button type="submit" class="btn btn-success">����</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>