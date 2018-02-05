<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		
		
		//삭제 
		$('#deleteBtn').on('click', function() {			
			var arr =[];
			if($("input[name=selected]").is(':checked') == false) {
				swal("삭제할 항목을 체크해주세요.", "선택된 항목이 없습니다.");
			} else {
				$(':checkbox[name=selected]').each(function() {
					if($(this).is(':checked')) {
						arr.push($(this).val());
						console.log(arr.join());
					}
				});
				swal({
					  title: "공지사항 삭제",
					  text: "공지사항을 삭제합니다. 계속 진행하시겠습니까?",
					  icon: "info",
					  buttons : true 
				}).then((e) => {
				     if(e) {
						$.ajax({
							url: '${pageContext.request.contextPath}/admin/deleteNotice.do'
							,
							method: 'GET'
							,
							data: { noticeNo : arr.join()}
							, 
							success: function(data) {
								
								swal("삭제 완료", "선택하신 항목이 삭제되었습니다.", "success");
								 Paging(1); 
							}
							, 
							error: function(jqXHR) {
								alert('Error : ' + jqXHR.status);
							}	 			
							
						});	
										
					 }
				});		
				
			}
		});	
		
	});
	
	function Paging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 10;   //한 페이지당 보여주는 양식서 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var num = 0;	//현재 페이지번호에 속한 게시글의 시작번호
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/NoticePagingAjax.do' 
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
				for(var i=0;i<data.notices.length;i++) {
					text += "<tr class='even pointer'><td class='a-center '><input type='checkbox' name='selected' id='ex_chk' value="+data.notices[i].noticeNo+"></td>";
					text += "<td>"+ data.notices[i].noticeNo + "</td>";
					text += "<td><a href='${pageContext.request.contextPath}/admin/detailNotice.do?noticeNo=" 
						+data.notices[i].noticeNo +" '>"+ data.notices[i].noticeTitle + "</a></td>";
					text += "<td>"+ data.notices[i].hitCount + "</td>";
					text += "<td>"+ data.notices[i].noticeDate + "</td>";
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
	
</script>
</head>
<body>
<div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
             <h2>공지사항</h2>
             
           	<div class="container">
			    <div class="row">    
			        <div class="col-xs-7 col-xs-offset-5">
					    <div class="input-group">
			                <div class="input-group-btn search-panel">
			                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			                    	<span class="keyfield">검색조건</span> <span class="caret"></span>
			                    </button>
			                    <ul class="dropdown-menu" role="menu">
			                      <li><a id='noticeTitle'>제목</a></li>
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
             
        <div class="text-right"><a class="btn btn-primary" href='<c:url value="/admin/addNotice.do"/>'>등록</a></div>
        <div class="clearfix"></div>
        </div>
        
        <div class="table-responsive">
                <table id="datatable" class="table table-striped jambo_table bulk_action">
                  <thead>
                    <tr class="headings">
                      <th><input type="checkbox" id="ex_chk"> </th>
                      <th class="column-title">NO </th>
                      <th class="column-title">제목 </th>
                      <th class="column-title">조회수</th>
                      <th class="column-title">등록일</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
                <button type="button"  id="deleteBtn" class="btn btn-primary pull-right" >삭제</button>
         <div>
         	<div class="text-center">
				<nav aria-label="Page navigation" id = 'Paging'></nav> 
         	 </div>
         </div>			
       </div>
     </div>
	</div>
</body>
</html>