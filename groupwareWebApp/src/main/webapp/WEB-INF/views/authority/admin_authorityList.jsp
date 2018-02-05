<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	var pKeyfield='notice';
	var pKeyword;
	$(document).ready(function() {
		
		Paging(1); 
		
		//	검색조건
		$('.search-panel .dropdown-menu').on('click','a',function(e) {
				e.preventDefault();
				$('.keyfield').text($(this).text());
				$('.keyfield').attr('id',$(this).attr('id'));
				
		});
		
		
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('.keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('.find').trigger('click');
	        }
		});
		
		
		// 검색 실행
		$('.find').on('click', function() {
			if($('.keyfield').attr('id') == null) {
				swal("검색조건를 선택해주세요","", "error");
				return;
			}

			pKeyfield = $('.keyfield').attr('id');
			pKeyword = $('.keyword').val();
			
			Paging(1);
			
		});
		

	
	function Paging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 7;   //한 페이지당 보여주는 양식서 수
		var pageSize = 7;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var num = 0;	//현재 페이지번호에 속한 게시글의 시작번호
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/AuthorityPagingAjax.do' 
			,
			data: {
				keyfield: pKeyfield ,
				keyword: pKeyword ,	
				startRow : startRow ,
				endRow : endRow
			},
			type: 'POST' ,
			cache: false ,
			dataType: 'json' ,
			success: function (data, textStatus, jqXHR) {
				
				totalCount = data.totalCount;
				num = totalCount - (currentPageNo - 1) * countPerPage;
				
				//datatable테이블 변경하기
				var text = "";
				for(var i=0;i<data.authorities.length;i++) {
					text += "<tr class='even pointer'>";
					text += "<td class='a-center'><input type='checkbox' id='ex_chk'> </td>";
					text += "<td id="+ data.authorities[i].aNo +" class='aName'><a data-toggle='modal' data-target='#myModal'>"+ data.authorities[i].aNo + "</a></td>";
					text += "<td id="+ data.authorities[i].aName +" class='aName'>"+ data.authorities[i].aName + "</td>";
					text += "<td id="+ data.authorities[i].aNote +"  class='aNote'>"+ data.authorities[i].aNote + "</td>";
					text += "<td id="+ data.authorities[i].aWhether +" class='aWhether'>"+ data.authorities[i].aWhether + "</td>";
					text += "<td class='align-center'><a class='btn btn-default' href='<c:url value='/admin/designRole.do?aName="+data.authorities[i].aName+"'/>'>역할</a><button id='modify' class='btn btn-default'>수정</button></td>";
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
					
				
			} ,
			error: function(jqXHR) {
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
 		var pageTotalCnt = Math.ceil(pageTotal/pageBlock); 	
		var pageBlockCnt = Math.ceil(currentPage/pageSize);
		var sPage = (pageBlockCnt-1) * pageSize + 1;
		var ePage;
		
		
		var html ="<ul class='pagination'>";
	
		
		 if((pageBlockCnt * pageSize) >= pageTotalCnt) {
			ePage = pageTotalCnt;
		} else {
			ePage = pageBlockCnt * pageSize;
		} 
		
		if(sPage <= 1) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Previous">' 
		} else {
			html += '<li class="page-item ">';
			html += '<a class="page-link" aria-label="Previous" onclick = "Paging(' + (sPage - pageSize) + ')">'; 
		}
		html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
		
		for(var i=sPage; i<=ePage; i++) {
			if(currentPage == i) {
				html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
			} else {
				html += '<li class="page-item"><a class="page-link" onclick="Paging(' + i + ');">' + i + '</a></li>';
			}
		}				
	
		if (ePage >= pageTotalCnt) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Next">';
		} else {
			html += '<li class="page-item">';
			html += '<a class="page-link" aria-label="Next" onclick = "Paging(' + (ePage+1) + ')">';
		}
		html += '<span aria-hidden="true">&raquo;</span> </a></li>';
		html += '</ul>';
		
		$('#Paging').html(html);
	
	}
	//권한 조회
	$('#datatable').on('click','#modify',function (){
		$.ajax({
			url : '${pageContext.request.contextPath}/retrieveBoardAjax.do'
			,
			method : 'GET'
			,
			data : {
				aNo: $('.aNo').attr("id")
			}
			,
			dataType: 'json'
			,
			async : true
			,
			cache : true
			,
			success : function(data, textStatus, jqXHR){
				$('.modifyForm tr > td:eq(2)').empty();
				$('.modifyForm tr > td:eq(2)').append("<input type='text' name="+ data.aName +" value="+ data.aName +" />");
				$('.modifyForm tr > td:eq(3)').empty();
				$('.modifyForm tr > td:eq(3)').append("<input type='text' name="+ data.aNote +" value="+ data.aNote +" />");
				$('.modifyForm tr > td:eq(4)').empty();
				$('.modifyForm tr > td:eq(4)').append("<label class='radio-inline'> <input type='radio' name='aWhether' id='inlineRadio1' value='0'> 유 </label> <label class='radio-inline'> <input type='radio' name='aWhether' id='inlineRadio2' value='1'>무</label>");
				
				if(data.aWhether == '0') {
					$('input[name=aWhether][value=0]').prop('checked',true);
				}else{
					$('input[name=aWhether][value=1]').prop('checked',true);
				}
				
			}
			,
			error : function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
		});
	});
	
	
	//수정
	/* $('#datatable').on('click','#modify',function (){
			
		 swal({
			  title: "게시판을 수정하시겠습니까?",
			  icon: "info",
			  buttons : true 
			}).then((e) => {
				if(e) {
					$.ajax({
						url : '${pageContext.request.contextPath}/modifyAuthorityAjax.do'  
							,
							method : 'POST'
							,
							data : {
								aName : $('.aName').attr("id"),
								aNote : $('.aNote').attr("id"),
								aWhether : $('.aWhether').attr("id")
							}
							,
							dataType: 'json'
							,
							async : true 
							,
							cache : true
							,
							success : function(data, textStatus, jqXHR){
								
							
															
							}
							,
							error : function(jqXHR, textStatus, errorThrown){
								alert('error: ' + jqXHR.status);
							}
					
						});
				}
			}); 
		
	}); */
	
});
</script>
</head>
<body>
	<!-- 등록된 관리자 리스트 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>권한 리스트</h2>

				<div class="clearfix"></div>
			</div>
			 <div class="container">
			<div class="row">    
			        <div class="col-xs-5">
					    <div class="input-group">
			                <div class="input-group-btn search-panel">
			                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			                    	<span class="keyfield">검색조건</span> <span class="caret"></span>
			                    </button>
			                    <ul class="dropdown-menu" role="menu">
			                      	<li><a id="empNo">아이디</a></li>
								  	<li><a id="empName">이름</a></li>
								  	<li><a id="aName">권한명</a></li>
			                    </ul>
			                </div>
			                <input type="text" class="form-control keyword" placeholder="검색어를 입력하세요">
			                <span class="input-group-btn">
			                    <button class="btn btn-default find" type="button">
			                    	<span class="glyphicon glyphicon-search"></span>
			                    </button>
			                </span>
			            </div>   
			        </div>
			        <div>
						<button class="btn btn-primary pull-right">삭제</button>
						<a class="btn btn-default pull-right" href='<c:url value="/admin/authority.do"/>'>추가</a>
					</div>
				</div>
					
				</div>
			<form name="serializeForm" id="serializeForm">
			<div class="x_content">
				<div id="datatable" class="table-responsive">
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox" id="ex_chk"> </th>
								<th class="column-title">권한번호</th>
								<th class="column-title">권한명</th>
								<th class="column-title">비고</th>
								<th class="column-title">유무</th>
								<th class="column-title">관리</th>

							</tr>
						</thead>

						<tbody class="modifyForm">
	
						</tbody>
					</table>
					<div>
						<div class="text-center">
							<nav aria-label="Page navigation" id = 'Paging'></nav> 
						</div>
					</div>
				</div>


			</div>
			</form>
		</div>
	</div>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped jambo_table bulk_action  text-center">
						<thead>
							<tr class="headings  text-center text-center">
								<th class="column-title">사번</th>
								<th class="column-title">이름</th>
								<th class="column-title">권한명</th>

							</tr>
						</thead>

						<tbody>
							<tr class="even pointer">
								<td>AAAA1</td>

								<td>홍길동</td>
								<td>전체관리자</td>

							</tr>
							<tr class="even pointer">
								<td>AAAA1</td>

								<td>홍길동</td>
								<td>전체관리자</td>

							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>