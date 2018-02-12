<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.groupware.domain.authority.BoardVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	var boardNo = 0;
	
	//추가버튼 동작
	$('#display1').click(function(){
		$('#display').css('display','block');
		$('#remove').css('display','none');
		$('#modify').css('display','none');
		$('#submit').css('display','block');	
		$('#display').on('click','#reset', function(){
			$('#display').css('display','none');	
		});
	
	});	
	
	$('#plus').on('click','#display1', function(){
		//추가 클릭시 모든 데이터 초기화
		$('input[type="text"]').val("");
		$('input[name="isUse"]:radio').removeAttr('checked');
		$('input[name="isNotice"]:radio').removeAttr('checked');
		$('input[name="isComment"]:radio').removeAttr('checked');
		$('input[name="isDeptDivide"]:radio').removeAttr('checked');
		$('input[name="isDocuType"]:radio').removeAttr('checked');
		$('#fileCount option').removeAttr('selected');
	}); 
	
	//등록
	$('#display').on('click','#submit',function(){
		if($($('input:text[name=boardName]')).val() == "" ){
			swal("이름을 입력하세요! ");
			$('#boardName').focus();
			return false;
		} 
		
		if(!($('input:radio[name=isUse]').is(':checked'))){
			swal("사용유무를 선택해주세요");
			$('input:radio[name=isUse]').focus;
			return false;
		}
		
		if($("select[name='fileCount'] option:selected").index() <1) {
			swal("파일 개수를 선택해주세요");
			$("select[name='fileCount'] : eq(0)").focus();
			return false;
		}
		
		
		if(!($('input:radio[name=isNotice]').is(':checked'))){
			swal("공지사항 사용유무를 선택해주세요");
			$('input:radio[name=isNotice]').focus;
			return false;
		}
		
		if(!($('input:radio[name=isComment]').is(':checked'))){
			swal("코멘트 사용유무를 선택해주세요");
			$('input:radio[name=isComment]').focus;
			return false;
		}
		
		if(!($('input:radio[name=isDeptDivide]').is(':checked'))){
			swal("부서 사용유무를 선택해주세요");
			$('input:radio[name=isDeptDivide]').focus;
			return false;
		}
		
		if(!($('input:radio[name=isDocuType]').is(':checked'))){
			swal("게시판 사용유무를 선택해주세요");
			$('input:radio[name=isDocuType]').focus;
			return false;
		}
		
		var params = jQuery('#serializeForm').serialize();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/registerBoardAjax.do'
			,
			method : 'POST'
			,
			dataType: 'json'
			,
			data : params
			,
			async : true
			,
			cache : true
			,
			success : function(data, textStatus, jqXHR){
				var htmlStr = "";
				htmlStr += "<tr><td id="+ data.boardNo + " class='selectBoard'>" + data.boardName + "</td></tr>";
				$('#boardList tbody').append(htmlStr);	
				swal("등록이 완료되었습니다!","");
				$('#display').css('display','none');
			}
			,
			error : function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
		});
	});	
	
	
	//게시판 번호에 해당하는 게시판 상세조회
	$('#boardList').on('click','.selectBoard',function(){ 
	    boardNo = $(this).attr("id");

		$('#display').css('display','block');
			$('#submit').css('display','none');
			$('#modify').css('display','block');
			$('#remove').css('display','block');
		
		$('#plus').on('click','#display1', function(){
			//추가 클릭시 모든 데이터 초기화
			$('input[type="text"]').attr("value","");
			$('input[name="isUse"]:radio').removeAttr('checked');
			$('input[name="isNotice"]:radio').removeAttr('checked');
			$('input[name="isComment"]:radio').removeAttr('checked');
			$('input[name="isDeptDivide"]:radio').removeAttr('checked');
			$('input[name="isDocuType"]:radio').removeAttr('checked');
			$('#fileCount option').removeAttr('selected');
		}); 
		
		$('#display').on('click','#reset', function(){
			$('#display').css('display','none');	
		});
		$.ajax({
			url : '${pageContext.request.contextPath}/retrieveBoardAjax.do'
			,
			method : 'GET'
			,
			data : {
				boardNo: $(this).attr("id")
			}
			,
			dataType: 'json'
			,
			async : true
			,
			cache : true
			,
			success : function(data, textStatus, jqXHR){

				
					var value = data.boardName;
					$('input[name=boardName]').val(value);
					
					
					if(data.isUse == 'Y') {
						$('input[name=isUse][value=Y]').prop('checked', true);
					}else{
						$('input[name=isUse][value=N]').prop('checked', true);
						
					}
					
					if(data.isNotice == 'Y' ) {
						$('input[name=isNotice][value=Y]').prop('checked', true);
					}else{
						$('input[name=isNotice][value=N]').prop('checked', true);
					}
					
					if( data.isComment == 'Y' ) {
						$('input[name=isComment][value=Y]').prop('checked', true);
					}else{
						$('input[name=isComment][value=N]').prop('checked', true);
					}
					
					if( data.isDeptDivide == 'Y') {
						$('input[name=isDeptDivide][value=Y]').prop('checked', true);
					}else{
						$('input[name=isDeptDivide][value=N]').prop('checked', true);
					}
			
					if( data.isDocuType == 'Y') {
						$('input[name=isDocuType][value=Y]').prop('checked', true);
					}else{
						$('input[name=isDocuType][value=N]').prop('checked', true);
					}
					
					$('#fileCount').each(function(){
						$(this).find("option[value="+data.fileCount+"]").attr("selected","selected");
					})
					
					
					
			}
			,
			error : function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
		});
		
	});
	
	//게시판 삭제
	$('#display').on('click','#remove',function() {
		
		swal({
			  title: "게시판을 삭제하시겠습니까?",
			  icon: "info",
			  buttons : true 
			}).then((e) => {
				if(e) {
					$.ajax({
						url : '${pageContext.request.contextPath}/removeAjax.do'
							,
							method : 'POST'
							,
							data : {
								boardNo: boardNo
							}
							,
							dataType: 'json'
							,
							async : true
							,
							cache : true
							,
							success : function(data, textStatus, jqXHR){	
								
								if(data.isSuccess == "true"){
									swal("삭제완료!");	
									$('#' + boardNo).parent('tr').remove(); 
									$('#display').css('display','none');
								}else if(data.isSuccess == "false"){
									swal("게시글이 존재합니다.");
								} 
								
							}
							,
							error : function(jqXHR, textStatus, errorThrown){
								alert('error: ' + jqXHR.status);
							}
					
					});
				}	
			});
	});
	
	//게시글 수정
	$('#display').on('click','#modify',function(){
		var params = jQuery('#serializeForm').serialize();
		
		swal({
			  title: "게시판을 수정하시겠습니까?",
			  icon: "info",
			  buttons : true 
			}).then((e) => {
				if(e) {
					$.ajax({
						url : '${pageContext.request.contextPath}/modifyAjax.do?boardNo=' + boardNo  
							,
							method : 'POST'
							,
							data : params
							,
							dataType: 'json'
							,
							async : true 
							,
							cache : true
							,
							success : function(data, textStatus, jqXHR){	
								swal("수정 완료!","");
								$('#'+ boardNo).text(data.boardName);
								$('#display').css('display','none');
								
							}
							,
							error : function(jqXHR, textStatus, errorThrown){
								alert('error: ' + jqXHR.status);
							}
					
						});
				}
			});

	});
	
});			
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12" id="all">
			<input type="hidden" name="boardNo" value="${requestScope.boardNo}" />
			<input type="hidden" name="boardName" value="${requestScope.boardName}" />
		<div class="x_panel">
			<div class="x_title">
				<h2>게시판 관리</h2>

				<div class="clearfix"></div>
			</div>
			<div class="col-md-4">
				<table id="boardList" class="table table-striped jambo_table bulk_action ">
					<thead>
						<tr class="headings">
							<th class="column-title">게시판 관리 리스트</th>

						</tr>
					</thead>


					<tbody>
						<c:forEach var="board" items="${requestScope.board}" >
						<tr class="selectBoardNo">		
							<td class="selectBoard" id="${pageScope.board.boardNo}">${pageScope.board.boardName}</td>
						</tr>
						</c:forEach>					
					</tbody>
				</table>
				<div class="text-right" id="plus">
					<button class="btn btn-primary" id="display1">추가</button>
				</div>
			</div>
			
			<form name="serializeForm" id="serializeForm">
			<div class="col-md-6" id="display" style="display:none;">
				<div class="x_panel">

					<table id="datatable-keytable table_empty" class="table table-striped col-8">
						<tr>
							<td class="col-md-4 " 
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">문서관리
								리스트</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="col-md-4" 
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">게시판
								이름</td>
							<td id="boardName"><input type="text" name="boardName" id="boardName"
								id="autocomplete-custom-append" class="form-control col-md-2" ></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">사용
								유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isUse" value="Y"> 사용함</label>
									<label> <input type="radio" name="isUse" value="N">사용안함</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">게시판 관리 리스트</td>
							<td>게시판 관리</td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">업로드
								파일 사용 개수</td>
							<td><select class="select2_group form-control" id = "fileCount" name="fileCount">

									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
							</select></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">공지사항
								사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isNotice" value="Y" > 사용함</label>
									<label> <input type="radio" name="isNotice" value="N">사용안함</label>
									
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">코멘트
								사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isComment" value="Y"> 사용함</label>
									<label> <input type="radio" name="isComment" value="N">사용안함</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">부서
								구분 사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isDeptDivide" value="Y"> 사용함</label>
									<label> <input type="radio" name="isDeptDivide" value="N">사용안함</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">게시판
								카테고리 사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isDocuType" value="Y"> 사용함</label>
									<label> <input type="radio" name="isDocuType" value="N">사용안함</label>
								</div></td>

						</tr>
					</table>
					<div class="text-right">
						<button class="btn btn-primary" type="button" id="modify">수정</button>
						<button class="btn btn-primary" type="button" id="remove">삭제</button>
						<button class="btn btn-primary" type="button" id="submit">등록</button>
						<button class="btn btn-primary" type="button" id="reset">닫기</button>
					</div>
					
				</div>
			</div>
			</form>
		</div>
	</div>
	
</body>
</html>