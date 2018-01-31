<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/summernote/summernote.css"
	rel="stylesheet">
<script	src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<style>
	.modal-dialog.modal-cSize {
		width: 90%;
	}
	.modal-content.modal-cSize {
		height : auto;
		min-height : 80%;
	}
</style>
</head>

<script>
	
	$(document).ready(function() {
	
		var isExist = true;
		//페이지 이탈 경고창
		$(window).on('beforeunload', function() {
			isExist = false;	//테스트용 삭제필요!!!!!!!!!!!!
			if(isExist) return '';
		})
		
		
		//작성 날짜 구하기
		function getDate() {
			var date = new Date();
			var todayDate = date.getFullYear() + "년 ";
			todayDate += date.getMonth() + 1 + "월 ";
			todayDate += date.getDate() + "일";
			return todayDate;
		}
		$('#dateTableData').text(getDate());
		
		
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
	   
	    
		//에디터 내부에 양식서 폼 불러오기
		if('${requestScope.template}' != "") {
		 	$('#summernote').summernote('code','${requestScope.template.tmpContent}');
		} else {
			$('#summernote').summernote('code','');
		}
	   
		
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
		
		
		//기안 이벤트
		$('.submitAppr').on('click',function() {
			isExist = false;
			
			switch ($(this).attr('id').split('_')[1]) {
				case '0':	//취소
					swal({
						  title: "기안 취소",
						  text: "정말  취소하시겠습니까?",
						  icon: "error",
						  buttons : true 
						}).then((e) => {
							if(e) {
								location.href = '${pageContext.request.contextPath}/approvalMyRequest.do';
							}	
						});
					break;
				case '1':	//상신
					if(validateApproval()) {
						return false;
					};
				
					swal({
						  title: "기안서 상신",
						  text: "기안서를 등록합니다. 계속 진행하시겠습니까?",
						  icon: "info",
						  buttons : true 
						}).then((e) => {
							if(e) {
								executeApproval(0);
							}	
						});
					
					break;
				case '2':	//임시저장
					if(validateApproval()) {
						return false;
					};
					swal({
						  title: "기안서 임시저장",
						  text: "기안서를 임시 저장합니다. 계속 진행하시겠습니까?",
						  icon: "warning",
						  buttons : true 
						}).then((e) => {
							if(e) {
								executeApproval(4);
							}	
						});
					break;
			}
			
		}); //기안이벤트 End
	   
		//기안서 제목과 내용 validate function
		function validateApproval() {
			if($('select[name=receiverNo]').val() == '0') {
				swal("결재선을 선택하지 않으셨습니다","");
				return true;
			}
			if($('input[name=apprTitle]').val().trim() == '') {
				swal("제목을 입력해주세요","");
				return true;
			}
			if($('#summernote').summernote('code') == '') {
				swal("내용을 입력해주세요","");
				return true;
			}
			
			return false;
		}
		
		
		//기안서 등록 ajax function
		function executeApproval(approvalStatus) {
			$('input[name=apprFinalStatus]').val(approvalStatus);
			var _data = new FormData($("#approvalForm")[0]);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/approvalAjax.do' ,
				cache : false ,
				dataType : 'json' ,
				processData :false ,
				contentType : false ,
				type : 'POST' ,
				data : _data ,
				success : function(data) {
					if(data == 4) {		//임시저장
						swal({
							  title: "임시 저장성공",
							  text: "확인을 누르시면 임시 보관함으로 이동합니다",
							  icon: "success",
							}).then((e) => {
								location.href = '${pageContext.request.contextPath}/approvalTemp.do';
							});
							
						
					} else { //data == 0, 상신
						swal({
							  title: "작성 완료",
							  text: "확인을 누르시면 결재 요청함으로 이동합니다",
							  icon: "success",
							}).then((e) => {
								location.href = '${pageContext.request.contextPath}/approvalMyRequest.do';
							});
							
						
					}
				} ,
				error : function(jqXHR) {
					alert(jqXHR.status);
					console.log(jqXHR);
				}
			});
		} // 등록 ajax function End
	
		
		//결재선 관리 이벤트
		$('#modalReceiver').on('click',function() {
			$('#receiverBody').load('${pageContext.request.contextPath}/receiverModal.do');
			$('#layerpop').modal({
				backdrop: 'static', 
				keyboard: false
			});
		});
	
		$('#receiverContent').on('click',function() {
			
		})
		
		$('#modalCloseBtn').on('click',function() {
			$('#receiverBody').html("");
			//alert('hi');
		})
		
		
	});	//document ready End
	
