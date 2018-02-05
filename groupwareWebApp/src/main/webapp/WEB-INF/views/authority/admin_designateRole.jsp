<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	var pKeyfield='desigRole';
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
		var countPerPage = 10;   //한 페이지당 보여주는 양식서 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var num = 0;	//현재 페이지번호에 속한 게시글의 시작번호
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/DesigRolePagingAjax.do' 
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
				
		 /* 	for(var i=0;i<data.roles.length;i++) {
		 		console.log(i);
		 		//alert(data.roles[i].isRegistration);
			 	if(data.roles[i].isRegistration == '0') {
			 	
					$('input[name=tests['+i+']][value=0]').prop('checked', true);
				}else if(data.roles[i].isRegistration == '1'){
				
					$('input[name=tests['+i+']][value=1]').prop('checked', true);
					
				} 
			}  */
				
				totalCount = data.totalCount;
				num = totalCount - (currentPageNo - 1) * countPerPage;
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
	});
	
</script>
<title>content</title>
</head>
<body>
	<!-- 역할 리스트 -등록,미등록 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>역할 등록리스트</h2>

				<div class="clearfix"></div>
			</div>
			 	<div class="container">
			    <div class="row">    
			        <div class="col-xs-7 col-xs-offset-5">
					    <div class="input-group">
			                <div class="input-group-btn search-panel">
			                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			                    	<span class="keyfield">검색조건</span> <span class="caret"></span>
			                    </button>
			                    <ul class="dropdown-menu" role="menu">
			                      <li><a id='rName'>롤명</a></li>
			                       <li><a id='rExplan'>롤 설명</a></li>
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
				</div>
			</div>
			<div class="x_content">



				<div class="table-responsive">
					<table  id="datatable"  class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th class="column-title">롤 ID</th>
								<th class="column-title">롤 명</th>
								<th class="column-title">롤 타입</th>
								<th class="column-title">롤 설명</th>
								<th class="column-title">등록일자</th>
								<th class="column-title">등록여부</th>

							</tr>
						</thead>

						 <tbody>
						 
                    <c:forEach var="role" items="${requestScope.roles}" varStatus="loop">
	                     <tr class="even pointer">
	                        <td>${pageScope.role.rId}</td>
	
	                        <td>${pageScope.role.rName}</td>
	                        <td>${pageScope.role.rType}</td>
	                        <td>${pageScope.role.rExplan}</td>
	                        <td>${pageScope.role.rDate}</td>
	                        <td><c:choose>
									<c:when test="${pageScope.role.isRegistration eq '0'}">
										<label> <input type="radio"  name="tests[${loop.index}]" value="0" checked="checked"> 등록</label>
										<label> <input type="radio"  name="tests[${loop.index}]"  value="1">미등록</label>
									</c:when>
									<c:otherwise>
										<label> <input type="radio"  name="tests[${loop.index}]" value="0" > 등록</label>
										<label> <input type="radio"  name="tests[${loop.index}]"  value="1" checked="checked">미등록</label>
									</c:otherwise>
								</c:choose>
	                         </td>
	                     </tr>
                     	</c:forEach>	
                  </tbody>
					</table>
				</div>
				<div>
					<div class="text-center">
						<nav aria-label="Page navigation" id = 'Paging'></nav> 
         			 </div>
					<button class="pull-right">일괄 등록</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>