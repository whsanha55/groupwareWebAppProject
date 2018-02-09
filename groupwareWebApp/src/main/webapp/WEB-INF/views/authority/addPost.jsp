
<%-- addPost.jsp --%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
    <script>
   $(document).ready(function() {       
       
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

   });
</script>
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
							<option value="DC-1">문서보관함</option>
							<option value="DC-2">회의문서</option>
							<option value="DC-3">각종 증명서</option>
							<option value="DC-4">공문서</option>
							<option value="DC-5">거래문서</option>
							<option value="DC-6">기타</option>
						</select>
					</div>
					<div class="x_content">

						<textarea id="summernote" name="postContent"></textarea>
						<script>
							$('#summernote').summernote({
								height : 300, // set editor height
								minHeight : null, // set minimum height of editor
								maxHeight : null, // set maximum height of editor
								focus : true
							// set focus to editable area after initializing summernote
							});
						</script>

						<div class="ln_solid"></div>
						<div class="col-md-12">
							<div class="row">
								<div class="control-group" id="fields">
									<div class="controls">
										파 일 : <input type="file" name="upload"> 
										파 일 : <input type="file" name="upload"> 
										파 일 : <input type="file" name="upload">
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
				<a class="btn btn-primary pull-right" href='<c:url value="postList.do" />'>취소</a>
				&nbsp;
				<button type="submit" class="btn btn-primary pull-right">등록</button>				 
			</div>
		</div>
	</form>
</body>
</html>