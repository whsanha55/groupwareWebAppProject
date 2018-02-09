
<%-- modifyPost.jsp --%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
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
				alert($(this).val());
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
			var no = $(this).val();
			swal({
				  title: "파일 삭제",
				  text: "파일을 삭제합니다. 계속 진행하시겠습니까?",
				  icon: "info",
				  buttons : true 
			}).then((e) => {
			     if(e) {
			    	 alert(no);
			    	 $.ajax({
	                     url: '${pageContext.request.contextPath}/deletePostFile.do'  
	                     ,
	                     method: 'GET'
	                     ,
	                     data: {no: no} 
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

	});
	
	
	</script>
    
</head>
<body>
	<form id="datatable" action="${pageContext.request.contextPath }/modifyPost.do" method="post"
		enctype="multipart/form-data">
		<input type = "hidden" name ="posteNo" value = "${sessionScope.post.postNo}">
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
						<input type="text" name="postTitle" value="${sessionScope.post.postTitle}"
							id="autocomplete-custom-append" class="form-control col-md-10" />
					</div>
					<label class="control-label col-md-3 col-sm-3 col-xs-12">부서구분</label>
					<div class="col-md-9 col-sm-9 col-xs-12">
						<select class="form-control" name="cNo" >
							<option >부서를 선택하세요</option>
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
							<option value="DC-1">문서보관함</option>
							<option value="DC-2">회의문서</option>
							<option value="DC-3">각종 증명서</option>
							<option value="DC-4">공문서</option>
							<option value="DC-5">거래문서</option>
							<option value="DC-6">기타</option>
						</select>
					</div>
					<div class="x_content">

						<textarea id="summernote" name="postContent" >${sessionScope.post.postContent}</textarea>
						<script>
							$('#summernote').summernote({
								height : 300, // set editor height
								minHeight : null, // set minimum height of editor
								maxHeight : null, // set maximum height of editor
								focus : true
							// set focus to editable area after initializing summernote
							});
						</script>								


					<%-- 업로드된 파일 목록 조회 --%>
					<c:if test="${fn: length(sessionScope.post.postFiles) > 0 }">
						<table border="1">
							<c:forEach var="postFile" items="${sessionScope.post.postFiles }" varStatus="loop">								
								<tr>
									<td>파일${pageScope.loop.count }</td>
									<td>${pageScope.postFile.originalFileName }</td>							
									<td><button type="button"  value="${pageScope.postFile.no }"  id="deleteBtn" class="btn btn-primary pull-right" >삭제</button></td>
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

						<div class="ln_solid"></div>

					
					</div>
					
				</div>
					<a class="btn btn-primary pull-right" href='<c:url value="postList.do" />'>목록</a>
					<button type="reset" class="btn btn-primary pull-right">취소</button>		
					<button type="submit" class="btn btn-primary pull-right">등록</button>
					 
			</div>
		</div>
	</form>
</body>
</html>