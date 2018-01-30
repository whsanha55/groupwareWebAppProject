<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/summernote/summernote.css"
	rel="stylesheet">
<script	src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>

</head>

<script>
	
	$(document).ready(function() {
	
		//작성 날짜 구하기 function+ text 추가
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
	   
		//양식서 불러오기
		if('${requestScope.template}' != "") {
		 	$('#summernote').summernote('code','${requestScope.template.tmpContent}');
		}
	   
		
		//기안 이벤트
		$('.submitAppr').on('click',function() {
			
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
					swal({
						  title: "기안서 상신",
						  text: "기안서를 등록합니다. 계속 진행하시겠습니까?",
						  icon: "info",
						  buttons : true 
						}).then((e) => {
							if(e) {
								executeApproval(0);
								//location.href = '${pageContext.request.contextPath}/approvalMyRequest.do';
							}	
						});
					
					break;
				case '2':	//임시저장
					swal({
						  title: "기안서 임시저장",
						  text: "기안서를 임시 저장합니다. 계속 진행하시겠습니까?",
						  icon: "warning",
						  buttons : true 
						}).then((e) => {
							if(e) {
								executeApproval(4);
								//location.href = '${pageContext.request.contextPath}/approvalMyRequest.do';
							}	
						});
					break;
			}
			
		}); //기안이벤트 End
	   
		
		//기안서 등록 ajax function
		function executeApproval(approvalStatus) {
			$('input[name=apprFinalStatus]').val(approvalStatus);
			$.ajax({
				url : '${pageContext.request.contextPath}/approvalAjax.do' ,
				cache : false ,
				dataType : 'json' ,
				type : 'POST' ,
				data : $('#approvalForm').serialize() ,
				success : function(data) {
					
				} ,
				error : function(jqXHR) {
					alert(jqXHR.status);
					console.log(jqXHR);
				}
			});
		} // 등록 ajax function End
	
	});
</script>
<body>
	<form method="post" id='approvalForm' enctype="multipart/form-data">
   <span>
      <span class="col-md-2 col-sm-2 col-xs-2">
        <select class="form-control" name ="receiverNo">
          <option value='123'>1번라인</option>
          <option value='123'>2번라인</option>
          <option value='123'>4번라인</option>
        </select>
      </span>
	</span>
	<a class="btn btn-primary" href="a_plain_page.html">관리</a>

	
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
			<td>김사원</td>
			<%-- <td>${requestScope.??.name }</td> --%>
			<th>부서</th>
			<td>인사1팀</td>
			<%-- <td>${requestScope.??.cName }</td> --%>

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
	  
	<input type="hidden" name="tmpNo" value = "${requestScope.template.tmpNo }">
	<input type="hidden" name="apprFinalStatus" >
	</form>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </body>
</html>