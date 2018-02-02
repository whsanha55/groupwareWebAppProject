<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/fancytree/skin-win8/ui.fancytree.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/fancytree/jquery.fancytree.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/tablednd/jquery.tablednd.js"></script>
<style>
.btns {
	
}

#apprTypeDiv {
	margin-top: 10%;
	text-align: center;
}

ul.fancytree-container {
	height: 500px;
	overflow: auto;
}

input[name=receiverName] {
	width: 150% !important;
}

table[id^=tableDnD] span{
	display : inline-block;
}
.dragRow {
	background-color : #f1f0d8;
}

table[id^=tableDnD] td:first-child {
 width: 80px; 
 padding:0px;
}
</style>
<script>
	$(document).ready(function() {
		
		
		$( "#draggable" ).draggable();
	    $( "#droppable" ).droppable({
	      drop: function( event, ui ) {
	        $( this )
	          .addClass( "ui-state-highlight" )
	          .find( "p" )
	            .html( "Dropped!" );
	      }
	    });
		
		
		
		
		
		
		myReceiverList();
		
		var selectedEmpNo = ""; 
		
		// 조직도 검색 
		$("#tree").fancytree({
			source : {
				url : '${pageContext.request.contextPath}/receiverDeptListAjax.do' ,
				cache : false ,
				type : 'GET'
			},
			lazyload : function(event,data) {
				var node = data.node;
				data.result = {
					url : '${pageContext.request.contextPath}/receiverEmpListAjax.do' ,
					cache : false ,
					type : 'GET' ,
					data : {
						cNo : node.key
					}
				}
			} ,
			click : function(event, data) {
				if(data.node.key.length ==10)
				selectedEmpNo = data.node.key;
			}
			 
		}); //조직도 검색 End
		
		
		//결재선 선택 이벤트
		$('#selectReceiver').on('click',function() {
			var receiverNo = $('select[name=receiverNo]').val();
			if(receiverNo == 0) {
				swal("결재선을 선택해 주세요","");
				return; 
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
					
					for(var i=0;i<data.length;i++) {
						if(data[i].apprType ==0) {
							var text = "";
							text += '<td>';
							text += '<select class="form-control" name="apprType" style="border:0px;">';
							text += '<option value="0" selected>결재</option>';
							text += '<option value="1">참조</option>';
							text += '</select>';
							text += '</td>';
							text += '<td>'+ data[i].lineEmployee.department + '</td>';
							text += '<td>' + data[i].lineEmployee.empName + ' ' + data[i].lineEmployee.duty +'</td>';
							text += '<td>삭제</td>';
							
							var temp = $('#tableDnDAppr').find('tr')[i];
							$(temp).attr('class','');
							$(temp).attr('id',data[i].lineEmployee.empNo);
							$(temp).html(text);
							
						} else {
							var text = "";
							text += '<tr id=' + data[i].lineEmployee.empNo + '>';
							text += '<td>';
							text += '<select class="form-control" name="apprType" style="border:0px;">';
							text += '<option value="0" >결재</option>';
							text += '<option value="1" selected>참조</option>';
							text += '</select>';
							text += '</td>';
							text += '<td>'+ data[i].lineEmployee.department + '</td>';
							text += '<td>' + data[i].lineEmployee.empName + ' ' + data[i].lineEmployee.duty +'</td>';
							text += '<td>삭제</td>';
							text += '</tr>';
							
							$($('#tableDnDRef')).html(text);
						}
					}
					
					doTableDnD();
					
				} ,
				error : function(jqXHR) {
					alert(jqXHR.status);
					console.log(jqXHR);
				}
			});
		}); //결재선 선택 이벤트 End
		
		//결재선 삭제 이벤트
		$('#deleteReceiver').on('click',function() {
			var receiverNo = $('select[name=receiverNo]').val();
			if(receiverNo == 0) {
				swal("삭제할 결재선이 존재하지 않습니다","");
				return; 
			}
			
			swal({
				  title: "결재선 삭제",
				  text: "정말 삭제하시겠습니까?",
				  icon: "error",
				  buttons : true 
				}).then((e) => {
					if(e) {
						
						 $.ajax({
							url : '${pageContext.request.contextPath}/deleteReceiverAjax.do' ,
							cache : false ,
							dataType : 'json' ,
							type : 'GET' ,
							data : {
								receiverNo : receiverNo
							} ,
							success : function(data) {
								swal("결재선 삭제","해당 결재선이 삭제되었습니다.","error");
								myReceiverList();								
							} ,
							error : function(jqXHR) {
								alert(jqXHR.status);
								console.log(jqXHR);
							}
						}); 
					}	
				});
		
			
		});
		
	function doTableDnD() {
		$('#tableDnDAppr, #tableDnDRef').tableDnD({
				onDragClass: "dragRow",
				onDrop : function(table,row) {
					  alert($.tableDnD.serialize());
				}
				
		});
	}
	
		
	}); //document ready End
	
	//결재선 이름 조회 함수
	function myReceiverList() {

		$.ajax({
			url : '${pageContext.request.contextPath}/myReceiverList.do',
			cache : false,
			dataType : 'json',
			type : 'GET',
			success : function(data) {
				var text = "<option value='0'>내 결재선 전체보기</option>";
				for (var i = 0; i < data.length; i++) {
					text += "<option value='"+ data[i].receiverNo + "'>";
					text += data[i].receiverName + "</option>";
				}
				$('select[name=receiverNo]').html(text);
			},
			error : function(jqXHR) {
				alert(jqXHR.status);
				console.log(jqXHR);
			}
		});
	}
	
	
