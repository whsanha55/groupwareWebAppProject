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

<style>
	#templateData th, #templateData td {
		font-size : 15px;
		text-align: center;
		vertical-align: middle;
	}
</style>

<script>
	$(document).ready(function(){
		
	    //에디터 호출
	    $('#summernote').summernote({
			  lang: 'ko-KR',  				// default: 'en-US'
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
		
	    
	    //페이지 이동 방지
	    var checkUnload = true;
	    $(window).on("beforeunload", function(){
	    	if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
	    });
	    
		
		
	    //등록 취소
		$('#reset').on('click', function(){

			checkUnload = false;
			swal({
				  title: "등록 취소",
				  text: "양식 등록을  취소하시겠습니까?",
				  icon: "error",
				  buttons : true 
				}).then((e) => {
					if(e) {
						location.href="${pageContext.request.contextPath}/admin/template.do";
					} else if(!e) {
						checkUnload = true;
						return;
					}	
				});
		});
		
		
	    
	    //양식 등록
		$('#register').on('click', function(){
			checkUnload = false;
			swal({
				  title: "양식 등록",
				  text: "양식을 등록합니다. 계속 진행하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						registerTemplate();
					} else if(!e) {
						checkUnload = true;
						return;
					}	
				});			
		});
		
	    
	    
		//양식 등록 함수
		function registerTemplate(){			
			var category = $('#category').val();
			var tmpName = $('#tmpName').val();
			var content = $('#summernote').val();
			var summary = $('#summary').val();
			var using = $(':input:radio[name=using]:checked').val();
			
			if(tmpName == "") {
				swal("양식명을 입력해주세요.", "");
				return;
			}
			
			if(content == "") {
				swal("양식 내용을 입력해주세요.", "");
				return;
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/registerTemplate.do'
				,
				method: 'POST'
				,
				data: {
					tmpName: tmpName	,
					tmpContent: content	,
					tmpSummary: summary	,
					tmpUsing: using		,
					categoryNo: category					
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					if(data == "등록 완료") {
						swal({
							  title: "등록 완료",
							  text: "양식이 등록되었습니다.",
							  icon: "success",
							  confirmButton: true,
							  showCancelButton: false
							}).then((e) => {
								if(e) {
									location.href="${pageContext.request.contextPath}/admin/template.do";
								}	
							});	

					}
					
				},
				error: function(jqXHR, textStatus, error) {
					alert("Error : " + jqXHR.status + "," + error);
				}
			});
		}//end of registerTemplate
	
		
		
		//카테고리 추가
		$('#addCategory').on('click', function(){
			
			var newCategoryName = $('#newCategoryName').val();
			
			if(newCategoryName == "") {
				swal("카테고리 이름을 입력해주세요.", "");
				return;
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/registerCategory.do'
				,
				method: 'POST'
				,
				data: {
					categoryName: newCategoryName
				},
				dataType: 'json'
				,
				success: function(data) {
					if(data.length != 0) {
						
						$('#category').empty();
						$('#modalCategory').empty();
						var htmlStr = "";
						for(var i=0; i<data.length; i++) {
							htmlStr += '<option value="' + data[i].categoryNo + '">' + data[i].categoryName + '</option>';
							$(htmlStr).appendTo('#category');
							$(htmlStr).appendTo('#modalCategory');
							htmlStr = "";
						}
						
						swal({
							  title: "등록 완료",
							  text: "양식 구분이 등록되었습니다.",
							  icon: "success",
							  confirmButton: true,
							  showCancelButton: false
							}).then((e) => {
								if(e) {
									$('.closeBtnModal1').trigger('click');			
								}	
						});						
					}//end of if
				},
				error: function(jqXHR, textStatus, error) {
					alert("Error : " + jqXHR.status + "," + error);
				}
			});
		});//end of 카테고리 추가
		
		
		
		//카테고리 삭제
		$('#delCategory').on('click', function(){
			var categoryNo = $('#modalCategory').val();
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/removeCategory.do'	//양식 입력 데이터 끌고
				,
				method: 'GET'
				,
				data: {
					categoryNo: categoryNo
				},
				dataType: 'json'
				,
				success: function(data) {
					if(data.length != 0) {
						
						$('#category').empty();
						$('#modalCategory').empty();
						var htmlStr = "";
						for(var i=0; i<data.length; i++) {
							htmlStr += '<option value="' + data[i].categoryNo + '">' + data[i].categoryName + '</option>';
							$(htmlStr).appendTo('#category');
							$(htmlStr).appendTo('#modalCategory');
							htmlStr = "";
						}
						
						swal({
							  title: "삭제 완료",
							  text: "양식 구분 삭제가 등록되었습니다.",
							  icon: "success",
							  confirmButton: true,
							  showCancelButton: false
							}).then((e) => {
								if(e) {
									$('.closeBtnModal2').trigger('click');									
								}	
						});	
					}//end of if
				},
				error: function(jqXHR, textStatus, error) {
					alert("Error : " + jqXHR.status + "," + error);
				}
			});
		});//end of 카테고리 삭제
		
		
		
		
		
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
	  
	  <table id="templateData" class="table table-striped table-bordered align-center">
		<tr>
			<th>양식 구분</th>
			<td><select class="form-control" id="category">
				<c:forEach var="category" items="${requestScope.categories }">
					<option value="${pageScope.category.categoryNo }">${pageScope.category.categoryName }</option>
				</c:forEach>
               	</select></td>
             	<td><a data-toggle="modal" data-target="#plusModal" id="modal1"><i class="fa fa-plus-circle fa-3x"></i></a>
				 <a data-toggle="modal" data-target="#minusModal"><i class="fa fa-minus-circle fa-3x"></i></a></td>
			<th>사용여부</th>
			<td>&nbsp;&nbsp;<input type="radio" name="using" value="1" checked>사용&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="using" value="0">미사용
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
  <!-- end of page content -->
  
  <!-- 모달 팝업 1 -->
  <div class="modal fade" id="plusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">양식 구분 추가</h4>
	      </div>
	      <div class="modal-body">
			<br>
			<table class="table table-striped jambo_table bulk_action">
				<thead>
					<tr class="headings">
						<th class="column-title">새 양식 구분명</th>
                    </tr>
	            </thead>
                <tbody>
					<tr class="even pointer">
						<td class="a-center "><input type="text" id="newCategoryName" name="newCategoryName" class="form-control col-md-10" /></td>
                    </tr>
				</tbody>
           </table>
	      </div>
	      <div class="modal-footer">
			<div class="buttons text-center">
				<button type="button" class="btn btn-default closeBtnModal1" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="addCategory">추가</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
	<!--모달 1번 끝-->
 
 	<!-- 모달 팝업 2 -->
	<div class="modal fade" id="minusModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
		<h4 class="modal-title" id="myModalLabel">양식 구분 삭제</h4>
	      </div>
	      <div class="modal-body">
			<br>
			<table class="table table-striped jambo_table bulk_action">
                <tbody>
                	<tr class>
                		<td>양식 구분 선택</td>
                	</tr>
					<tr class>
						<td><select class="form-control col-md-10" id="modalCategory">
							<c:forEach var="category" items="${requestScope.categories }">
								<option value="${pageScope.category.categoryNo }">${pageScope.category.categoryName }</option>
							</c:forEach></select>
						</td>
                    </tr>
				</tbody>
           </table>
	      </div>
	      <div class="modal-footer">
			<div class="buttons text-center">
				<button type="button" class="btn btn-default closeBtnModal2" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="delCategory">삭제</button>
			</div>
	      </div>
	    </div>
	  </div>
	</div>
	<!--모달 끝-->
 
 

</body>
</html>