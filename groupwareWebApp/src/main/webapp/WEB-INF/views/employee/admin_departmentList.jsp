<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
							<th>å����</th>
							<th>å���� ����ó</th>
							<th>�μ���</th>
							<th>�μ��� �� ��</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>100</td>
							<td>�濵������</td>
							<td>���� �ں���</td>
							<td>010-7660-2915</td>
							<td><a data-toggle="modal" data-target="#myModal">2��</a></td>
							<td>1��</td>
						</tr>
						<tr>
							<td>110</td>
							<td>�λ��</td>
							<td>���� �κ���</td>
							<td>010-7660-2915</td>
							<td>6��</td>
							<td>1��</td>
						</tr>
						<tr>
							<td>120</td>
							<td>ȸ���</td>
							<td>���� ȸ����</td>
							<td>010-7660-2915</td>
							<td>6��</td>
							<td>1��</td>
						</tr>
						<tr>
							<td>130</td>
							<td>������</td>
							<td>���� ������</td>
							<td>010-7660-2915</td>
							<td>11��</td>
							<td>2��</td>
						</tr>
						<tr>
							<td>140</td>
							<td>���ߺ�</td>
							<td>���� ������</td>
							<td>010-7660-2915</td>
							<td>11��</td>
							<td>2��</td>
						</tr>
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