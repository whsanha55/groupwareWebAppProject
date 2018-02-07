<%-- postList.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	var pKeyfield = 'post';
	var pKeyword;
	
	$(document).ready(function() {

		Paging(1);

		//	검색조건
		$('.search-panel .dropdown-menu').on('click', 'a', function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id', $(this).attr('id'));

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
	});

	function Paging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 3;   //한 페이지당 보여주는 회원 수
		var pageSize = 2;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/PagingAjax1.do' 
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
				for (var i = 0; i < data.posts.length; i++) {
					text += "<tr>";
					text += "<td>" + data.posts[i].postNo + "</td>";
					text += "<td>" + data.posts[i].documentNo + "</td>";
					text += "<td><a href='${pageContext.request.contextPath}/detailPost.do?postNo="
							+ data.posts[i].postNo + " '>"	+ data.posts[i].postTitle + "</a></td>";
					text += "<td>" + data.posts[i].cNo + "</td>";
					text += "<td>" + data.posts[i].writer + "</td>";
					text += "<td>" + data.posts[i].postDate + "</td>";
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
		
		var pageTotalCnt = Math.ceil(pageTotal/pageSize);
		var pageBlockCnt = Math.ceil(currentPage/pageBlock);
		var sPage, ePage;
		
		var html ="<ul class='pagination'>";
		
		if(pageBlock > 1) {
			sPage = (pageBlockCnt-1) * pageBlock + 1;
		} else {
			sPage = 1;
		}
		
		if((pageBlockCnt * pageBlock) >= pageTotalCnt) {
			ePage = pageTotalCnt;
		} else {
			ePage = pageBlockCnt * pageBlock;
		}
		
		if(sPage <= 1) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Previous">' 
		} else {
			html += '<li class="page-item ">';
			html += '<a class="page-link" aria-label="Previous" onclick = "Paging(' + (sPage - pageBlock) + ')">'; 
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
	
	}//end of jqueryPager
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>게시글</h2>

				<div class="container">
					<div class="row">
						<div class="col-xs-7 col-xs-offset-5">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										<span class="keyfield">검색조건</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a id='documentNo'>문서종류</a></li>
										<li><a id='postTitle'>제목</a></li>
										<li><a id='cNo'>부서구분</a></li>
										<li><a id='writer'>작성자</a></li>
									</ul>
								</div>
								<input type="text" class="form-control keyword"	placeholder="검색어를 입력하세요"> 
								<span class="input-group-btn">
									<button class="btn btn-default find" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>


				<div class="clearfix"></div>
			</div>

			<div class="table-responsive">
				<table id="datatable"
					class="table table-striped jambo_table bulk_action">
					<thead>
						<tr class="headings">
							<th class="column-title">NO</th>
							<th class="column-title">문서종류</th>
							<th class="column-title">제목</th>
							<th class="column-title">부서구분</th>
							<th class="column-title">작성자</th>
							<th class="column-title">등록일</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div>
					<div class="text-right">
						<a class="btn btn-primary" href='<c:url value="/addPost.do"/>'>등록</a>
					</div>
					<div class="text-center">
						<nav aria-label="Page navigation" id = 'Paging'></nav>
					</div>
				</div>

			</div>


		</div>
	</div>
</body>
</html>