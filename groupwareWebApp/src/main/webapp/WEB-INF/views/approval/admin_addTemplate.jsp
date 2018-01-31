<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>양식서 추가</title>
<link href="${pageContext.request.contextPath}/resources/summernote/summernote.css"
	rel="stylesheet">
<script	src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	$(document).ready(function(){
		
	    //에디터 호출
	    $('#summernote').summernote({
			  lang: 'ko-KR',  // default: 'en-US'
			  height: 500,                 // set editor height
			  minHeight: 300,             // set minimum height of editor
			  maxHeight: 800,             // set maximum height of editor
			  focus: false ,
			  toolbar: [
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize'],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']] ,
				    ['picture'] ,
				    ['link'] ,
				    ['table'] ,
				    ['undo'] ,
				    ['redo'] 
				  ] 
		}); 
		
		
		
	    //등록 취소
		$('#reset').on('click', function(){
			swal({
				  title: "등록 취소",
				  text: "양식 등록을  취소하시겠습니까?",
				  icon: "error",
				  buttons : true 
				}).then((e) => {
					if(e) {
						location.href="${pageContext.request.contextPath}/admin/template.do";
					}	
				});
		});
		
		
	    
	    //양식 등록
		$('#insert').on('click', function(){
			swal({
				  title: "양식 등록",
				  text: "양식을 등록합니다. 계속 진행하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						registerTemplate();
						location.href="${pageContext.request.contextPath}/admin/template.do";
					}	
				});			
		});
		
	    
	    
		//양식 등록 함수
		function registerTemplate(){
			
			var category;
			var tmpName = $('#tmpName').val();
			var content = $('#summernote').val();
			var summary = $('#summary').val();
			var using = $('#using').val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/registerTemplate.do'
				,
				method: 'POST'
				,
				data: {
					tmpName: tmpName
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					swal("등록 완료", "양식 등록이 완료되었습니다.", "success");
				},
				error: function(jqXHR, textStatus, error) {
					alert("Error : " + jqXHR.status + "," + error);
				}
			});
		}//end of registerTemplate
	
		
		
		//카테고리 추가
		$('#plus').on('click', function(){
			
		});
		
		
		
		//카테고리 삭제
		$('#minus').on('click', function(){
			
		});
		
		
		
		
		
	});	
</script>



</head>





<body>
          
	<div class="x_panel">
		<div class="x_title">
			<h2>양식 등록</h2>
		<div class="clearfix" width="1200px"></div>
		</div>

	  <a class="btn btn-primary pull-right" id="reset">취소</a>
	  <a class="btn btn-primary pull-right" id="register">등록</a>
	  
	  <table id="templateData" class="table table-striped table-bordered">
		<tr>
			<th>양식 구분</th>
			<td><select class="form-control" id="category">
				<c:forEach var="category" items="${requestScope.categories }">
					<option value="${pageScope.categoryNo }">${pageScope.categoryName }</option>
				</c:forEach>
               	</select></td>
             	<td><a href="#/plus-circle"><i class="fa fa-plus-circle fa-3x" id="plus"></i></a>
				 <a href="#/minus-circle"><i class="fa fa-minus-circle fa-3x" id="minus"></i></a></td>
			<th>사용여부</th>
			<td><select class="form-control" id="using">
					<option value="1">사용</option>
			        <option value="0">미사용</option>
		        </select>
		    </td> 
		</tr>
		<tr>
			<th>양식명</th>
			<td colspan="4"><input type="text" name="tmpName" id="tmpName" class="form-control col-md-10"/></td>
		</tr>										
		<tr>
			<th>양식 설명</th>
			<td colspan="4"><input type="text" name="summary" id="summary" class="form-control col-md-10"/></td>
		</tr>
	</table>

	<textarea id="summernote" name="tmpContent"></textarea>

	   </div>
    </div>
  </div>
 

</body>
</html>