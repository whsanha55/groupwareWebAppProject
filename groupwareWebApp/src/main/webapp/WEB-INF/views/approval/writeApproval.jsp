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
	
	table[id^='lineTable'] {
		width : 100px;
	}
	table[id^='lineTable'] tr:first-child {
		height : 20px;
	}
	table[id^='lineTable'] tr:nth-child(2) {
		height : 40px;
		text-align : center;
	}
	table[id^='lineTable'] th {
		background-color: #3f5367; color: #ECF0F1;
		text-align: center;
	}
	
</style>
</head>

<script>
	
	$(document).ready(function() {
	
		//결재선 출력
		
		var isExist = true;
		//페이지 이탈 경고창
		$(window).on('beforeunload', function() {
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
		
		
		//결재선 번호(이름) select 이벤트
		$('select[name=receiverNo]').on('change',function() {
		var receiverNo = $('select[name=receiverNo]').val();
			if(receiverNo == 0) {
				return false;
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/receiverNoAjax.do' ,
				cache : false ,
				dataType : 'json' ,
				type : 'GET' ,
				data : {
					receiverNo : receiverNo
				} ,
				success : function(data) {
					console.log(data);
					var textApprEmpName = "";
					var textApprDuty = "<th rowspan='2'>결재</th>";
					var textRefEmpName = "";
					var textRefEmpDuty = "<th rowspan='2' >참조</th>";
					var apprCount = 0;
					var refCount = 0;
					for(var i=0;i<data.length;i++) {
						if(data[i].apprType ==0) {	//결재
							apprCount++;
							textApprEmpName += "<td>" + data[i].lineEmployee.empName + "</td>";
							textApprDuty += "<th>" + data[i].lineEmployee.duty + "</th>";
						} else { //참조
							refCount++;
							textRefEmpName += "<td>" + data[i].lineEmployee.empName + "</td>";
							textRefEmpDuty += "<th>" + data[i].lineEmployee.duty + "</th>";
						}
					}
					$('#lineTableA').css('width', (apprCount+1) * 100 + "px");
					$('#dutyTableA').html(textApprDuty);
					$('#empNameTableA').html(textApprEmpName);
					
					$('#lineTableR').css('width', (refCount+1) * 100 + "px");
					$('#dutyTableR').html(textRefEmpDuty);
					$('#empNameTableR').html(textRefEmpName);
					
				} ,
				error : function(jqXHR) {
					alert(jqXHR.status);
					console.log(jqXHR);
				}
			});
		});
		

		if("${approval.receiverNo}" != 0) {
			$('select[name=receiverNo]').val("${approval.receiverNo}").trigger('change');
		}
		
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
		}else if('${requestScope.approval}' != ""){
			$('#summernote').summernote('code','${requestScope.approval.apprContent}');
		}else {
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
		
		//hidden tmpNo
		if('${requestScope.template}' != '') {
			$('input[name=tmpNo]').val('${requestScope.template.tmpNo}');
		} else if ('${requestScope.approval}' != '') {
			$('input[name=tmpNo]').val('${requestScope.approval.template.tmpNo}');
		}
		
		//기안서 등록 ajax function
		function executeApproval(approvalStatus) {
			$('input[name=apprFinalStatus]').val(approvalStatus);
			var _data = new FormData($("#approvalForm")[0]);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/approvalAjax.do',
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
			myReceiverList($('select[name=receiverNo]').val());
			$('#receiverBody').html("");
			 
		})
		
		
		
		
		
	});	//document ready End
	
</script>
<body>


<!-- <button class="btn btn-default" id='modalReceiver1'>관리</button> -->
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-lg">
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
		<table id='lineTableA' class="table table-striped ">
			<tr id='dutyTableA'>
				<th rowspan="2" class="">결재</th>
			</tr>
			<tr id='empNameTableA'>
			</tr>
		</table>
		<table id='lineTableR' class="table table-striped">
			<tr id='dutyTableR' >
				<th rowspan="2" >참조</th>
			</tr>
			<tr id='empNameTableR'>
			</tr>
		</table>
		

		<table id="approvalData" class="table table-striped table-bordered">
		<tr>
			<th>양식명</th>
			<c:choose>
				<c:when test="${requestScope.template !=null}">
					<td>${requestScope.template.tmpName }</td>
				</c:when>
				<c:when test="${requestScope.approval !=null}">
					<td>${requestScope.approval.template.tmpName }</td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>
			</c:choose>
				
				
			
			
			
			<th>보존기한</th>
			<td><select class="form-control" id="validDate" name="validDate">
			
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
			<td>${requestScope.user.empName }</td>
			<th>부서</th>
			<td>${requestScope.user.deptName }</td>

		</tr>
		<tr>
			<th>작성일</th>
			<td id= 'dateTableData'></td>
			<th>긴급여부</th>
			<td>
				<select class="form-control" name = 'urgency' >
                	<option value='0' selected>일반</option>
                    <option value='1'>긴급</option>
                </select>
		    </td> 
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				<c:choose>
					<c:when test="${requestScope.approval !=null}"> 
						<input type="text" name="apprTitle" class="form-control col-md-10" value="${requestScope.approval.apprTitle}">
					</c:when>
					<c:otherwise >
						<input type="text" name="apprTitle" class="form-control col-md-10"/>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>

	</table>

	  <textarea id="summernote" name="apprContent"></textarea>
	  
	 <div class="col-md-12">
      	<div class="row">
     	  <div class="control-group" id="fields">
			<div class="controls">
				<div class="entry input-group col-xs-3">
					<input type="file" class="btn btn-dark" name="upload" >
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
 
	<input type="hidden" name="tmpNo" >	
	<input type="hidden" name="apprFinalStatus" >
	<c:if test="${requestScope.approval.apprFinalStatus !=3 }">
		<input type="hidden" name="deleteAppr" value="${requestScope.approval.apprNo}" >
	</c:if>
	
	</form>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </body>
</html>