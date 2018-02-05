<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.btn {
		width: 120px !important
	}
	
	.col-md-4 {
		width: 20% !important
	}
	
	.col-md-6 {
		width: 80% !important
	}
	#datatable {
		text-align : center;
	}
	.fa {
		cursor: pointer;
	}
	#templatePaging {
		margin-left : 45%;
	}
	
	#templatePaging li {
		cursor : pointer;
	}
</style>
<script>
		var pKeyfield = 'bookmark'; //로딩첫페이지가 북마크!! 
		var pKeyword;
	$(document).ready(function() {
		
		templatePaging(1); //최초 로드시 페이징 가즈아ㅏㅏㅏㅏ
		//양식서 카테고리 클릭 이벤트
		$('.category').on('click',function() {
			/* var categoryNo = $(this).attr('id').split('_')[1]; */
			var temp = $(this).attr('id').split('_');
			pKeyfield = temp[0];
			pKeyword = temp[1];
			
			$('.categoryTheme').text($(this).text().trim());
			
			templatePaging(1);
			
		}); //카테고리 클릭 이벤트 End
		
		
		//즐겨찾기 추가, 삭제 이벤트
		 $('tbody').on('click','.fa', function() {
			
			var tmpNo = $(this).parent().next().text();
			var bookmarkNo = 0;
			var temp = $(this);
			
			//추가할땐 bookmarkNo 데이터 넣고 ajax, 삭제할땐 0으로 ajax
			if(($(this).attr('id') != null && $(this).attr('id') != ''))  {  
				bookmarkNo = $(this).attr('id').split('_')[1];
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/templateBookmarkAjax.do' ,
				cache : false ,
				dataType : 'json' ,
				type : 'GET' ,
				data : {
					tmpNo : tmpNo,
					bookmarkNo : bookmarkNo
				} ,
				success : function(data) {
					/* $('.alert').alert(); */ //언젠가 고칠일이 오겟지
					if(data == 0) {	//삭제할때 리턴값 0
						if(pKeyfield == 'bookmark') { 	
							temp.closest('tr').remove();
						} else {
							temp.attr('class', 'fa fa-star-o fa-lg');
							temp.attr('id','');
						}
						swal("즐겨찾기 삭제","삭제되었습니다", "success");
						
					} else {	//새로운 즐겨찾기 추가 할 때
						temp.attr('class','fa fa-star fa-lg');
						temp.attr('id','bookmark_' + data);
						swal("즐겨찾기 추가", "추가하였습니다", "success");
						
					}
					
				} ,
				error : function(jqXHR) {
					alert(jqXHR.status);
					console.log(jqXHR);
				}
				
			});	
		}); 	//즐겨찾기 이벤트 End
		
		
		//	검색조건
		$('.search-panel .dropdown-menu').on('click','a',function(e) {
				e.preventDefault();
				$('.keyfield').text($(this).text());
				$('.keyfield').attr('id',$(this).attr('id'));
				
		});
		
		
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('.keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('.findTemplate').trigger('click');
	        }
		});
		
		
		// 검색 실행
		$('.findTemplate').on('click', function() {
			if($('.keyfield').attr('id') == null) {
				swal("검색조건를 선택해주세요","", "error");
				return;
			}

			pKeyfield = $('.keyfield').attr('id');
			pKeyword = $('.keyword').val();
			
			templatePaging(1);
			
		});
		
		//직접 작성
		$('#WriteApprovalNoTmp').on('click',function() {
			swal({
				  title: "직접 작성",
				  text: "작성 페이지로 이동하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						location.href = '${pageContext.request.contextPath}/writeApproval.do';
					}	
				});
			
		});
		
		
		//양식서 hover 이벤트
		$('#datatable tbody').on('mouseover','tr',function() {
			$(this).css("backgroundColor","#f1f0d8");
		});
		$('#datatable tbody').on('mouseleave','tr',function() {
			$(this).css("backgroundColor","");
		});
		
		
	});	//$(document).ready End
	
	
	function templatePaging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 10;   //한 페이지당 보여주는 회원 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/templatePagingAjax.do' 
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
				
				//datatable테이블 변경하기
				var text = "";
				for(var i=0;i<data.templates.length;i++) {
					if(data.templates[i].templateBookmarks.length == 0) {
						text += "<tr> <td> <i class='fa fa-star-o fa-lg'/> </td>";
					} else {
						text += "<tr> <td> <i id = 'bookmark_" + data.templates[i].templateBookmarks[0].bookmarkNo +"' class='fa fa-star fa-lg' /> </td>";

						
					}
					text += "<td>"+ data.templates[i].tmpNo + "</td>";
					text += "<td>"+ data.templates[i].templateCategory.categoryName + "</td>";
					text += "<td>"+ data.templates[i].tmpDate + "</td>";
					text += "<td><a href = '${pageContext.request.contextPath}/writeApproval.do?tmpNo=" + data.templates[i].tmpNo + "'> "; 
					text += data.templates[i].tmpName + "</a></td>";
					text += "<td>"+ data.templates[i].tmpSummary + "</td>";
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
	
	}//end of jqueryPager
	
