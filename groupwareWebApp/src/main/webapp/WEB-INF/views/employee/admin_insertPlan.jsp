<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정등록</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/admin/registerPlan.do"
		method="POST">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>일정등록</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br>
					<form id="demo-form2" data-parsley-validate=""
						class="form-horizontal form-label-left">

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12"
								for="last-name">일정구분</label>&nbsp;&nbsp;
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="false">
								일정 <span class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li value="회의">회의</li>
								<li value="교육">교육</li>
								<li value="기타">기타</li>
							</ul>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" for="last-name">부서</label>&nbsp;&nbsp;
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="false">부서 <span class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li value="전체">전체</li>
								<li value="A-01">경영관리부</li>
								<li value="A-02">인사부</li>
								<li value="A-03">회계부</li>
								<li value="A-05">개발부</li>
								<li value="A-05-01">개발1팀</li>
								<li value="A-05-02">개발2팀</li>
								<li value="A-04">영업부</li>
								<li value="A-04-01">영업1팀</li>
								<li value="A-04-02">영업2팀</li>
							</ul>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">제목
							</label>
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" name="pTitle" class="form-control" placeholder="일정 제목을 입력해주세요.">
							</div>
						</div>
						<div class="col-md-12">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">반복구문
							</label>
							<div class="form-group">
								&nbsp;&nbsp;
								당일:<input type="radio" class="flat" name="gender" id="genderM" value="M" checked="" required="">
								&nbsp;&nbsp;
								반복: <input type="radio" class="flat" name="gender" id="genderF" value="F">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">기간
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
							<label class="control-label col-md-1 col-sm-3 col-xs-12">장소</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="address" name="address"
									required="required" class="form-control col-md-10 col-xs-12">
							</div>
							<button type="button" class="btn btn-success">주소찾기</button>
						</div>

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>내용</h2>
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
								<label class="control-label col-md-1 col-sm-3 col-xs-12">중요도
								</label>
								<div class="form-group">
									&nbsp;&nbsp;
									하:<input type="radio" class="flat" name="low" id="low" value="하" checked="" required="">
									&nbsp;&nbsp;
									중: <input type="radio" class="flat" name="middle" id="middle" value="중">
									&nbsp;&nbsp;
									상: <input type="radio" class="flat" name="high" id="high" value="상">
								</div>
							</div>

							<div class="form-group form-inline">
								<label class="control-label col-md-1 col-sm-3 col-xs-12"
									for="last-name">담당자 지정 </label>&nbsp;&nbsp;
								<div class="input-group col-md-6 col-sm-6 col-xs-12">
									<input type="text" name="rspbNo" class="form-control"> <span
										class="input-group-btn">
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#myModal">검색</button>
										<button class="btn btn-primary" type="reset">삭제</button>
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

		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">담당자 지정</h4>
						※부서와 이름, 기간을 지정해주세요.
					</div>


					<div class="modal-body">
						<div>
							<div class="btn-group">
								<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"
									aria-expanded="false">검색조건 <span class="caret"></span>
								</button>
								<ul role="menu" class="dropdown-menu">
									<li><a href="#">경영관리부</a></li>
									<li><a href="#">인사부</a></li>
									<li><a href="#">회계부</a></li>
									<li><a href="#">개발부</a></li>
									<li><a href="#">영업부</a></li>
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
										<th class="column-title">부서</th>
										<th class="column-title">직책</th>
										<th class="column-title">이름</th>
									</tr>
								</thead>

								<tbody>
									<tr class="even pointer">
										<td><a data-toggle="modal" data-target="#myModal">영업부<a></td>
										<td class=" ">부장</td>
										<td class=" ">영부장</td>
								</tbody>
							</table>
						</div>
						<br>
						<div class="text-center">
							<button type="button" class="btn btn-primary">설정</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>