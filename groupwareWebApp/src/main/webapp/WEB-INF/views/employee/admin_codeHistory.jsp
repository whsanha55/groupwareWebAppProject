<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������_�̷���ȸ</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>�̷���ȸ</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2"></div>
						</div>
						<div>
							<div class="col-md-3 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span id="search_concept">�˻�</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#contains">�ڵ��ȣ</a></li>
											<li><a href="#its_equal">�ڵ��</a></li>
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
				<table id="datatable"
					class="table table-striped table-bordered text-center">
					<thead>
						<tr>
							<th>���</th>
							<th>�̸�</th>
							<th>�μ�</th>
							<th>��å</th>
							<th>���� ����</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>2007-00001</td>
							<td>�ں���</td>
							<td>�濵������</td>
							<td>���</td>
							<td>2018/01/01</td>
						</tr>
						<tr>
							<td>2007-00002</td>
							<td>������</td>
							<td>�濵������</td>
							<td>���</td>
							<td>2018/01/05</td>
						</tr>
						<tr>
							<td>2007-00003</td>
							<td>����</td>
							<td>ȸ���</td>
							<td>���</td>
							<td>2018/01/15</td>
						</tr>
						<tr>
							<td>2007-00004</td>
							<td>�ڴ븮</td>
							<td>����1��</td>
							<td>�븮</td>
							<td>2018/01/20</td>
						</tr>
						<tr>
							<td>2007-00005</td>
							<td>�̺���</td>
							<td>���ߺ�</td>
							<td>����</td>
							<td>2018/01/22</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>