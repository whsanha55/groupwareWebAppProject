<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 양식 관리</title>
	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script>

	var pKeyfield;  
	var pKeyword;	
	
	$(document).ready(function(){
		
		templatePaging(1);//최초 로드시 페이지처리

		
		//양식 등록창으로 이동
		$('#add').on('click', function(){
			location.href = "${pageContext.request.contextPath}/admin/addTemplateForm.do";
		});
			
		
		//양식 삭제
		$('#delete').on('click', function(){
				
			var checkData = [];
			$("input[name='tmpNo']:checked").each(function(){
				checkData.push($(this).val());
			});
			
			if(checkData.length == 0) {
				swal("삭제할 양식을 선택해주세요.", "선택된 양식이 없습니다.");
				return;
			}

			var tmpNos = {'tmpNo': checkData.join()};
			
			swal({
				  title: "양식 삭제",
				  text: "양식을 삭제합니다. 계속 진행하시겠습니까?",
				  icon: "info",
				  buttons : true 
			}).then((e) => {
			     if(e) {
					deleteTemplate(tmpNos);							
				 }
			});				
		});	//end of delete
			
			

		//양식 상세보기		
		$(document).on('click', '.detailTemplate', function(){
			var tmpNo = $(this).attr('id');
			var url = '${pageContext.request.contextPath}/admin/templateDetail.do?tmpNo='+tmpNo;
			window.open(url, "양식 상세보기","width=750, height=800");
		});

		
		$('#search').on('click', function(){
			pKeyfield = $('#keyfield').val();
			pKeyword = $('#keyword').val();
			templatePaging(1);			
		});
		
		
		
	});//end of document.ready
	
	
	
	
	//양식 삭제 함수
	function deleteTemplate(tmpNos) {						
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/removeTemplate.do'
			,
			method: 'POST'
			,
			dataType: 'json'
			,
			data: tmpNos
			,
			async: true
			,
			cache: false
			,
			success: function(data, textStatus, jqXHR) {				
				if(data == "삭제 완료"){
					swal({
						  title: "삭제 완료",
						  text: "양식이 삭제되었습니다.",
						  icon: "success",
						  confirmButton: true,
						  showCancelButton: false
						}).then((e) => {
							if(e) {
								location.href="${pageContext.request.contextPath}/admin/template.do";										
							}	
					});	
				}
			}
			,
			error: function(jqXHR, textStatus, errorThrown) {
				alert('error: ' + jqXHR.status);
			}					
		});				
	}//end of deleteTemplate()

	
		
	
	
	//페이징징징 관련
	function templatePaging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 10;   //한 페이지당 보여주는 양식서 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var num = 0;	//현재 페이지번호에 속한 게시글의 시작번호
		
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/templatePaging.do' 
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
				for(var i=0;i<data.templates.length;i++) {

					text += '<tr>';
					text += '<td><input type="checkbox" id="tmpNo" name="tmpNo" value="' + data.templates[i].tmpNo + '"/></td>';
					text += '<td>' + (num - i) + '</td>';
					text += '<td class="detailTemplate" id="' + data.templates[i].tmpNo + '">' + data.templates[i].tmpName + '</td>';
					text += '<td>' + data.templates[i].templateCategory.categoryName + '</td>';
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
							<a class="btn btn-primary pull-right" id="add">양식추가</a>
							 <a class="btn btn-primary pull-right" id="delete">선택삭제</a>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
							<div class="col-md-12 col-sm-9 col-xs-12">

								<div>
									<div class="col-md-6">
										<div class="col-md-4">
													
										</div>
									</div>
									<div>
										<div class="col-xs-4 col-xs-offset-2">
											<div class="input-group">
												<div class="input-group-btn search-panel">
													<button type="button"
														class="btn btn-default dropdown-toggle"
														data-toggle="dropdown">
														<span id="search_concept">검색</span> <span class="caret"></span>
													</button>
													<ul class="dropdown-menu" role="menu">
														<li><a href="#">양식명</a></li>
														<li><a href="#">카테고리</a></li>
													
													</ul>
												</div>
												<input type="hidden" name="search_param" value="all"
													id="search_param"> <input type="text"
													class="form-control" name="x"
													placeholder="Search term..."> <span
													class="input-group-btn">
													<button class="btn btn-default" type="button">
														<span class="glyphicon glyphicon-search"></span>
													</button>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6"></div>
							</div>
							
							<table class="table table-striped table-bordered" style="text-align:center;">
								<thead>
									<tr>
										<th></th>
										<th>번호</th>
										<th>양식명</th>
										<th>카테고리</th>
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