<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������</title>
<script>
	$(document).ready(function() {
		
		
	})
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
					<br>
					<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
							action="${pageContext.request.contextPath }/admin/registerPlan.do" method="post"
							enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >��������</label>&nbsp;&nbsp;
							<select id="p_Class" name="pClass" style="width:100px;height:30px;">
							<option value="1">ȸ��</option>
							<option value="2">����</option>
							<option value="3">��Ÿ</option>
							</select>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >�μ�</label>&nbsp;&nbsp;
							<select id="deptNo" name="deptNo" style="width:100px;height:30px;">
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</option>
							</c:forEach>
							</select>
						</div>
						
						
						<br>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >����</label>&nbsp;&nbsp;
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" name="pTitle" class="form-control" placeholder="������ �Է����ּ���."
										style="width:1000px;" value="����">
							</div>
						</div>
						
						<div class="form-group">
							<!-- <label class="control-label col-md-1 col-sm-3 col-xs-12" >�ݺ�����</label>
							<div class="form-group">
								&nbsp;&nbsp;
								����:<input type="radio" class="flat" name="gender" id="genderM" value="M" checked="" required="">
								&nbsp;&nbsp;
								�ݺ�: <input type="radio" class="flat" name="gender" id="genderF" value="F">
							</div> -->
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >�Ⱓ</label>&nbsp;&nbsp;
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<fieldset>
									<div class="control-group">
										<div class="controls">
											<div class="input-prepend input-group col-md-6 col-sm-6 col-xs-12">
												<span class="add-on input-group-addon"><i
													class="glyphicon glyphicon-calendar fa fa-calendar"></i></span> <input
													type="datetime-local" name="startDate" id="startDate"
													class="form-control" required="required">
											</div>
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<div class="input-prepend input-group col-md-6 col-sm-6 col-xs-12">
												<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
												<input type="datetime-local" name="endDate" id="endDate" class="form-control" required="required">
											</div>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						
		
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >���</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="latitude" name="latitude"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:100px;" value="1">
								<input type="text" id="longitude" name="longitude"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:100px;" value="1">
							</div>
							<button type="button" class="btn btn-success">�ּ�ã��</button>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >����</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="pContent" name="pContent"
									required="required" class="form-control col-md-10 col-xs-12" 
									style="width:1000px;height:100px;" value="����">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">÷������</label>
							<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
								<i class="fa fa-picture-o"></i></a>
								<input name="upload" type="file" data-role="magic-overlay" data-target="#fileBtn"
										data-edit="insertImage">
							</div>
						</div>



						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">�߿䵵</label>
								<div class="form-group">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="pImpt" id="pImpt" value="1" checked="" required="">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="pImpt" id="pImpt" value="2">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="pImpt" id="pImpt" value="3">
								</div>
							</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">����� ����</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="rspbNo" name="rspbNo"
									required="required" class="form-control col-md-10 col-xs-12" value='2018-00011'>
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">�˻�</button>
							<button class="btn btn-primary" type="reset">����</button>
						</div>


						<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<button class="btn btn-primary" type="button">Cancel</button>
									<button type="submit" class="btn btn-success">Submit</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- ��� �˾� -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">��</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">����� ����</h4>
						�غμ��� �̸�, �Ⱓ�� �������ּ���.
					</div>


					<div class="modal-body">
						<div>
							<div class="btn-group">
								<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"
									aria-expanded="false">�˻����� <span class="caret"></span>
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
									<tr class="even pointer">
										<td><a data-toggle="modal" data-target="#myModal">������<a></td>
										<td class=" ">����</td>
										<td class=" ">������</td>
								</tbody>
							</table>
						</div>
						<br>
						<div class="text-center">
							<button type="button" class="btn btn-primary">����</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>