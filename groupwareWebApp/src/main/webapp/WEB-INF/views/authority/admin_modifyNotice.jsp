<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0//js/froala_editor.pkgd.min.js"></script>
<script>
	$(document).ready(function() {
		   $(function() {
			   $('textarea#froala-editor').froalaEditor()
			 });
		   
		   //수정
		   $('#modiNotice').on('click', function() {
				event.preventDefault();
				checkUnload = false;
				  
				if($($('input:text[name=noticeTitle]')).val() == "" ){
					swal("제목을 입력하세요.");
					$('#noticeTitle').focus();
					return;
				} 
				
		 		if($($('textarea[name=noticeContents]')).val() == "" ){
					swal("내용을 입력하세요.");
					$('#noticeContents').focus();
					return;
				}  

				swal({
					title: "공지사항 수정",   
					text: "공지사항을 수정합니다. 계속 진행하시겠습니까?",
					icon: "info",
					buttons : true 
				}).then((e) => {
					if(e) {
						$('#modify').submit();
					} else if(!e) {
						checkUnload = true;
						return;
					}
				});		
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
<style>
	.fr-element {
		height: 400px;
	} 
	
	.btn-modify {
	    background-color: white;
	    border-color: white;
	    color: #2196F3; 
    }
    
	.btn-modify:hover,
	.btn-modify:focus {
	    border-color: white;
	    background-color: white;
	    color: balck; 
	 }
	 
	.btn-modify:active,
	.btn-modify:visited,
	.btn-modify:active:focus,
	.btn-modify:active:hover {
	    border-color: white;
	    background-color: white;
	    color: balck; 
    }
</style>
<title>Insert title here</title>
</head>
<body>
	<!--글쓰기-->
	<form id="modify" action = "${pageContext.request.contextPath }/admin/modifyNotice.do"  enctype="multipart/form-data" method = "post">
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

						<textarea id="froala-editor"  name="noticeContents" rows="20" style="width: 100%">${sessionScope.notice.noticeContents}</textarea>
						<br> <br>
						
						<div class="ln_solid"></div>
			
						<%-- 업로드된 파일 목록 조회 --%>
					<c:if test="${fn:length(sessionScope.notice.files) > 0 }">
						<table id="datatable" >
						 <tbody style='border-bottom: 1px  solid darkgray;'>
							<c:forEach var="noticeFile" items="${sessionScope.notice.files }" varStatus="loop">
								<c:url var="deleteUrl" value="/admin/removeNoticeFile.do" scope="page">
									<c:param name="noticeNo" value="${pageScope.noticeFile.no }"/>
								</c:url>
								<tr style='height:40px; border-top: 1px  solid darkgray;'>
									<td style='width:50px;'>파일${pageScope.loop.count }</td>
									<td style='width:150px;'>${pageScope.noticeFile.originalFileName }</td>							
									<td><button type="button"  class='btn btn-modify btn-xs' value="${pageScope.noticeFile.no }"  id="deleteBtn" class="btn btn-primary pull-right" >삭제</button></td>
								</tr>
							</c:forEach>
							</tbody >
						</table><br>
					</c:if>
						<div class="col-md-12">
							<div class="row">
								<div class="control-group" id="fields">
									<div class="controls">
										<div class="entry input-group col-xs-3">
											<input type="file" class="btn btn-default" name="upload">             
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

					<button type="submit" class="btn btn-primary pull-right" id="modiNotice">수정</button>
					&nbsp;
					<button type="reset" class="btn btn-primary pull-right">취소</button>
				</div>
			</div>
	</form>
</body>
</html>