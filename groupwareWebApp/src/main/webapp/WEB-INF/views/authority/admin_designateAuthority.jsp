<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	height: 400px;
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
	var count = 0;
	var selectedEmpNo = ""; 
	var selectedNameAndDuty = "";
	var selectedDepartment = "";
	var selectedDeptNo = "";
	var receiverLineApprCount = 0;
	var lazyloadList = [];

	var pKeyfield = '';
	var pKeyword;
	var empNos = '${empNos}'
	
	//////////////////////////////////// 페이징 처리 ///////////////////////////////////////////////////////////

	function Paging(currentPageNo) {

		var totalCount = 0; //총 양식서 수
		var countPerPage = 10; //한 페이지당 보여주는 양식서 수
		var pageSize = 5; //페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var num = 0; //현재 페이지번호에 속한 게시글의 시작번호
		var aNo = '${param.aNo}';

		$
				.ajax({
					url : '${pageContext.request.contextPath}/AuthEmpListAjax.do',
					data : {
						keyfield : pKeyfield,
						keyword : pKeyword,
						startRow : startRow,
						endRow : endRow,
						aNo : aNo

					},
					type : 'POST',
					cache : false,
					dataType : 'json',
					success : function(data, textStatus, jqXHR) {

						totalCount = data.totalCount;
						num = totalCount - (currentPageNo - 1) * countPerPage;

						//datatable테이블 변경하기
						var text = "";
						for (var i = 0; i < data.authEmps.length; i++) {

							text += "<tr class='even pointer'>";
							text += "<td class='empNo text-center'>"+ data.authEmps[i].empNo + "</td>";
							text += "<td class='empName text-center'>"+ data.authEmps[i].empName + "</td>";
							text += "<td class='department text-center'>"+ data.authEmps[i].department + "</td>";
							text += "<td class='duty text-center'>"+ data.authEmps[i].duty + "</td>";
							text += "<td class='aNo text-center'><label class='radio-inline'> <input type='radio' name='aNo["+ i +"]' id='inlineRadio1' value='0' checked> 등록 </label> <label class='radio-inline'> <input type='radio' name='aNo["+ i +"]' id='inlineRadio2' value='1'>미등록</label></td>";
							text += "</tr>";
						}

						$('#datatable').find('tbody').html(text);

						//페이징 처리
						jqueryPager({
							countPerPage : countPerPage,
							pageSize : pageSize,
							currentPageNo : currentPageNo,
							totalCount : totalCount
						});

					},
					error : function(jqXHR) {
						alert("에러: " + jqXHR.status);
					}

				});

	} //end Paging function

	//페이징 처리
	function jqueryPager(subOption) {

		var pageBlock = subOption.countPerPage;
		var pageSize = subOption.pageSize;
		var currentPage = subOption.currentPageNo;
		var pageTotal = subOption.totalCount;
		var pageTotalCnt = Math.ceil(pageTotal / pageBlock);
		var pageBlockCnt = Math.ceil(currentPage / pageSize);
		var sPage = (pageBlockCnt - 1) * pageSize + 1;
		var ePage;

		var html = "<ul class='pagination'>";

		if ((pageBlockCnt * pageSize) >= pageTotalCnt) {
			ePage = pageTotalCnt;
		} else {
			ePage = pageBlockCnt * pageSize;
		}

		if (sPage <= 1) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Previous">'
		} else {
			html += '<li class="page-item ">';
			html += '<a class="page-link" aria-label="Previous" onclick = "Paging('
					+ (sPage - pageSize) + ')">';
		}
		html += '<span aria-hidden="true">&laquo;</span> </a> </li>';

		for (var i = sPage; i <= ePage; i++) {
			if (currentPage == i) {
				html += '<li class="page-item active"><a class="page-link" ">'
						+ i + '</a></li>';
			} else {
				html += '<li class="page-item"><a class="page-link" onclick="Paging('
						+ i + ');">' + i + '</a></li>';
			}
		}

		if (ePage >= pageTotalCnt) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Next">';
		} else {
			html += '<li class="page-item">';
			html += '<a class="page-link" aria-label="Next" onclick = "Paging('
					+ (ePage + 1) + ')">';
		}
		html += '<span aria-hidden="true">&raquo;</span> </a></li>';
		html += '</ul>';

		$('#Paging').html(html);

	}

