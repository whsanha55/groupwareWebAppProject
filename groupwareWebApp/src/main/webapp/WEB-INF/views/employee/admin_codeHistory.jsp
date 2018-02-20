<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeHistoryVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자_이력조회</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	var eKeyfield;
	var eKeyword;
	$(document).ready(function() {
	
		historyPaging(1); //최초 로드시 페이징 가즈아ㅏㅏㅏㅏ

		//검색조건
		$('.search-panel .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
		});
		
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('.keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('#findEmployee').trigger('click');
	        }
		});
		
		
		// 검색 실행
		$('#findHistory').on('click', function() {
			if($('.keyfield').attr('id') == undefined) {
				swal("검색조건를 선택해주세요","", "error");
				return;
			}
	
			eKeyfield = $('.keyfield').attr('id');
				
			historyPaging(1);
			
		});
		
		$('#datatable').on('click','#removebtn',function() {
			var no = $(this).parent().prevAll('#no').val();
			console.log(no);
			swal({
				 title: "이력정보 삭제",
				 text: "이력정보를 삭제합니다. 계속 진행하시겠습니까?",
				 icon: "info",
				 buttons : true	
			}).then((e) => {
				if(e) {
					removeHistory(no);
				}
			});
			
			function removeHistory(no) {
				$.ajax({
					url:'${pageContext.request.contextPath}/admin/removeHistory.do',
					method:'POST',
					data:{
						no
					},
					async: true
					,
					cache: false
					,
					dataType:'json',
					success: function(data) {
						swal({
							  title: "삭제 완료",
							  text: "코드가 삭제되었습니다.",
							  icon: "info",
							  buttons : "확인" 
						}).then((e) => {
							if(e) {
							  	historyPaging(1);
							}
						});	
					},
					error: function(jqXHR) {
						alert('error :' + jqXHR.status);
					}
				});
			}
		});
	
	});
	
	function historyPaging(currentPageNo) {
		var totalCount =  0;		//총  수
		var countPerPage = 10;   //한 페이지당 보여주는 회원 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/listAjaxCodeHistory.do' 
			,
			data: {
				keyfield: eKeyfield ,
				keyword: eKeyword ,	
				startRow : startRow ,
				endRow : endRow
			}
			,
			type: 'POST' 
			,
			cache: false 
			,
			dataType: 'json' 
			,
			success: function (data, textStatus, jqXHR) {
				
				totalCount = data.totalCount;
				
				//datatable테이블 변경하기
				var text = "";
				if(totalCount == 0) {
					text += '<tr class="text-center"><td colspan=6>조회된 검색결과가 없습니다</td></tr>';
				} else {
					for (var i=0; i<data.histories.length;i++) {
						text += '<tr>';
						text += '<input type="hidden" id="no" name="no" value="'+ data.histories[i].no +'"">'
						text += '<td>'+ data.histories[i].empNo +'</td>';
						text += '<td>'+ data.histories[i].empName +'</td>';
						text += '<td>'+ data.histories[i].deptName +'</td>';
						text += '<td>'+ data.histories[i].dutyName +'</td>';
						text += '<td>'+ data.histories[i].startDate +'</td>';
						text += '<td>'+ data.histories[i].endDate +'</td>';
						text += '<td><button id="removebtn" type="button">삭제</button></td>';
						text += '</tr>';
					}
				}
				$('#datatable').find('tbody').html(text);
				
				
				//페이징 처리
				jqueryPager({
					countPerPage : countPerPage,
					pageSize : pageSize,
					currentPageNo : currentPageNo,
					totalCount : totalCount
				});		
			} 
			,
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}	
		});
		
	} //end templatePaging function
	
	
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
			html += '<a class="page-link" aria-label="Previous" onclick = "historyPaging(' + (sPage - pageSize) + ')">'; 
		}
		html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
		
		for(var i=sPage; i<=ePage; i++) {
			if(currentPage == i) {
				html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
			} else {
				html += '<li class="page-item"><a class="page-link" onclick="historyPaging(' + i + ');">' + i + '</a></li>';
			}
		}				

		if (ePage >= pageTotalCnt) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Next">';
		} else {
			html += '<li class="page-item">';
			html += '<a class="page-link" aria-label="Next" onclick = "historyPaging(' + (ePage+1) + ')">';
		}
		html += '<span aria-hidden="true">&raquo;</span> </a></li>';
		html += '</ul>';
		
		$('#historyPaging').html(html);
	
	}//end of jqueryPager


</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>이력조회</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2"></div>
						</div>
						<div>
							<div class="col-md-4 col-xs-offset-2 pull-right">
								<div class="input-group" style="margin-right:-25px;">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle" style="margin-right:3px"
											data-toggle="dropdown">
											<span class="keyfield">검색</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a id="empNo">사번</a></li>
											<li><a id="empName">이름</a></li>
											<li><a id="deptName">부서</a></li>
											<li><a id="dutyName">직책</a></li>
										</ul>
									</div>
									<input type="text" class="form-control keyword" name="x" placeholder="검색어">
									<span class="input-group-btn">
										<button class="btn btn-default" id="findHistory" type="button" style="margin-left:3px; height:34px;">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
				<table id="datatable"
					class="table table-striped table-bordered text-center">
					<thead>
						<tr>
							<th class="text-center">사번</th>
							<th class="text-center">이름</th>
							<th class="text-center">부서</th>
							<th class="text-center">직책</th>
							<th class="text-center">시작일</th>
							<th class="text-center">종료일</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
			<div class="col-md-5"></div>
			<nav aria-label="Page navigation" id ="historyPaging">
				
			</nav>
		</div>
	</div>
</body>
</html>