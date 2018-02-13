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
	src="${pageContext.request.contextPath}/resources/fancytree/jquery.fancytree-all.min.js"></script> 
<script
	src="${pageContext.request.contextPath}/resources/tablednd/jquery.tablednd.js"></script>
<style>

#apprTypeDiv {
	margin-top: 20%;
	text-align: center;
}

ul.fancytree-container {
	height: 500px;
	overflow: auto;
}

input[name=receiverName] {
	width: 150% !important;
}
#submitReceiver {
	margin-left : 90px;
}

table[id^=tableDnD] span{
	display : inline-block;
}
#tableDnDAppr tr.dragRow {
	background-color : #f1f0d8;
}

table[id^=tableDnD] td:first-child {
	 width: 80px; 
	 padding:0px;
}

#tableDnDAppr tr.nodrag {
	visibility : hidden;
}


.ui-autocomplete {
	z-index: 1051;
	max-height: 100px;
	overflow-y: auto;
	overflow-x: hidden;
}
p {
	margin : 0px;
}
select[name=apprType] {
	border :0px;
}
.btn-link {
	padding : 0px;
	margin : 0px;
}
.col-sm-7 {
	height: 600px;
	overflow-y : auto;
}
.col-sm-7 h3 {
	margin-left : 20px;	
}