$(document).ready(function() {
	var  selected = [];
	var  unselected = []; 
	
	
	Paging(1);

	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$('#datatable').on('click', 'input[type=radio]', function() {
	   
		if($(this).val() == '0') {
			selected.push($(this).parents('tr').find('td:eq(0)').text());		
		} else {
			unselected.push($(this).parents('tr').find('td:eq(0)').text());				
		}		
	});
	
	
	
	
	//검색조건
	$('.search-panel .dropdown-menu').on('click','a',function(e) {
		e.preventDefault();
		$('.keyfield').text($(this).text());
		$('.keyfield').attr('id',
		$(this).attr('id'));
	});
	
	//검색조건 엔터키 눌렀을때 트리거 발동
	
	$('.keyword').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('.find').trigger('click');		
		}	
	});
	// 검색 실행
	$('.find').on('click', function() {
		if ($('.keyfield').attr('id') == null) {
			swal("검색조건를 선택해주세요", "", "error");
			return;
		}
		pKeyfield = $('.keyfield').attr('id');
		pKeyword = $('.keyword').val();

		Paging(1);
	});

	//	검색조건
	$('.search-panel .dropdown-menu').on('click','a',function(e) {
		e.preventDefault();
		$('.keyfield').text($(this).text());
		$('.keyfield').attr('id',
		$(this).attr('id'));
	});

	//검색조건 엔터키 눌렀을때 트리거 발동
	
	$('.keyword').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('.find').trigger('click');	
		}	
	});

	// 검색 실행
						
	$('.find').on('click', function() {
		if ($('.keyfield').attr('id') == null) {
			swal("검색조건를 선택해주세요", "", "error");
			return;	
		}
		pKeyfield = $('.keyfield').attr('id');
			pKeyword = $('.keyword').val();
			Paging(1);
		});
	
	
	//등록
	$('.x_content').on('click','#selectBtn',function(){
		
		 $.ajax({
             url: '${pageContext.request.contextPath}/registerAuthEmpAjax.do'
             ,
             method: 'POST'
             ,           
             data: {
             		isRegistration : selected.join(),
             		isNotRegistration : unselected.join(),             		
             		aNo : '${param.aNo}'
             }
             , 
             success: function(data) {
             	swal("등록 완료","등록되었습니다", "success");
         		Paging(1); 
         		
         		selected.splice(0,selected.length);
         		unselected.splice(0,unselected.length);
             }
             , 
             error: function(jqXHR) {
                alert('Error : ' + jqXHR.status);
             }             
             
          });    
	});
	
	

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
				
				var text = "";
				var temp = selectedNameAndDuty.split(' ');
				
				var a= true;
				
				if(empNos.indexOf(selectedEmpNo) != -1) {
					swal('이미 존재하는 사원입니다.');
					a = false;
					return ;	
				}
				
				if(a){
					text += "<tr class='even pointer'>";
					text += "<td class='empNo text-center'>"	+selectedEmpNo + "</td>";
					text += "<td class='empName text-center'>"+ temp[0] + "</td>";
					text += "<td class='department text-center'>"+ selectedDepartment + "</td>";
					text += "<td class='duty text-center'>"+ temp[1] + "</td>";
					text += "<td class='aNo text-center'><label class='radio-inline'> <input type='radio' name='"+ count +"' id='inlineRadio1' value='0' > 등록 </label> <label class='radio-inline'> <input type='radio' name='"+ count +"' id='inlineRadio2' value='1' checked>미등록</label></td>";
					text += "</tr>";
					$('tbody').append(text);
					
					count++;
					
				}
				
			
				
				
				
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
<title>content</title>
</head>
<body>
	<!-- 권한 리스트 -등록,미등록 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>권한 등록리스트</h2>

				<div class="clearfix"></div>
			</div>
			권한번호 : ${param.aNo} 권한명 : ${param.aName}
			<div class="container">
				<div class="row">

					<div class="col-xs-7 col-xs-offset-5">
						<button type="submit" id="searchEmp"
							class="btn btn-default pull-left">추가</button>

						<div class="input-group">

							<div class="input-group-btn search-panel">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									<span class="keyfield">검색조건</span> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a id='empNo'>사번</a></li>
									<li><a id='empName'>이름</a></li>
								</ul>
							</div>
							<input type="text" class="form-control keyword"
								placeholder="검색어를 입력하세요"> <span class="input-group-btn">
								<button class="btn btn-default find" type="button">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>


			<%-- <form action="<%=request.getContextPath()%>/admin/modifyDesignate.do" method="post"> --%>
			<div class="x_content">
				<div class="col-md-4">
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
				<div class="col-md-8">
				<div class="table-responsive">
					<table id="datatable" class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th class="column-title text-center">사번</th>
								<th class="column-title text-center">이름</th>
								<th class="column-title text-center">부서</th>
								<th class="column-title text-center">직책</th>
								<th class="column-title text-center">등록여부</th>
							</tr>
						</thead>

						<tbody>

						</tbody>
					</table>
				</div>

				<div class="text-center">
					<nav aria-label="Page navigation" id='Paging'></nav>
				</div>
				<a class="btn btn-default pull-right"
					href='<c:url value="/admin/authorityList.do"/>'>뒤로가기</a>
				<button type="submit" id="selectBtn"
					class="btn btn-primary pull-right" value="${param.aNo}">일괄
					등록</button>
					</div>
			</div>

		</div>
	</div>
</body>
</html>