</script>
</head>
<body>
	
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>문서작성</h2>
				<div class="clearfix" width="1200px"></div>
			</div>

			<!-- 양식서 카테고리 -->
			<div class="col-md-4" width="20%">

				<table id="datatable-keytable"
					class="table table-striped jambo_table bulk_action ">
					<thead>
						<tr class="headings" />
					</thead>
				</table>

				<div class="text-center" width="80px" align="center">
					<button id ='bookmark_0' class="btn btn-primary category">양식서 즐겨찾기</button>
				</div>	
				<!-- 
			<div class="text-center" width="80px" align="center">
				<button class="btn btn-primary">기안서</button>
			</div>
			 -->
				<c:forEach items="${requestScope.categoryList}" var="category">
					<div class="text-center" width="80px" align="center">
						<button id="categoryNo_${pageScope.category.categoryNo}"
							class="btn btn-primary category">
							${pageScope.category.categoryName}</button>
					</div>
				</c:forEach>
				
				<div class="text-center" width="80px" align="center">
					<button id="WriteApprovalNoTmp" class="btn btn-primary">직접 작성</button>
				</div>
			</div>


			<!-- 양식서 -->
			<div class="col-md-6" width="900px">
				<div class="x_panel">
					<span class='categoryTheme'>양식서 즐겨찾기</span>
					
					<div class="container">
					    <div class="row">    
					        <div class="col-xs-7 col-xs-offset-5">
							    <div class="input-group">
					                <div class="input-group-btn search-panel">
					                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					                    	<span class="keyfield">검색조건</span> <span class="caret"></span>
					                    </button>
					                    <ul class="dropdown-menu" role="menu">
					                      <li><a id='categoryName'>카테고리</a></li>
					                      <li><a id='tmpName'>양식서명</a></li>
					                    </ul>
					                </div>
					                <input type="text" class="form-control keyword" placeholder="검색어를 입력하세요">
					                <span class="input-group-btn">
					                    <button class="btn btn-default findTemplate" type="button">
					                    	<span class="glyphicon glyphicon-search"></span>
					                    </button>
					                </span>
					            </div>
					        </div>
						</div>
					</div>



		            
					<table id="datatable-keytable" class="table table-striped col-8">
						<tbody>
							<tr />
						</tbody>
					</table>

					<table id="datatable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th width='40px'></th>
								<th>양식서 번호</th>
								<th>카테고리</th>
								<th>등록일자</th>
								<th>양식서명</th>
								<th>양식서 설명</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>

				</div>
				
				
				<nav aria-label="Page navigation" id = 'templatePaging'>
				
				</nav>
			</div>
		</div>
	</div>


	<!-- /page content -->


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>