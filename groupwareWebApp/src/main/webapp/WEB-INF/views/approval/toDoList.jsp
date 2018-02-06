<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결재 대기함</title>
<style>

	.column-title{
		text-align:center;
	}
	
</style>
<script>

	var pKeyfield;  
	var pKeyword;
	var pKeyword1;
	
	$(document).ready(function(){
		
		console.log("페이지 로드");
		
		templatePaging(1);//최초로드시 페이지처리
		
		//결재현황 팝업창생성
		 $('#datatable').on('click','.currentRecord',function() {
			var apprNo=$(this).attr('id');
			var url = '${pageContext.request.contextPath}/approvalRecord.do?apprNo='+apprNo;
			window.open(url, "결재문서","width=750, height=300");
		}); 
		
		//결재문서 상세조회 팝업창 생성
		 $('#datatable').on("click",'.detailApproval',function(){
	 		  	
			  var check = $(this).parent().children(":last").attr('class');
	 		  	 
			  if(check == 'isNotRead') {
				var recordNo = $(this).parent().children(":last").attr('id');
			  	checkDate(recordNo);
			  } 
			 
			  var apprNo = $('.apprNo').attr('id');
	  		  var status = 2;
			  var finalStatus = $('.detailApproval').attr('id');
			  var url = '${pageContext.request.contextPath}/approvalDetail.do?apprNo='+apprNo
							+'&status='+status+'&finalStatus='+finalStatus;
				window.open(url, "결재문서","width=750, height=800");
				
			});
		
		//검색창 타입 바꾸기
		  $('#pKeyfield').on("change",function(){
			if($(this).val()=='apprDate'){
				$(this).next().attr('type','date');
			//	$('#deptSelect').remove();
				$(this).next().after("&nbsp;<b id=temp>~</b> ");
				$(this).next().next().after("<input type=date id=pKeyword1>");
				
				console.log($('form').html());
		 	/*} else if($(this).val()=='department'){
		 		$('.pKeyword').remove();
				$('#pKeyword1').remove();
				$('#temp').remove()
				$(this).next().after("<select id=deptSelect class=pKeyword name=pKeyword height=25px > </select>");
				 */
			}else{
				$(this).next().attr('type','text');
				
				$('#pKeyword1').remove();
		//		$('#deptSelect').remove();
				$('#temp').remove();

				console.log($('form').html());
			}
			 
		 }); 
		 
		//검색조건 엔터키 눌렀을때 트리거 발동--?
		$('.pKeyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				e.preventDefault();
				$('#btn3').trigger('click');
	        }
		});
		
		
		//검색
		 $("#btn3").on("click",function(){
			 pKeyfield=$('#pKeyfield').val();
			 pKeyword=$('.pKeyword').val();
			 pKeyword1=$('#pKeyword1').val();
			 
			 templatePaging(1);
		 });
		
		
	 
	});
		
	
		function checkDate(recordNo) {
			$.ajax({
				url: '${pageContext.request.contextPath}/checkDate.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				data: {
					recordNo: recordNo				
				},
				success: function (data, textStatus, jqXHR) {
					location.href='${pageContext.request.contextPath}/approvalTodo.do';
				},
				error: function(jqXHR) {
					alert("에러: " + jqXHR.status);
				}
			});			
		}	
	
	
	
	
	
	
		function templatePaging(currentPageNo) {
			var totalCount =  0;		//총 양식서 수
			var countPerPage = 10;   //한 페이지당 보여주는 회원 수
			var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
			var startRow = (currentPageNo - 1) * countPerPage + 1;
			var endRow = currentPageNo * countPerPage;
			var apprFinalStatus=0;
			var apprStatus=0;
			
			$.ajax({
				url: '${pageContext.request.contextPath}/approvalPaging.do' 
				,
				data: {
					keyfield: pKeyfield ,
					keyword: pKeyword ,	
					keyword1: pKeyword1 ,	
					startRow : startRow ,
					endRow : endRow ,
					apprFinalStatus : apprFinalStatus,
					apprStatus : apprStatus
				},
				type: 'POST' ,
				cache: false ,
				dataType: 'json' ,
				success: function (data, textStatus, jqXHR) {
					
					totalCount = data.totalCount;
					
					//datatable테이블 변경하기
					var text = "";
					for(var i=0;i<data.approvals.length;i++) {
						
						if(data.approvals[i].approvalRecords[0].checkDate !=null){
							text += "<tr class=apprRow  style='color:#9e9e9e' >";
						}else{
							text += "<tr class=apprRow style='color:#0459c1' >";		
						}

						text += "<td id="+ data.approvals[i].apprNo +" class='apprNo'>"+ data.approvals[i].apprNo + "</td>";
						text += "<td>"+ data.approvals[i].template.tmpName + "</td>";
						text += "<td id="+ data.approvals[i].apprFinalStatus +" class='detailApproval'>"+data.approvals[i].apprTitle+"</td>";
						text += "<td>"+ data.approvals[i].employee.empName + "</td>";
						text += "<td>"+ data.approvals[i].employee.department + "</td>";
						text += "<td>"+ data.approvals[i].apprDate + "</td>";
						
						text += "<td ><a class='currentRecord' id="+ data.approvals[i].apprNo +" ><i class='fa fa-ellipsis-h'></i></a></td>";
						if(data.approvals[i].approvalRecords[0].checkDate !=null){
							text += "<td class='isRead' id='"+ data.approvals[i].approvalRecords[0].recordNo +"'>읽음</td>";	
						}else{
							text += "<td class='isNotRead' id='"+ data.approvals[i].approvalRecords[0].recordNo +"'>안읽음</td>";			
						}
						text += "</tr>";
					}
						$('#datatable').html(text);
						
						$("#count1").text("-" +data.totalCount+"건의 결재 대기 문서");
					
						//페이징 처리
						jqueryPager({
							countPerPage : countPerPage,
							pageSize : pageSize,
							currentPageNo : currentPageNo,
							totalCount : totalCount
						});
						
					
				} ,
				error: function(jqXHR) {
					alert("에1러: " + jqXHR.status);
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
	
	}

	
</script>
</head>
<body>
		  <!-- 등록된 관리자 리스트 -->
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>결재 대기함</h2>
                    
                    <div class="clearfix" id="count1">&nbsp;&nbsp; <br></div>
                  </div>
				  <div>
					
				   <div class="btn-group" >
                    <form id="search">
						<select id="pKeyfield" name="pKeyfield" style="height:25px;" >
							<option value="apprTitle">제목</option>
							<option value="tmpName">양식명</option>
							<option value="empName">기안자</option>
							<option value="department">기안부서</option>
							<option value="apprDate" id="apprDate">기안일</option>
						</select>
						 <input class="pKeyword" type="text" name="pKeyword" placeholder="검색어를 입력하세요">
						 
						<button id="btn3" type="button">검색</button>
					</form>
					<div class="col-sm-3">
					
					</div>
					
                    </div>
				  
				  </div>
                  <div class="x_content">
					
                 

                    <div class="table-responsive">
                      <table  class="table table-striped jambo_table bulk_action" style="text-align:center;">
                        <thead>
                          <tr class="headings" >
                            
                            
                            <th class="column-title">번호 </th>
                            <th class="column-title">양식명</th>
                            <th class="column-title">문서 제목</th>
                            <th class="column-title">기안자</th>
                            <th class="column-title">기안부서</th>
                            <th class="column-title">기안일</th>
                            <th class="column-title">결재현황</th>
                            <th class="column-title">읽음여부</th>
                            
                            
                          </tr>
                        </thead>

                        <tbody id="datatable">

                         
                        </tbody>
                      </table>
					  <div>
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
                <!-- end of weather widget -->
              </div>
        <!-- /page content -->
        
   
</body>
</html>