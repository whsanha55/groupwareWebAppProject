<%@page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>게시글</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-wrench"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Settings 1</a></li>
							<li><a href="#">Settings 2</a></li>
						</ul></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">제목</label>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<input type="text" name="country" id="autocomplete-custom-append"
						class="form-control col-md-10" />
				</div>
				<label class="control-label col-md-3 col-sm-3 col-xs-12">부서구분</label>
               <div class="col-md-9 col-sm-9 col-xs-12">
                  <select class="form-control">
                     <option>부서를 선택하세요</option>
                     <option>영업부</option>
                     <option>Option two</option>
                     <option>Option three</option>
                     <option>Option four</option>
                  </select>
               </div>
               <label class="control-label col-md-3 col-sm-3 col-xs-12">문서종류</label>
               <div class="col-md-9 col-sm-9 col-xs-12">
                  <select class="form-control">
                     <option>문서를 선택하세요</option>
                     <option>공문서</option>
                     <option>기타</option>
                     <option>Option three</option>
                     <option>Option four</option>
                  </select>
               </div>
				<div class="x_content">

					<div id="alerts"></div>

					<div class="btn-toolbar editor" data-role="editor-toolbar"
						data-target="#editor-one">
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
							<ul class="dropdown-menu">
							</ul>
						</div>

						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a data-edit="fontSize 5">
										<p style="font-size: 17px">Huge</p>
								</a></li>
								<li><a data-edit="fontSize 3">
										<p style="font-size: 14px">Normal</p>
								</a></li>
								<li><a data-edit="fontSize 1">
										<p style="font-size: 11px">Small</p>
								</a></li>
							</ul>
						</div>

						<div class="btn-group">
							<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
								class="fa fa-bold"></i></a> <a class="btn" data-edit="italic"
								title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a> <a
								class="btn" data-edit="strikethrough" title="Strikethrough"><i
								class="fa fa-strikethrough"></i></a> <a class="btn"
								data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
								class="fa fa-underline"></i></a>
						</div>

						<div class="btn-group">
							<a class="btn" data-edit="insertunorderedlist"
								title="Bullet list"><i class="fa fa-list-ul"></i></a> <a
								class="btn" data-edit="insertorderedlist" title="Number list"><i
								class="fa fa-list-ol"></i></a> <a class="btn" data-edit="outdent"
								title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
							<a class="btn" data-edit="indent" title="Indent (Tab)"><i
								class="fa fa-indent"></i></a>
						</div>

						<div class="btn-group">
							<a class="btn" data-edit="justifyleft"
								title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
							<a class="btn" data-edit="justifycenter"
								title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
							<a class="btn" data-edit="justifyright"
								title="Align Right (Ctrl/Cmd+R)"><i
								class="fa fa-align-right"></i></a> <a class="btn"
								data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
								class="fa fa-align-justify"></i></a>
						</div>

						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown"
								title="Hyperlink"><i class="fa fa-link"></i></a>
							<div class="dropdown-menu input-append">
								<input class="span2" placeholder="URL" type="text"
									data-edit="createLink">
								<button class="btn" type="button">Add</button>
							</div>
							<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
								class="fa fa-cut"></i></a>
						</div>

						<div class="btn-group">
							<a class="btn" title="Insert picture (or just drag &amp; drop)"
								id="pictureBtn"><i class="fa fa-picture-o"></i></a> <input
								type="file" data-role="magic-overlay" data-target="#pictureBtn"
								data-edit="insertImage">
						</div>

						<div class="btn-group">
							<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
								class="fa fa-undo"></i></a> <a class="btn" data-edit="redo"
								title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
						</div>
					</div>

					<div id="editor-one" class="editor-wrapper placeholderText"
						contenteditable="true"></div>

					<textarea name="descr" id="descr" style="display: none;"></textarea>

					<br>

					<div class="ln_solid"></div>


				</div>
			</div>
			<a class="btn btn-primary pull-right" href="a_index_authority.html">취소</a>
			<a class="btn btn-primary pull-right" href="a_index_authority.html">등록</a>

		</div>
</body>
</html>