</script>
<body>


<!-- <button class="btn btn-default" id='modalReceiver1'>관리</button> -->
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
			<div class="modal-header nav_menu">
				<h3>결재선 지정</h3>
				</div>
				<div class="modal-body" id="receiverBody"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalCloseBtn"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>



	<form method="post" id='approvalForm' enctype="multipart/form-data">
   <span>
      <span class="col-md-2 col-sm-2 col-xs-2">
        <select class="form-control" name ="receiverNo">
          <option value='0'>결재선을 선택하세요</option>
          <c:forEach var="receiver" items="${requestScope.receivers}">
          <option value='${pageScope.receiver.receiverNo }'>${pageScope.receiver.receiverName }</option>
          </c:forEach>
        </select>
      </span>
	</span>
	<!-- <button class="btn btn-primary" id="modalReceiver" type="button">관리</button> -->
	<button class="btn btn-primary" id='modalReceiver' type="button">관리</button>

	
	<button type="button" class="btn btn-primary pull-right submitAppr" id="submitApprBtn_1">상신</button>
	<button type="button" class="btn btn-primary pull-right submitAppr" id="submitApprBtn_2">임시저장</button>
	<button type="button" class="btn btn-primary pull-right submitAppr" id="submitApprBtn_0">취소</button>			
	<table id="approvalLine" class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th rowspan="2">결재</th>
				<th>사장</th>
				<th>부장</th>
				<th>팀장</th>
				<th>대리</th>
			</tr>
			<tr>
				<td>사ㅇㅇ</td>
				<td>부ㅇㅇ</td>
				<td>팀ㅇㅇ</td>
				<td>대ㅇㅇ</td>
			</tr>
			<tr>
				<th rowspan="2">참조</th>
				<th>부장</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<td>참ㅇㅇ</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>

	<table id="approvalData" class="table table-striped table-bordered">
		<tr>
			<th>양식명</th>
			<td>${requestScope.template.tmpName }</td>
			<th>보존기한</th>
			<td><select class="form-control" name="validDate">
			
					<option value='1'>1년</option>
					<option value='3'>3년</option>
					<option value='5'>5년</option>
					<option value='10'>10년</option>
					<option value='0' selected>영구보존</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<!-- <td>김사원</td> -->
			<td>${requestScope.user.empName }</td>
			<th>부서</th>
			<!-- <td>인사1팀</td> -->
			<td>${requestScope.user.deptName }</td>

		</tr>
		<tr>
			<th>작성일</th>
			<td id= 'dateTableData'></td>
			<th>긴급여부</th>
			<td>
				<select class="form-control" name = 'urgency'>
                	<option value='0' selected>일반</option>
                    <option value='1'>긴급</option>
                </select>
		    </td> 
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" name="apprTitle" class="form-control col-md-10"/></td>
		</tr>

	</table>

	  <textarea id="summernote" name="apprContent"></textarea>
	  
	 <div class="col-md-12">
      	<div class="row">
     	  <div class="control-group" id="fields">
			<div class="controls">
				<div class="entry input-group col-xs-3">
					<input type="file" class="btn btn-primary" name="upload" >
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
	<input type="hidden" name="tmpNo" value = "${requestScope.template.tmpNo }">
	<input type="hidden" name="apprFinalStatus" >
	</form>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </body>
</html>