</style>
<script>
	$(document).ready(function() {
		myReceiverList(true);
		
		var selectedEmpNo = ""; 
		var selectedNameAndDuty = "";
		var selectedDepartment = "";
		var selectedDeptNo = "";
		var receiverLineApprCount = 0;
		var lazyloadList = [];
		
		
		// fancytree 조직도 검색 
		$("#tree").fancytree({
			extensions: ["filter"],
		    //icon : true ,
			icon: function(event, data){
		         if( data.node.isFolder() ) {
		           return "glyphicon glyphicon-book";
		         } else {
		        	 return "glyphicon glyphicon-user";
		         }
			},
			source : {
				url : '${pageContext.request.contextPath}/retrieveEmployeeDeptList.do' ,
				cache : false ,
				type : 'GET'
			},
			lazyload : function(event,data) {
				var node = data.node;
				lazyloadList.push(node.key);
				data.result = {
					url : '${pageContext.request.contextPath}/retrieveEmployeeEmpList.do' ,
					cache : false ,
					type : 'GET' ,
					data : {
						dutyNo : node.key
					}
				}
			} ,
			click : function(event, data) {
				if(data.node.key.length ==10) {
					selectedEmpNo = data.node.key;
					selectedNameAndDuty = data.node.title;
					selectedDepartment = data.node.parent.title;
					selectedDeptNo = data.node.parent.key;
					//alert(selectedEmpNo + " " + selectedNameAndDuty + " " + selectedDepartment + " "  + selectedDeptNo );
				} else {
					selectedEmpNo = "";
					selectedNameAndDuty = "";
					selectedDepartment = "";
					selectedDeptNo = "";
				}
			}
		}); 
		
		
		//fancytree 검색기능(filter) 깜빡임 문제가 있음
		var tree = $("#tree").fancytree("getTree");
		var isTreeFilter = true;
		$("input[name=search]").on('click',function() {
			if(isTreeFilter) {			
				tree.reload({
		    	    url : '${pageContext.request.contextPath}/retrieveEmployeeAllList.do' ,
					cache : false ,
					type : 'GET' ,
					data : {
						lazyloadList : lazyloadList.join(',')
					} 
			    });
				
				$.ajax({
					 url : '${pageContext.request.contextPath}/retrieveEmployeeNameAndDutyList.do' ,
					 cache : false ,
					 type : 'GET' ,
					 datatype : 'json' ,
					 success : function(data) {
						 $("input[name=search]").autocomplete({
								source : data ,
								focus : function() {
									return false;
								}
						 });
					 } ,
					 error : function(jqXHR) {
							alert(jqXHR.status);
							console.log(jqXHR);
					 }
					 
				});	
			}
			isTreeFilter = false;
		});
		
		//엔터키 입력시 검색 트리거
		$("input[name=search]").on('keydown',function(e) {
			if(e.keyCode == 13 && $('#ui-id-1').css('display') == 'none'){
				$('#btnSearch').trigger('click');
	        }
		});
		
		//fancytree 검색기능
		$("#btnSearch").on('click',function() {
			var n;
			var args = "autoApply autoExpand fuzzy hideExpanders highlight leavesOnly nodata".split(" ");
			var opts = {};
			var filterFunc = tree.filterNodes;
			var match = $("input[name=search]").val();
			$.each(args, function(i, o) {
		        opts[o] = $("#" + o).is(":checked");
		      });
			opts.mode = "dimm";
			opts.autoExpand = true;
			opts.leavesOnly = true;
			if($.trim(match) == "") {
				swal("검색어를 입력하세요","");
				return;
			}
			n = filterFunc.call(tree, match, opts);
		    $("div#matches").text("(" + n + " 개의 검색결과)");
		});
		 
		 
		//검색 결과 초기화
		$("button#btnResetSearch").click(function(e){
		      $("input[name=search]").val("");
		      $("div#matches").text("");
		      tree.clearFilter();
		});
		
		
		//fancytree 모두 펼치기
		$('button#btnOpenAll').on('click',function() {
			$("#tree").fancytree("getTree").visit(function(node){
		        node.setExpanded();
		    });
		});
		
		//fancytree 모두 닫기
		$('button#btnCloseAll').on('click',function() {
			$("#tree").fancytree("getTree").visit(function(node){
		        node.setExpanded(false);
		    });
		});		//여기까지 모든 fancytree 관련 함수
		
		
		
		//조직도에서 결재라인 등록 이벤트
		$('#inputReceiverLine').on('click',function() {
			if(selectedEmpNo == '') {
				swal('부적절한  요청입니다');
				return;
			}
			var isExist = false;	//이미 존재하는 결재라인 확인여부
			$('table[id^=tableDnD] tr').each(function() {
				if($(this).attr('id') == selectedEmpNo) {
					swal('이미 존재하는 사원입니다 ');
					isExist = true;
					return;
				}
			});
			if(isExist) {
				return;
			}
			
			
			if($('input[name=apprTypeRadio]:checked').val() == 0) {	//결재
				if(receiverLineApprCount >=9) {
					swal("결재자가 너무 많습니다");
					return;
				}
				
				var text = "";
				
				text += '<td>';
				text += '<select class="form-control" name="apprType">';
				text += '<option value="0" selected>결재</option>';
				text += '<option value="1">참조</option>';
				text += '</select>';
				text += '</td>';
				text += '<td>'+ selectedDepartment + '</td>';
				text += '<td>' + selectedNameAndDuty  +'</td>';
				text += '<td><button class="btn btn-link btn-sm" >삭제</button></td>';
				var temp = $('#tableDnDAppr').find('tr')[receiverLineApprCount];
				$(temp).attr('class','');
				$(temp).attr('id',selectedEmpNo);
				$(temp).html(text);
				receiverLineApprCount++;
				doTableDnD();
			
			} else {	//참조
				var text = "<tr id='" + selectedEmpNo + "'>";
				text += '<td>';
				text += '<select class="form-control" name="apprType">';
				text += '<option value="0">결재</option>';
				text += '<option value="1" selected>참조</option>';
				text += '</select>';
				text += '</td>';
				text += '<td>'+ selectedDepartment + '</td>';
				text += '<td>' + selectedNameAndDuty  +'</td>';
				text += '<td><button class="btn btn-link btn-sm">삭제</button></td>';
				text += "</tr>";
				
				$('#tableDnDRef:last-child').append(text);
			}
			
		}); //조직도에서 결재라인 등록 이벤트 End
		
		
		//조직도에서 결재라인 삭제 이벤트
		$('#outputReceiverLine').on('click',function() {
			$('table[id^=tableDnD] tr').each(function() {
				if($(this).attr('id') == selectedEmpNo) {
					if($(this).closest('table').attr('id') == 'tableDnDAppr') {	//테이블중 결재부분에서 삭제 시도
						var text = "<tr>";
						text += '<td></td>';
						text += '<td></td>';
						text += '<td></td>';
						text += '<td></td>';
						text += '</tr>';
						$('#tableDnDAppr').append(text);
						$(this).remove();	
						receiverLineApprCount--;
					} else {	//참조에서 삭제 시도
						$(this).remove();
					}
					return;
				}
			});
		});	//조직도에서 결재라인 삭제 이벤트 End
		
		
		
		
	
		//결재선 선택 이벤트
		$('#selectReceiver').on('change',function() {
			$('#tableDnDRef').empty();
			var receiverNo = $('select[name=receiverNo2]').val();
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
							text += '<select class="form-control" name="apprType">';
							text += '<option value="0" selected>결재</option>';
							text += '<option value="1">참조</option>';
							text += '</select>';
							text += '</td>';
							text += '<td>'+ data[i].lineEmployee.department + '</td>';
							text += '<td>' + data[i].lineEmployee.empName + ' ' + data[i].lineEmployee.duty +'</td>';
							text += '<td><button class="btn btn-link btn-sm">삭제</button></td>';
							
							var temp = $('#tableDnDAppr').find('tr')[i];
							$(temp).attr('class','');
							$(temp).attr('id',data[i].lineEmployee.empNo);
							$(temp).html(text);
							receiverLineApprCount = i;
						} else {
							var text = "";
							text += '<tr id=' + data[i].lineEmployee.empNo + '>';
							text += '<td>';
							text += '<select class="form-control" name="apprType">';
							text += '<option value="0" >결재</option>';
							text += '<option value="1" selected>참조</option>';
							text += '</select>';
							text += '</td>';
							text += '<td>'+ data[i].lineEmployee.department + '</td>';
							text += '<td>' + data[i].lineEmployee.empName + ' ' + data[i].lineEmployee.duty +'</td>';
							text += '<td><button class="btn btn-link btn-sm">삭제</button></td>';
							text += '</tr>';
							
							$('#tableDnDRef:last-child').append(text);
							//$($('#tableDnDRef')).html(text);
						}
					}
					
					 for(var i=receiverLineApprCount+1;i<=9;i++){
						var text = "";
						text += '<td></td>';
						text += '<td></td>';
						text += '<td></td>';
						text += '<td></td>';
						
						var temp = $('#tableDnDAppr').find('tr')[i];
						$(temp).html(text);
						$(temp).attr('class','nodrag');
					}  
					receiverLineApprCount++;
					
					doTableDnD();
					
				} ,
				error : function(jqXHR) {
					alert(jqXHR.status);
					console.log(jqXHR);
				}
			});
		}); //결재선 선택 이벤트 End
		
		
		//결재선 이름 변경 이벤트
		$('#modifyReceiver').on('click',function() {
			var receiverNo = $('select[name=receiverNo2]').val();
			var receiverName = $('select[name=receiverNo2] option:selected').text();
			
			swal({
				 text: '새로운 결재선 이름을 입력해 주세요',
				 content: {
					    element: "input",
					    attributes: {
					    	placeholder : receiverName
					    }
				 },
				 buttons: true
			}).then(newReceiverName =>  {
				//receiverName : 기존이름 ,newReceiverName : 변경할 새 이름
				if(newReceiverName == '') {
					swal("변경할 이름을 입력해주세요");
				} else if(newReceiverName) {
					if(receiverName == newReceiverName) {
					swal("변경하고자 하는 이름이 기존과 일치합니다");
					} else {
						$.ajax({
							url : '${pageContext.request.contextPath}/modifyReceiverAjax.do' ,
							cache : false ,
							dataType : 'json' ,
							type : 'GET' ,
							data : {
								receiverNo : receiverNo ,
								receiverName : newReceiverName
							} ,
							success : function(data) {
								swal("결재선 이름 변경","성공적으로 이름이 변경되었습니다.","success");
								myReceiverList(true);								
							} ,
							error : function(jqXHR) {
								alert(jqXHR.status);
								console.log(jqXHR);
							}
						}); 
					}
				}
			});
		
		});
		
		
		//결재선 삭제 이벤트
		$('#deleteReceiver').on('click',function() {
			var receiverNo = $('select[name=receiverNo2]').val();
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
								myReceiverList(true);								
							} ,
							error : function(jqXHR) {
								alert(jqXHR.status);
								console.log(jqXHR);
							}
						}); 
						 
					}	
				});
		
			
		});
		
		//tableDnD 함수 (테이블 변동 있을 때 마다 호출해야함)		
		function doTableDnD() {
			$('#tableDnDAppr').tableDnD({
					onDragClass: "dragRow"
					
			});
		}
		
	
		
		//결재라인 셀렉트박스(결재,참조) 변경 이벤트
		$("table[id^=tableDnD]").on("change","select[name=apprType]",function() {
			if($(this).val() ==0) { //참조->결재로 변경
				
				if(receiverLineApprCount >=9) {
					swal("결재자가 너무 많습니다");
					return;
				}
				
				var temp = $(this).closest('tr');
				$($('#tableDnDAppr').find('tr')[receiverLineApprCount]).html(temp.html())
				.attr('class','')
				.find('select').val('0').prop('selected',true).not('tr:first');
				temp.remove();
				receiverLineApprCount++;
				doTableDnD();
				
				
			} else { //결재 -> 참조로 변경
				var temp = $(this).closest('tr');
				
				
				$('#tableDnDRef:last-child').append(temp)
				.find('select').val('1').prop('selected',true).not('tr:first');
				$('#tableDnDRef').find('tr').css('cursor','auto');				
				receiverLineApprCount--;
				
				var text = "<tr class='nodrag nodrop'>";
				text += '<td></td>';
				text += '<td></td>';
				text += '<td></td>';
				text += '<td></td>';
				text += '</tr>';
				$('#tableDnDAppr').append(text); 
			}
		});
 
		
		
		//새로운 결재선과 결재선 라인 등록 이벤트
		$('#submitReceiver').on('click',function() {
			var receiverName = $('input[name=receiverName]').val();
			if(receiverName == null || receiverName == '') {
				swal('등록하실 결재선 이름을 입력해주세요');
				return;
			}
			
			var isReceiverNameExist = false;
			$('select[name=receiverNo2] option').each(function() {
				if(receiverName == $(this).text()) {
					swal('이미 존재하는 결재선 이름입니다.','새로운 결재선 이름을 입력해주세요','error');
					isReceiverNameExist = true;
					return;
				}
			});
			if(isReceiverNameExist) {
				return;
			}
			
			var apprLines = [];
			var refLines = [];
			$('#tableDnDAppr tr').each(function(){
				var apprLine = $(this).attr('id');
				if(apprLine != null) {
					apprLines.push(apprLine);
				}
			});
			
			$('#tableDnDRef tr').each(function() {
				var refLine = $(this).attr('id');
				if(refLine != null) {
					refLines.push(refLine);
				}
			});
			
			if(apprLines == '') {
				swal("결재자는 최소 1명 등록하셔야 합니다");
				return;
			}
			$.ajax({
					url : '${pageContext.request.contextPath}/submitReceiverAjax.do' ,
					cache : false ,
					dataType : 'json' ,
					type : 'POST' ,
					data : {
						receiverName : receiverName ,
						apprLines : apprLines.join(',') ,
						refLines : refLines.join(',')
					} ,
					success : function(data) {
						swal("등록 성공","새로운 결재선이 등록되었습니다","success");
						myReceiverList(true);								
					} ,
					error : function(jqXHR) {
						alert(jqXHR.status);
						console.log(jqXHR);
					}
			}); 
			
		});
		
		
		//결재라인테이블안 삭제 버튼 선택하는 이벤트
		$('table').on('click','button.btn-link',function() {
			if($(this).closest('table').attr('id') == 'tableDnDAppr') {	//결재 테이블 삭제 요청
				$(this).closest('tr').remove();
				receiverLineApprCount--;
				var text = "<tr>";
				text += '<td></td>';
				text += '<td></td>';
				text += '<td></td>';
				text += '<td></td>';
				text += '</tr>';
				$('#tableDnDAppr').append(text);
			} else {	//참조 테이블 삭제 요청
				$(this).closest('tr').remove();
			}
			
		});
		
		
	}); //document ready End
	
	//결재선 이름 조회 함수 
	//modal팝업창 닫을때도 사용하므로 파라미터로 모달페이지면 true, 아니면 receiverNo를 받아옴
	function myReceiverList(isModalPage) {

		$.ajax({
			url : '${pageContext.request.contextPath}/myReceiverList.do',
			cache : false,
			dataType : 'json',
			type : 'GET',
			success : function(data) {
				var text = "";
				if(!(isModalPage===true)) {	//모달창 닫기 클릭시
					text += "<option value='0'>결재선을 선택하세요</option>";
				}
				for (var i = 0; i < data.length; i++) {
					text += "<option value='"+ data[i].receiverNo + "'>";
					text += data[i].receiverName + "</option>";
				}
				if(isModalPage === true) {
					$('select[name=receiverNo2]').html(text);
				} else {	//모달창 닫기 클릭시
					$('select[name=receiverNo]').html(text);
					$('select[name=receiverNo]').val(isModalPage);
					
				}
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
				
				<p>
					<input name="search" placeholder="검색어를 입력하세요...">
					<button id="btnSearch" class="btn btn-primary btn-sm">검색</button>
					<button id="btnResetSearch" class="btn btn-primary btn-sm">초기화</button>
					<div id="matches"></div>
					<div class="btn-group" style="margin-top:10px;">
                        <button id="btnOpenAll" class="btn btn-default">모두 펼치기</button>
                        <button id="btnCloseAll" class="btn btn-default">모두 닫기</button>

     </div>
				</p>

			<div id="tree"></div>
			</div>
 
			<div class="col-sm-2 " id='apprTypeDiv'>
				<div class="btns">
					<h2>
						<input type="radio" value="0" name="apprTypeRadio" checked="checked">결재
					</h2>
				<h2>
						<input type="radio" value="1" name="apprTypeRadio">참조
					</h2>
					<br>
					<div>
						<button id= "inputReceiverLine" type="button" class="btn btn-primary" >&gt;</button>

					</div>
					<div>
						<button id="outputReceiverLine" type="button" class="btn btn-primary">&lt;</button>
					</div>
				</div>

			</div>
			<div class="col-sm-7">
				<span class="col-xs-5"> 
					<select class="form-control" name="receiverNo2" id="selectReceiver" >
				</select>
				</span>
				<!-- <button class="btn btn-primary"  type="button">조회</button> -->
				<button class="btn btn-success" id='modifyReceiver' type="button">이름변경</button>
				<button class="btn btn-danger" id='deleteReceiver' type="button">삭제</button>

				<div class="border border-secondary">
					<h3>결재</h3>
					<table class="table table-bordered" id='tableDnDAppr'>
						<c:forEach begin="1" end="9">
							<tr class="nodrag nodrop">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</table>

					<h3>참조</h3>
					<table class="table table-bordered" id='tableDnDRef'>
						
					</table>
				</div>

				<div class="form-inline">
					<div class="form-group col-xs-5">
						<input type="text" class="form-control" name="receiverName"
							placeholder="결재선 이름을 입력해주세요">
					</div>
					<button type="button" class="btn btn-primary" id="submitReceiver">신규등록</button>
				</div>

			</div>

		</div>
	</div>

	
</body>
</html>