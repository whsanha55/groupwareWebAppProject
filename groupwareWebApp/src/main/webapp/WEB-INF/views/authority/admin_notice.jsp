<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	$(document).ready(function() {
		
		templatePaging(1); //최초 로드시 페이징 가즈아ㅏㅏㅏㅏ
	});
	
	function templatePaging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 3;   //한 페이지당 보여주는 회원 수
		var pageSize = 2;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/PagingAjax.do' 
			,
			data: {
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
				for(var i=0;i<data.notices.length;i++) {
					text += "<tr class='even pointer'><td class='a-center '><input type='checkbox' id='ex_chk'></td>";
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
		

	} //end templatePaging function
	
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
			html += '<a class="page-link" aria-label="Previous" onclick = "templatePaging(' + (sPage - pageBlock) + ')">'; 
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
                    <h2>공지사항</h2>
                    <div class="text-right">
                  <a class="btn btn-primary" href='<c:url value="/admin/addNotice.do"/>'>등록</a>
               </div>
                    <div class="clearfix"></div>
                  </div>

                    <div class="table-responsive">
                      <table id="datatable" class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                             <th>
                              <input type="checkbox" id="ex_chk"> 
                            </th>
                            <th class="column-title">NO </th>
                            <th class="column-title">제목 </th>
                            <th class="column-title">조회수</th>
                            <th class="column-title">등록일</th>
                            
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                      </table>
                      <button class="btn btn-primary pull-right">삭제</button>
                 <div>
                 <div class="text-center">
  						<nav aria-label="Page navigation" id = 'templatePaging'>
				
						</nav> 
                  </div>
                 </div>
                 				
       </div>
                     
                  
     </div>
</div>
</body>
</html>