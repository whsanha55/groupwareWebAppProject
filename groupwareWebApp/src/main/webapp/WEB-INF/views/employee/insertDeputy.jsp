<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ���</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>������ ����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group form-inline">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">������ ���� </label>&nbsp;&nbsp;
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control"> <span class="input-group-btn">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#myModal">�˻�</button>
								<button class="btn btn-primary" type="reset">����</button>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">���� </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">Cancel</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
					<div class="ln_solid"></div>
					<table id="datatable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>���</th>
								<th>�̸�</th>
								<th>������</th>
								<th>������</th>
								<th>����</th>
								<th>���࿩��</th>
								<th>�󼼺���</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2015-00035</td>
								<td>��븮</td>
								<td>2018/01/05</td>
								<td>2018/01/10</td>
								<td>����</td>
								<td>X</td>
								<td><button type="button">�󼼺���</button></td>
							</tr>
							<tr>
								<td>2015-00036</td>
								<td>�ڴ븮</td>
								<td>2018/01/10</td>
								<td>2018/01/15</td>
								<td>����</td>
								<td>X</td>
								<td><button type="button">�󼼺���</button></td>
							</tr>
							<tr>
								<td>2015-00037</td>
								<td>�̴븮</td>
								<td>2018/01/15</td>
								<td>2018/01/30</td>
								<td>������Ʈ</td>
								<td>O</td>
								<td><button type="button">�󼼺���</button></td>
							</tr>
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
						<span aria-hidden="true">��</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">������ ����</h4>
					�غμ��� �̸�, �Ⱓ�� �������ּ���.
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
								<tr class="even pointer">
									<td><a data-toggle="modal" data-target="#myModal">������</a><a></a></td>
									<td class=" ">����</td>
									<td class=" ">������</td>
								</tr>
							</tbody>
						</table>
						<div class="form-group form-inline col-md-12">
							<div class="form-group">
								<label for="ex3">�Ⱓ���� :</label> <input type="date" id="ex3"
									class="form-control" placeholder=" ">
							</div>
							<div class="form-group">
								<label for="ex4">~</label> <input type="date" id="ex4"
									class="form-control" placeholder=" ">
							</div>
						</div>
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
</body>
</html>