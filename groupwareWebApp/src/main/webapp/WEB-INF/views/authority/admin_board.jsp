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
	
	//�߰���ư ����
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
		//�߰� Ŭ���� ��� ������ �ʱ�ȭ
		$('input[type="text"]').val("");
		$('input[name="isUse"]:radio').removeAttr('checked');
		$('input[name="isNotice"]:radio').removeAttr('checked');
		$('input[name="isComment"]:radio').removeAttr('checked');
		$('input[name="isDeptDivide"]:radio').removeAttr('checked');
		$('input[name="isDocuType"]:radio').removeAttr('checked');
		$('#fileCount option').removeAttr('selected');
	}); 
	
	//���
	$('#display').on('click','#submit',function(){
		if($($('input:text[name=boardName]')).val() == "" ){
			swal("�̸��� �Է��ϼ���! ");
			$('#boardName').focus();
			return false;
		} 
		
		if(!($('input:radio[name=isUse]').is(':checked'))){
			swal("��������� �������ּ���");
			$('input:radio[name=isUse]').focus;
			return false;
		}
		
		if($("select[name='fileCount'] option:selected").index() <1) {
			swal("���� ������ �������ּ���");
			$("select[name='fileCount'] : eq(0)").focus();
			return false;
		}
		
		
		if(!($('input:radio[name=isNotice]').is(':checked'))){
			swal("�������� ��������� �������ּ���");
			$('input:radio[name=isNotice]').focus;
			return false;
		}
		
		if(!($('input:radio[name=isComment]').is(':checked'))){
			swal("�ڸ�Ʈ ��������� �������ּ���");
			$('input:radio[name=isComment]').focus;
			return false;
		}
		
		if(!($('input:radio[name=isDeptDivide]').is(':checked'))){
			swal("�μ� ��������� �������ּ���");
			$('input:radio[name=isDeptDivide]').focus;
			return false;
		}
		
		if(!($('input:radio[name=isDocuType]').is(':checked'))){
			swal("�Խ��� ��������� �������ּ���");
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
				swal("����� �Ϸ�Ǿ����ϴ�!","");
				$('#display').css('display','none');
			}
			,
			error : function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
		});
	});	
	
	
	//�Խ��� ��ȣ�� �ش��ϴ� �Խ��� ����ȸ
	$('#boardList').on('click','.selectBoard',function(){ 
	    boardNo = $(this).attr("id");

		$('#display').css('display','block');
			$('#submit').css('display','none');
			$('#modify').css('display','block');
			$('#remove').css('display','block');
		
		$('#plus').on('click','#display1', function(){
			//�߰� Ŭ���� ��� ������ �ʱ�ȭ
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
	
	//�Խ��� ����
	$('#display').on('click','#remove',function() {
		
		swal({
			  title: "�Խ����� �����Ͻðڽ��ϱ�?",
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
									swal("�����Ϸ�!");	
									$('#' + boardNo).parent('tr').remove(); 
									$('#display').css('display','none');
								}else if(data.isSuccess == "false"){
									swal("�Խñ��� �����մϴ�.");
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
	
	//�Խñ� ����
	$('#display').on('click','#modify',function(){
		var params = jQuery('#serializeForm').serialize();
		
		swal({
			  title: "�Խ����� �����Ͻðڽ��ϱ�?",
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
								swal("���� �Ϸ�!","");
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
				<h2>�Խ��� ����</h2>

				<div class="clearfix"></div>
			</div>
			<div class="col-md-4">
				<table id="boardList" class="table table-striped jambo_table bulk_action ">
					<thead>
						<tr class="headings">
							<th class="column-title">�Խ��� ���� ����Ʈ</th>

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
					<button class="btn btn-primary" id="display1">�߰�</button>
				</div>
			</div>
			
			<form name="serializeForm" id="serializeForm">
			<div class="col-md-6" id="display" style="display:none;">
				<div class="x_panel">

					<table id="datatable-keytable table_empty" class="table table-striped col-8">
						<tr>
							<td class="col-md-4 " 
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">��������
								����Ʈ</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="col-md-4" 
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">�Խ���
								�̸�</td>
							<td id="boardName"><input type="text" name="boardName" id="boardName"
								id="autocomplete-custom-append" class="form-control col-md-2" ></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">���
								����</td>
							<td><div class="radio">
									<label> <input type="radio" name="isUse" value="Y"> �����</label>
									<label> <input type="radio" name="isUse" value="N">������</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">�Խ��� ���� ����Ʈ</td>
							<td>�Խ��� ����</td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">���ε�
								���� ��� ����</td>
							<td><select class="select2_group form-control" id = "fileCount" name="fileCount">

									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
							</select></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">��������
								��� ����</td>
							<td><div class="radio">
									<label> <input type="radio" name="isNotice" value="Y" > �����</label>
									<label> <input type="radio" name="isNotice" value="N">������</label>
									
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">�ڸ�Ʈ
								��� ����</td>
							<td><div class="radio">
									<label> <input type="radio" name="isComment" value="Y"> �����</label>
									<label> <input type="radio" name="isComment" value="N">������</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">�μ�
								���� ��� ����</td>
							<td><div class="radio">
									<label> <input type="radio" name="isDeptDivide" value="Y"> �����</label>
									<label> <input type="radio" name="isDeptDivide" value="N">������</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">�Խ���
								ī�װ� ��� ����</td>
							<td><div class="radio">
									<label> <input type="radio" name="isDocuType" value="Y"> �����</label>
									<label> <input type="radio" name="isDocuType" value="N">������</label>
								</div></td>

						</tr>
					</table>
					<div class="text-right">
						<button class="btn btn-primary" type="button" id="modify">����</button>
						<button class="btn btn-primary" type="button" id="remove">����</button>
						<button class="btn btn-primary" type="button" id="submit">���</button>
						<button class="btn btn-primary" type="button" id="reset">�ݱ�</button>
					</div>
					
				</div>
			</div>
			</form>
		</div>
	</div>
	
</body>
</html>