<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<style>
ul.fancytree-container {
	height: 350px;
	overflow: auto;

}

input[name=receiverName] {
	width: 150% !important;
}

.ui-autocomplete {
	z-index: 1051;
	max-height: 100px;
	overflow-y: auto;
	overflow-x: hidden;
}

p {
	margin: 0px;
}
</style>
<script>
	
	var selectedEmpNo = ""; 
	var selectedNameAndDuty = "";
	var selectedDepartment = "";
	var selectedDeptNo = "";
	var receiverLineApprCount = 0;
	var lazyloadList = [];

	$(document).ready(function() {
		
		
		
		
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
					//여기가 제일중요!!!!!!!!!!!!!!
					
					selectedEmpNo = data.node.key;
					selectedNameAndDuty = data.node.title;
					selectedDepartment = data.node.parent.title;
					selectedDeptNo = data.node.parent.key;

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
		
	});
	
</script>
</head>
<body>

	<p>
		<input name="search" placeholder="검색어를 입력하세요..." style="height:32px;">
		<button id="btnSearch" class="btn btn-primary btn-sm">검색</button>
		<button id="btnResetSearch" class="btn btn-primary btn-sm">초기화</button>
	<div id="matches"></div>
	<div class="btn-group" style="margin-top:10px;">
                        <button id="btnOpenAll" class="btn btn-default">모두 펼치기</button>
                        <button id="btnCloseAll" class="btn btn-default">모두 닫기</button>

     </div>
	</p>
	
	<div id="tree"></div>
</body>
</html>