
<%-- addPost.jsp --%>
<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0//js/froala_editor.pkgd.min.js"></script>
    <script>
   $(document).ready(function() { 
		var total = 0;
	   $(function() {
		   $('textarea#froala-editor').froalaEditor()
		 });
	   
		$('#addPost').click(function(){			
		    
			if($($('input:text[name=postTitle]')).val() == "" ){
				swal("제목을 입력하세요.");
				$('#postTitle').focus();
				return false;
			} 
			
			if($($('select[name=documentNo]')).val() == "D-00" ){
				
				swal("문서를 선택하세요.");
				$('#documentNo').focus();
				return false;
			} 
			
	 		if($($('textarea[name=postContent]')).val() == "" ){
				swal("내용을 입력하세요.");
				$('#postContent').focus();
				return false;
			}  
	 		
	 		swal({
				title: "게시글 등록",   
				text: "게시글을 등록합니다. 계속 진행하시겠습니까?",
				icon: "info",
				buttons : true 
			}).then((e) => {
				if(e) {
					$('#add').submit();
				} else if(!e) {
					checkUnload = true;
					return;
				}
			});		
		
		});
		
       //첨부파일 추가 및 삭제 이벤트
      $('form').on('click', '.btn-add', function(e) {
           e.preventDefault();
		   var fileCount = ${param.fileCount};
           var controlForm = $('.controls:first') ;
           var currentEntry = $(this).parents('.entry:first');
           var newEntry = $(currentEntry.clone()).appendTo(controlForm);
			var count = $(this).size();
		    total = total + count;           
           newEntry.find('input').val('');
           controlForm.find('.entry:not(:last) .btn-add').removeClass('btn-add').addClass('btn-remove')
           .removeClass('btn-success').addClass('btn-danger').html('<span class="glyphicon glyphicon-minus"></span>');
           if(fileCount < total+1) {
				swal(fileCount + "개의 파일만 첨부 가능합니다.",'error');
				$(this).parents('.entry:first').remove();
				$(this).val('');
			}
           
      }).on('click', '.btn-remove', function(e) {
            $(this).parents('.entry:first').remove();
            var count = $(this).size();
            total = total - count;
            total = total - 1;
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

   });
</script>
<style>
	.fr-element {
		height: 400px;
	} 

</style>
</head>
<body>
	<form id="add" action="<%=request.getContextPath()%>/addPost.do" onsubmit=""  method="post"
		enctype="multipart/form-data">
		<input type = "hidden" name ="boardNo" value = "${requestScope.boardNo}">
		<input type = "hidden" name ="boardName" value = "${param.boardName}">
		<input type = "hidden" name ="empName" value = "${param.empName}">
		<input type = "hidden" name ="fileCount" value = "${param.fileCount}">
		<input type = "hidden" name ="isComment" value = "${param.isComment}">
		<input type = "hidden" name ="department" value = "${param.department}">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>${param.boardName}</h2>
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
					<label class="control-label col-md-3 col-sm-3 col-xs-12">문서종류</label>
					<div class="col-md-9 col-sm-9 col-xs-12">
						<select class="form-control" name="documentNo" >
							<option value="D-00">문서를 선택하세요</option>
							<option value="D-01">문서보관함</option>
							<option value="D-02">회의문서</option>
							<option value="D-03">각종 증명서</option>
							<option value="D-04">공문서</option>
							<option value="D-05">거래문서</option>
							<option value="D-06">기타</option>
						</select>
					</div>
					<div class="x_content">

						<textarea id="froala-editor" name="postContent" rows="20" style="width: 100%" ></textarea>

						<div class="ln_solid"></div>
						<div class="col-md-12">
							<div class="row">
								<div class="control-group" id="fields">
									<div class="controls">
										<div class="entry input-group col-xs-3">
											<input type="file" class="btn btn-dark" name="upload">
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
				</div>
				<a class="btn btn-primary pull-right" type="reset">취소</a>
				&nbsp;
				<button type="submit" class="btn btn-primary pull-right" id="addPost">등록</button>
				<a class="btn btn-primary pull-right" href='<c:url value="postList.do?boardNo=${param.boardNo }&boardName=${param.boardName}&fileCount=${param.fileCount}&isComment=${param.isComment}&empName=${param.empName}&department=${param.department} "/>'>목록</a>				 
			</div>
		</div>
	</form>
</body>
</html>