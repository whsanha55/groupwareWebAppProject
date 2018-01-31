
<%-- addPost.jsp --%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/addPost.do" method="post" 
	enctype="multipart/form-data">
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
						<input type="text" name="postTitle"
							id="autocomplete-custom-append" class="form-control col-md-10" />
					</div>
					<label class="control-label col-md-3 col-sm-3 col-xs-12">부서구분</label>
					<div class="col-md-9 col-sm-9 col-xs-12">
						<select class="form-control" name="cNo">
							<option>부서를 선택하세요</option>
							<option value="A-01">경영관리부</option>
							<option value="A-02">인사부</option>
							<option value="A-03">회계부</option>
							<option value="A-04">영업부</option>
							<option value="A-05">개발부</option>
						</select>
					</div>
					<label class="control-label col-md-3 col-sm-3 col-xs-12">문서종류</label>
					<div class="col-md-9 col-sm-9 col-xs-12">
						<select class="form-control" name="documentNo">
							<option>문서를 선택하세요</option>
							<option value="1">문서보관함</option>
							<option value="2">회의문서</option>
							<option value="3">각종 증명서</option>
							<option value="4">공문서</option>
							<option value="5">거래문서</option>
							<option value="6">기타</option>
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
								<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
									class="fa fa-undo"></i></a> <a class="btn" data-edit="redo"
									title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
							</div>
						</div>

						<div id="editor-one" class="editor-wrapper placeholderText"
							contenteditable="true"></div>

						<textarea name="postContent" style="display: none;"></textarea>

						
						
						파    일 : <input type="file" name="upload">
 						파    일 : <input type="file" name="upload">
 						파    일 : <input type="file" name="upload">	

						<div class="ln_solid"></div>


					</div>
				</div>
				<button type="submit">등록</button>
				&nbsp;
				<button type="reset">취소</button>
				<%-- 
				<a class="btn btn-primary pull-right" href='<c:url value="postList.do" />'>취소</a> 
				<a class="btn btn-primary pull-right" href='<c:url value="postList.do" />'>등록</a>
                 --%>      
			</div>
		</div>
	</form>
</body>
</html>