<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.groupware.domain.authority.BoardVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
			$('#display1').click(function(){
				$('#display').css('display','block');
			});
			
			$('#reset').click(function(){
				$('#display').css('display','none');
			});
			
			//등록
			$('#display').on('click','#submit',function(){
				var params = jQuery('#serialize\Form').serialize();
				
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
						htmlStr += "<tr><td id="+ data.boardNo + ">" + data.boardName + "</td></tr>";
						$('#boardList tbody').append(htmlStr);
						$('#display').css('display','none');
					}
					,
					error : function(jqXHR, textStatus, errorThrown){
						if($('#boardName').val() == ""){
							alert("이름을 입력하세요! ");
							$('#boardName').focus();
						}else if(!$(':input:radio[name=isUse]:checked').val()){
							alert("사용 유무를 선택해주세요!");
						}else if($('[name=fileCount]>option:selected').val() == '0'){
							alert("파일 개수를 선택해주세요!");
							$('#fileCount').focus();
						}else if(!$(':input:radio[name=isNotice]:checked').val()){
							alert("공지사항 사용 유무를 선택해주세요!");
						}else if(!$(':input:radio[name=isComment]:checked').val()){
							alert("코멘트 사용유무를 선택해주세요!");
						}else if(!$(':input:radio[name=isDeptDivide]:checked').val()){
							alert("부서 구분을 선택해주세요!");
						}else if(!$(':input:radio[name=isDocuType]:checked').val()){
							alert("문서종류 카테고리 선택해주세요!");
						}
					}
				});
			});
			
			
			//수정 - 게시판 조회
			$('#boardList').on('click','.selectBoard',function(){ 
				$('#display').css('display','block');
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

							$('#table_empty').remove();
							var htmlStr = "";
							htmlStr += "<table id='datatable-keytable table_empty' class='table table-striped col-8'>";
							htmlStr += "<tr><td class='col-md-4' style='background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;'>문서관리 리스트</td><td>&nbsp;</td></tr>";
							htmlStr +="<tr><td class='col-md-4' style='background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;'>게시판 이름</td>";
							htmlStr +="<td>"+ data.boarName +"</td></tr>";
							htmlStr +="<tr><td class='col-md-4' style='background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;'>사용유무</td>";
							htmlStr +="<td><div class='radio'><label> <input type='radio' name='isUse' value='Y'> 사용함</label><label> <input type='radio' name='isUse' value='N'>사용안함</label></div></td></tr>"; 
							htmlStr +="<tr><td class='col-md-4' style='background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;'>문서관리 리스트</td><td>&nbsp;</td></tr>";
				
							$(htmlStr).append('#table_empty');							
							/* alert(data.isUse); */
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
					}
					,
					error : function(jqXHR, textStatus, errorThrown){
						alert('error: ' + jqXHR.status);
					}
				});
			}); 
	
		
		
		$(document).keydown(function(e) {
		    key = (e) ? e.keyCode : event.keyCode;
		     
		    var t = document.activeElement;
		     
		    if (key == 8 || key == 116 || key == 17 || key == 82) {
		        if (key == 8) {
		            if (t.tagName != "INPUT") {
		                if (e) {
		                    e.preventDefault();
		                } else {
		                    event.keyCode = 0;
		                    event.returnValue = false;
		                }
		            }
		        } else {
		            if (e) {
		                e.preventDefault();
		            } else {
		                event.keyCode = 0;
		                event.returnValue = false;
		            }
		        }
		    }
		});
		
	});
			
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
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
							<th class="column-title">문서관리 리스트</th>

						</tr>
					</thead>


					<tbody>
						<c:forEach var="board" items="${requestScope.board}" >
						<tr>		
							<td class="selectBoard" id="${pageScope.board.boardNo}">${pageScope.board.boardName}</td>
						</tr>
						</c:forEach>					
					</tbody>
				</table>
				<div class="text-right">
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
								id="autocomplete-custom-append" class="form-control col-md-2"></td>

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
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">문서관리
								리스트</td>
							<td>문서관리</td>

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
									<label> <input type="radio" name="isNotice" value="Y"> 사용함</label>
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
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">문서종류
								카테고리 사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isDocuType" value="Y"> 사용함</label>
									<label> <input type="radio" name="isDocuType" value="N">사용안함</label>
								</div></td>

						</tr>



					</table>
					<div class="text-right">
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