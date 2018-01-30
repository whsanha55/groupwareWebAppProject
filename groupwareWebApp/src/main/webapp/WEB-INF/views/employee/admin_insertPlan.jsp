<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/admin/registerPlan.do"
		method="POST">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>�������</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br>
					<form id="demo-form2" data-parsley-validate=""
						class="form-horizontal form-label-left">

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12"
								for="last-name">��������</label>&nbsp;&nbsp;
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="false">
								���� <span class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li value="ȸ��">ȸ��</li>
								<li value="����">����</li>
								<li value="��Ÿ">��Ÿ</li>
							</ul>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" for="last-name">�μ�</label>&nbsp;&nbsp;
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="false">�μ� <span class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li value="��ü">��ü</li>
								<li value="A-01">�濵������</li>
								<li value="A-02">�λ��</li>
								<li value="A-03">ȸ���</li>
								<li value="A-05">���ߺ�</li>
								<li value="A-05-01">����1��</li>
								<li value="A-05-02">����2��</li>
								<li value="A-04">������</li>
								<li value="A-04-01">����1��</li>
								<li value="A-04-02">����2��</li>
							</ul>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">����
							</label>
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" name="pTitle" class="form-control" placeholder="���� ������ �Է����ּ���.">
							</div>
						</div>
						<div class="col-md-12">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">�ݺ�����
							</label>
							<div class="form-group">
								&nbsp;&nbsp;
								����:<input type="radio" class="flat" name="gender" id="genderM" value="M" checked="" required="">
								&nbsp;&nbsp;
								�ݺ�: <input type="radio" class="flat" name="gender" id="genderF" value="F">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">�Ⱓ
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<fieldset>
									<div class="control-group">
										<div class="controls">
											<div
												class="input-prepend input-group col-md-9 col-sm-6 col-xs-12">
												<span class="add-on input-group-addon"><i
													class="glyphicon glyphicon-calendar fa fa-calendar"></i></span> <input
													type="text" name="reservation-time" id="reservation-time"
													class="form-control">
											</div>
										</div>
									</div>
								</fieldset>
							</div>
						</div>



						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">���</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="address" name="address"
									required="required" class="form-control col-md-10 col-xs-12">
							</div>
							<button type="button" class="btn btn-success">�ּ�ã��</button>
						</div>

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>����</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link">
												<i class="fa fa-chevron-up"></i>
											 </a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div id="alerts"></div>
									<div class="btn-toolbar editor" data-role="editor-toolbar"
										data-target="#editor-one">
										<div class="btn-group">
											<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font">
												<i class="fa fa-font"></i>
												<b class="caret"></b></a>
											<ul class="dropdown-menu">
											</ul>
										</div>

										<div class="btn-group">
											<a class="btn dropdown-toggle" data-toggle="dropdown"
												title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b
												class="caret"></b></a>
											<ul class="dropdown-menu">
												<li><a data-edit="fontSize 5">
														<p style="font-size: 17px">Huge</p></a>
												</li>
												<li><a data-edit="fontSize 3">
														<p style="font-size: 14px">Normal</p></a>
												</li>
												<li><a data-edit="fontSize 1">
														<p style="font-size: 11px">Small</p></a>
												</li>
											</ul>
										</div>

										<div class="btn-group">
											<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)">
												<i class="fa fa-bold"></i></a>
											<a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)">
												<i class="fa fa-italic"></i></a>
											<a class="btn" data-edit="strikethrough" title="Strikethrough">
												<i class="fa fa-strikethrough"></i></a>
											<a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)">
												<i class="fa fa-underline"></i></a>
										</div>

										<div class="btn-group">
											<a class="btn" data-edit="insertunorderedlist" title="Bullet list">
												<i class="fa fa-list-ul"></i></a>
											<a class="btn" data-edit="insertorderedlist" title="Number list">
												<i class="fa fa-list-ol"></i></a>
											<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)">
												<i class="fa fa-dedent"></i></a>
											<a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
										</div>

										<div class="btn-group">
											<a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)">
												<i class="fa fa-align-left"></i></a>
											<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)">
												<i class="fa fa-align-center"></i></a>
											<a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)">
												<i class="fa fa-align-right"></i></a>
											<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)">
												<i class="fa fa-align-justify"></i></a>
										</div>

										<div class="btn-group">
											<a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink">
												<i class="fa fa-link"></i></a>
											<div class="dropdown-menu input-append">
												<input class="span2" placeholder="URL" type="text" data-edit="createLink">
												<button class="btn" type="button">Add</button>
											</div>
											<a class="btn" data-edit="unlink" title="Remove Hyperlink">
												<i class="fa fa-cut"></i></a>
										</div>

										<div class="btn-group">
											<a class="btn" title="Insert picture (or just drag &amp; drop)" id="pictureBtn">
												<i class="fa fa-picture-o"></i></a>
													<input type="file" data-role="magic-overlay"
													data-target="#pictureBtn" data-edit="insertImage">
										</div>

										<div class="btn-group">
											<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)">
												<i class="fa fa-undo"></i></a>
											<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)">
												<i class="fa fa-repeat"></i></a>
										</div>
									</div>

									<div id="editor-one" class="editor-wrapper placeholderText" contenteditable="true"></div>

									<textarea name="descr" id="descr" style="display: none;"></textarea>

									<br>
								</div>
							</div>



							<div class="col-md-12">
								<label class="control-label col-md-1 col-sm-3 col-xs-12">�߿䵵
								</label>
								<div class="form-group">
									&nbsp;&nbsp;
									��:<input type="radio" class="flat" name="low" id="low" value="��" checked="" required="">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="middle" id="middle" value="��">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="high" id="high" value="��">
								</div>
							</div>

							<div class="form-group form-inline">
								<label class="control-label col-md-1 col-sm-3 col-xs-12"
									for="last-name">����� ���� </label>&nbsp;&nbsp;
								<div class="input-group col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="rspbNo" class="form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#myModal">�˻�</button>
										<button class="btn btn-primary" type="reset">����</button>
									</span>
								</div>
							</div>


							<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<button class="btn btn-primary" type="button">Cancel</button>
									<button class="btn btn-primary" type="reset">Reset</button>
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