</script>
</head>

<body>

	<div class="container-fluid">
		<div class="row content">

			<div class="col-sm-3 sidenav">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search Blog..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<button class="btn btn-default" type="button">전체</button>
					</span>
				</div>

				<div id="tree"></div>

			</div>

			<div class="col-sm-2 " id='apprTypeDiv'>
				<div class="btns">
					<h2>
						<input type="radio" value="0" name="apprType" checked="checked">결재
					</h2>
					<h2>
						<input type="radio" value="1" name="apprType">참조
					</h2>
					<br>
					<div>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target=".bs-example-modal-lg">&lt;</button>

					</div>
					<div>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target=".bs-example-modal-lg">&gt;</button>
					</div>
				</div>

			</div>

			<div class="col-sm-7">
				<span class="col-md-8"> <select class="form-control"
					name="receiverNo">

				</select>
				</span>
				<button class="btn btn-primary" id='selectReceiver' type="button">선택</button>
				<button class="btn btn-success" id='selectReceiver' type="button">이름변경</button>
				<button class="btn btn-danger" id='deleteReceiver' type="button">삭제</button>

				<div class="table border border-secondary">
					<table class="table table-bordered" id='tableDnDAppr'>
						<c:forEach begin="1" end="9">
							<tr class="nodrag nodrop">
								<td>
									<select class="form-control" name="apprType" style="border:0px;">
										<option value='0'>결재</option>
										<option value='1'>참조</option>
									</select>
								</td>
								<td></td>
								<td></td>
								<td>삭제</td>
							</tr>
						</c:forEach>
					</table>

					<table class="table table-bordered" id='tableDnDRef'>
						<tr class="nodrag nodrop">
							<td>
								<select class="form-control" name="apprType" style="border:0px;">
									<option value='0'>결재</option>
									<option value='1' selected>참조</option>
								</select>
							</td>
							<td></td>
							<td></td>
							<td>삭제</td>
						</tr>
					</table>
				</div>

				<div class="form-inline">
					<div class="form-group col-md-6">
						<input type="text" class="form-control" name="receiverName"
							placeholder="결재선 이름을 입력해주세요">
					</div>
					<button type="button" class="btn btn-primary pull-right">신규등록</button>
				</div>

			</div>

		</div>
	</div>

	
</body>
</html>