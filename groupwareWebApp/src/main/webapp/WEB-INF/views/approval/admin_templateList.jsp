

<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style>
	.btn-group {
		float : right;
		margin-right : 20px;
	}
	.x_content {
		float : none;
	}
	
	.detailTemplate {
		cursor : pointer;
	}
	
	input {height:34px !important;}
</style>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script>

	var pKeyfield;  
	var pKeyword;
	var pKeyword1;
	
	$(document).ready(function(){
		
		templatePaging(1);//최초 로드시 페이지처리
		
		//양식 등록창으로 이동
		$('#add').on('click', function(){
			location.href = "${pageContext.request.contextPath}/admin/addTemplateForm.do";
		});
			

		//양식 상세보기		
		$(document).on('click', '.detailTemplate', function(){
			var tmpNo = $(this).attr('id');
			var url = '${pageContext.request.contextPath}/admin/templateDetail.do?tmpNo='+tmpNo;
			window.open(url, "양식 상세보기","width=900, height=900");
		});

		
		//검색조건 엔터키 눌렀을때 트리거 발동--?
		$('#pKeyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				e.preventDefault();
				$('#searchButton').trigger('click');
	        }
		});
		
		
		//검색
		$('#searchButton').on('click', function(){

			pKeyfield = $('#pKeyfield').val();
			pKeyword = $('#pKeyword').val();
			pKeyword1 = $('#pKeyword1').val();
			
			if(pKeyfield == 'tmpUsing') {
				pKeyword = $(':input:radio[name=using]:checked').val();
			}
			
 			if(pKeyfield != "tmpDate" && pKeyword == "") {
 	 			swal("검색어를 입력해주세요","", "error");
				return;
			}
 			
 			if(pKeyfield == "tmpDate" && (pKeyword == "" || pKeyword1 == "")) {
 	 			swal("등록일을 지정해주세요","", "error");
				return;
 			}

			templatePaging(1);
		});
		
		
		//검색창 타입 바꾸기
		 $('#pKeyfield').on("change",function(){
			if($(this).val()=='tmpDate'){
				$('#wrap').empty();
				$('#wrap').html('<input type=date id=pKeyword>'
								+'&nbsp;<b id=temp>~</b>' + '<input type=date id=pKeyword1>');
			} /* else if($(this).val()=='tmpUsing') {
				$('#wrap').empty();
				 $('#wrap').html('<label class="radio-inline"><input type="radio" name="using" value="1" checked>사용</label>'
								+'<label class="radio-inline"><input type="radio" name="using" value="0">미사용&nbsp;');
			} */ else{
				$('#wrap').empty();
				$('#wrap').html('<input id="pKeyword" type="text" name="pKeyword" placeholder="검색어를 입력하세요">');
			}
		 });
		 
		
	});//end of document.ready
	

	//페이징징징 관련
	function templatePaging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 10;   //한 페이지당 보여주는 양식서 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var num = 0;	//현재 페이지번호에 속한 게시글의 시작번호
		
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/templatePagingAjax.do' 
			,
			data: {
				keyfield: pKeyfield ,
				keyword: pKeyword ,	
				keyword1: pKeyword1 ,
				startRow : startRow ,
				endRow : endRow,
				isAdmin : true
			},
			type: 'POST' ,
			cache: false ,
			dataType: 'json' ,
			success: function (data, textStatus, jqXHR) {
				
				totalCount = data.totalCount;
				num = totalCount - (currentPageNo - 1) * countPerPage;
									
				
				//datatable테이블 변경하기
				var text = "";
				for(var i=0;i<data.templates.length;i++) {

					text += '<tr>';
					text += '<td>' + (num - i) + '</td>';
					text += '<td class="detailTemplate" id="' + data.templates[i].tmpNo + '">' + data.templates[i].tmpName + '</td>';
					text += '<td>' + data.templates[i].templateCategory.categoryName + '</td>';
					
					if(data.templates[i].tmpUsing == 1) {
						text += '<td>사용</td>';	
					} else {
						text += "<td>미사용</td>";
					}
										
					text += '</tr>';
				}
					$('#datatable').html(text);						
			
					//페이징 처리
					jqueryPager({
						countPerPage : countPerPage,
						pageSize : pageSize,
						currentPageNo : currentPageNo,
						totalCount : totalCount
					});
					
				
			} ,//end of success
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}
			
		});//end of ajax		

	} //end templatePaging function
	
	
	
	
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
			html += '<a class="page-link" aria-label="Previous" onclick = "templatePaging(' + (sPage - pageSize) + ')">'; 
		}
		html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
		
		for(var i=sPage; i<=ePage; i++) {
			if(currentPage == i) {
				html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
			} else {
				html += '<li class="page-item"><a class="page-link" onclick="templatePaging(' + i + ');">' + i + '</a></li>';
			}
		}				
	
		if (ePage >= pageTotalCnt) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Next">';
		} else {
			html += '<li class="page-item">';
			html += '<a class="page-link" aria-label="Next" onclick = "templatePaging(' + (ePage+1) + ')">';
		}
		html += '<span aria-hidden="true">&raquo;</span> </a></li>';
		html += '</ul>';
		
		$('#templatePaging').html(html);
	
	}
	
	
</script>
	
</head>
<body>
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>결재관리</h3>
			</div>

			<div class="title_right">
				<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
				</div>
			</div>
		</div>

		<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>양식관리</h2>
							<a class="btn btn-primary pull-right" id="add">등록</a>
							<div class="clearfix"></div>
						</div>
				  <div>
					
				   <div class="btn-group" >
                    <form id="search" style="margin-right: -20px;">
						<select id="pKeyfield" name="pKeyfield" style="height:34px;" >
							<option value="tmpName">양식명</option>
							<option value="categoryName">카테고리명</option>
							<!-- <option value="tmpUsing">사용여부</option> -->
							<option value="tmpDate" id="tmpDate">등록일</option>
						</select>&nbsp;<span id="wrap">
						<input id="pKeyword" type="text" name="pKeyword" placeholder="검색어를 입력하세요"></span>
						<button id="searchButton" type="button" style="height:34px">검색</button>
					</form>
					<div class="col-sm-3">
					
					</div>
					
                    </div>
				  
				  </div>
                  <div class="x_content">
							
							<table id="table" class="table table table-striped jambo_table bulk_action">
								<thead>
									<tr align="center">
										<th>번호</th>
										<th>양식명</th>
										<th>카테고리</th>
										<th>사용여부</th>
									</tr>
								</thead>

								<tbody id="datatable">
																			
								</tbody>
							</table>
						</div>
						
						<div class="text-center">
							<nav aria-label="Page navigation" id = 'templatePaging'>
							</nav>
						</div>
						
						
						

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	

	

</body>
</html>