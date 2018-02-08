<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(document).ready(function() {
		$('#something').click(function() {
			location.reload();
			});
		
		 //첨부파일 추가 및 삭제 이벤트
		$('form').on('click', '.btn-add', function(e) {
	        e.preventDefault();

	        var controlForm = $('.controls:first') ;
	        var currentEntry = $(this).parents('.entry:first');
	        var newEntry = $(currentEntry.clone()).appendTo(controlForm);

	        newEntry.find('input').val('');
	        controlForm.find('.entry:not(:last) .btn-add')
	            .removeClass('btn-add').addClass('btn-remove')
	            .removeClass('btn-success').addClass('btn-danger')
	            .html('<span class="glyphicon glyphicon-minus"></span>');
		}).on('click', '.btn-remove', function(e) {
		      $(this).parents('.entry:first').remove();

				e.preventDefault();
			return false;
		});
		 
		//첨부파일 용량 체크
		$('.controls').on('change','input[name=upload]',function() {
			if($(this).val() != '') {
				var fileSize = this.files[0].size;
				var maxSize = 1024*1024*1;
				if(fileSize > maxSize) {
					swal('1mb 이하의 첨부만 가능합니다','요청 파일 크기 : ' + Math.round(fileSize/1024) + "kb",'error');
					$(this).val('');
				}
			}
		});
		
		//파일 삭제 
	    $('#datatable').on('click','button:contains(삭제)', function () {
			var noticeNo = $(this).val();
			
			swal({
				  title: "파일 삭제",
				  text: "파일을 삭제합니다. 계속 진행하시겠습니까?",
				  icon: "info",
				  buttons : true 
			}).then((e) => {
			     if(e) {
			    	 deleteNoticeFile(noticeNo);							
				 }
			});		
			
			//alert($(this).val());
			function deleteNoticeFile(noticeNo) {	
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/deleteNoticeFile.do'
					,
					method: 'GET'
					,
					data: {noticeNo}
					, 
					async: true
					,
					cache: false
					,
					success: function(data) {
						swal({
							  title: "삭제 완료",
							  text: "선택하신 파일이 삭제되었습니다.",
							  icon: "info",
							  buttons : "확인" 
						}).then((e) => {
						     if(e) {
						    	 location.reload();		
							 }
						});		
					}
					, 
					error: function(jqXHR) {
						alert('Error : ' + jqXHR.status);
					}	 			
					
				});	
			}
		});	 

	});
</script>
<title>Insert title here</title>
</head>
<body>
	<!--글쓰기-->
	<form action = "${pageContext.request.contextPath }/admin/modifyNotice.do"  enctype="multipart/form-data" method = "post">
		<input type = "hidden" name ="noticeNo" value = "${sessionScope.notice.noticeNo}">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>공지사항</h2>
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
						<input type="text" name="noticeTitle" value="${sessionScope.notice.noticeTitle}"
							id="autocomplete-custom-append" class="form-control col-md-10" />
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
									id="pictureBtn"><i class="fa fa-picture-o"></i></a>
							</div>

							<div class="btn-group">
								<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
									class="fa fa-undo"></i></a> <a class="btn" data-edit="redo"
									title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
							</div>
						</div>



						<textarea name="noticeContents" rows="20" style="width: 100%">${sessionScope.notice.noticeContents}</textarea>
						<br> <br>
						
						<div class="ln_solid"></div>
			
						<%-- 업로드된 파일 목록 조회 --%>
					<c:if test="${fn:length(sessionScope.notice.files) > 0 }">
						<table border="1" id="datatable" >
							<c:forEach var="noticeFile" items="${sessionScope.notice.files }" varStatus="loop">
								<c:url var="deleteUrl" value="/admin/removeNoticeFile.do" scope="page">
									<c:param name="noticeNo" value="${pageScope.noticeFile.no }"/>
								</c:url>
								<tr>
									<td>파일${pageScope.loop.count }</td>
									<td>${pageScope.noticeFile.originalFileName }</td>							
									<td><button type="button"  value="${pageScope.noticeFile.no }"  id="deleteBtn" class="btn btn-primary pull-right" >삭제</button></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
						<div class="col-md-12">
							<div class="row">
								<div class="control-group" id="fields">
									<div class="controls">
										<div class="entry input-group col-xs-3">
											<input type="file" class="btn btn-primary" name="upload">
											<span class="input-group-btn">
												<button class="btn btn-success btn-add" type="button">
													<span class="glyphicon glyphicon-plus"></span>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<button type="submit" class="btn btn-primary pull-right">등록</button>
					&nbsp;
					<button type="reset" class="btn btn-primary pull-right">취소</button>
				</div>
			</div>
	</form>
</body>
</html>