<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ڵ���3</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>�ڵ����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>�ڵ���</h2>
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target=".bs-example-modal-lg">����ϱ�</button>
						</div>
						<div class="modal fade bs-example-modal-lg" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">��</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">�ڵ� ���</h4>
									</div>
									<div class="modal-body">
										<div></div>
										<table id="datatable"
											class="table table-striped table-bordered align-right">
											<tbody>
												<tr>
													<th>�����ڵ�</th>
													<td><div class="input-group-btn search-panel">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																<span id="search_concept">�ڵ�</span> <span class="caret"></span>
															</button>
															<ul class="dropdown-menu" role="menu">
																<li><a href="#�濵������">�濵������</a></li>
																<li><a href="#�λ��">�λ��</a></li>
																<li><a href="#ȸ���">ȸ���</a></li>
																<li><a href="#���ߺ�">���ߺ�</a></li>
																<li><a href="#������">������</a></li>
															</ul>
														</div></td>
												</tr>
												<tr>
													<th>�ڵ��ȣ</th>
													<td><input type="text" class="form-control"
														required="required"></td>
												</tr>
												<tr>
													<th>�ڵ��</th>
													<td><input type="text" class="form-control"
														required="required"></td>
												</tr>
											</tbody>
										</table>
										<br>
										<div class="text-center">
											<button type="button" class="btn btn-primary">���</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">�ݱ�</button>
										</div>
									</div>
								</div>
							</div>
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
							<th>�ڵ��ȣ</th>
							<th>�ڵ��</th>
							<th>��ϵ� ���� �ڵ� ��</th>
							<th>����</th>
							<th>����</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>141</td>
							<td>����1��</td>
							<td>5</td>
							<td><button type="button" data-toggle="modal"
									data-target="#myModal">����</button></td>
							<td></td>
						</tr>
						<tr>
							<td>142</td>
							<td>����2��</td>
							<td>5</td>
							<td><button type="button" data-toggle="modal"
									data-target="#myModal">����</button></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>