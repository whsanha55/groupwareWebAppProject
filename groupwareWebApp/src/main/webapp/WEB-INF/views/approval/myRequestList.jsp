<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요청문서함</title>

<script>

	var pKeyfield;  
	var pKeyword;
	
	$(document).ready(function(){
		
		templatePaging(1);//최초로드시 페이지처리
		
		
		/*  $('#datatable').on('click','#recordModal',function() {
			 	var apprNo=$(this).attr('name')
				$('#recordBody').load('${pageContext.request.contextPath}/recordModal.do?apprNo='+apprNo)
					

				$('#layerpop').modal();
		}); */
		
		 $('#datatable').on("click",'.detailApproval',function(){
				
				var apprNo=$(this).attr('id');
				var url = '${pageContext.request.contextPath}/ApprovalDetail.do?apprNo='+apprNo;
				window.open(url, "결재문서","width=700, height=600");
			});
		
	});
		
	
		function templatePaging(currentPageNo) {
			var totalCount =  0;		//총 양식서 수
			var countPerPage = 10;   //한 페이지당 보여주는 회원 수
			var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
			var startRow = (currentPageNo - 1) * countPerPage + 1;
			var endRow = currentPageNo * countPerPage;
			
			
			$.ajax({
				url: '${pageContext.request.contextPath}/approvalMyRequestPaging.do' 
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
					for(var i=0;i<data.approvals.length;i++) {

						text += "<tr><td>"+ data.approvals[i].apprNo + "</td>";
						text += "<td>"+ data.approvals[i].template.tmpName + "</td>";
						text += "<td id="+ data.approvals[i].apprNo +" class='detailApproval'>"+data.approvals[i].apprTitle+"</td>";
						text += "<td>"+ data.approvals[i].apprDate + "</td>";
						
						text += "<td><button class='btn btn-default' id='recordModal' name="+data.approvals[i].apprNo+">보기</button></td>";
						text += "</tr>";
					}
						$('#datatable').html(text);
						
						$("#count1").text("-" +data.totalCount+"건의 결재 요청 문서");
					
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

		}

	
</script>
</head>
<body>
		  <!-- 등록된 관리자 리스트 -->
         <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>결재 요청함</h2>
                    
                    <div class="clearfix" id="count1">&nbsp;&nbsp; <br></div>
                  </div>
				  <div>
					
				   <div class="btn-group" >
                    <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" aria-expanded="false">문서 제목 <span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu">
                      <li><a href="#">양식명</a>
                      </li>
                      <li><a href="#">기간</a>
                      </li>
                      
                    </ul>
					<div class="col-sm-3">
						<div id="imaginary_container"> 
							<div class="input-group stylish-input-group">
							<input type="text" class="form-control"  placeholder="Search" >
						<span class="input-group-addon" style="padding:3px 10px">
						<button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
						</span>
							</div>
						</div>
					</div>
					
                    </div>
				  
				  </div>
                  <div class="x_content">
					
                 

                    <div class="table-responsive">
                      <table  class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            
                            
                            <th class="column-title">문서번호</th>
                            <th class="column-title">양식명</th>
                            <th class="column-title">문서 제목</th>
                            <th class="column-title">기안일</th>
							<th class="column-title">결재현황</th>
                            
                          </tr>
                        </thead>

                        <tbody id="datatable">
                        
                   <%--      <c:forEach var="approval" items="${requestScope.approvals}" >
                        
                          <tr class="even pointer">
	
                             <td class=" ">${pageScope.approval.apprNo}</td> 
                            <td class=" ">${pageScope.approval.template.tmpName }</td>
                            <td id="${pageScope.approval.apprNo}" class="DetailApproval">${pageScope.approval.apprTitle}</td>
                            <td class=" ">${pageScope.approval.apprDate }</td>
							<td class=" "><a data-toggle="modal" data-target="#myModal">보기</a><a></a></td>
                            
                           
                          </tr>
                         </c:forEach> --%>
                         
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
        
        <!-- 
         모달
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:900px;">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">결재 문서</h4>
	      </div>
	      <div class="modal-body">
	      
		  <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="float:right; width:295px;">
												<button type="button" class="btn btn-success">결재</button>
												<button type="button" class="btn btn-success">보류</button>
												<button type="button" class="btn btn-success">반려</button>
												<button type="button" class="btn btn-success">결재회수</button>
			</div>
			결재라인								
		<table class="table table-striped jambo_table bulk_action" >
                        <thead>
                          <tr class="headings">
                            
                            <th rowspan="3" class="column-title">결재</th>
                            <th class="column-title">사장</th>
                            <th class="column-title">부장</th>
							<th class="column-title">팀장</th>
                            <th class="column-title"></th>
                            <th class="column-title"></th>   
							<th class="column-title"></th>
                            <th class="column-title"></th>  
                            
                          </tr>
                        </thead>

                        
							 <tr class="headings" style="background-color:#3f5367; color:#ECF0F1;">
                            
                            <td rowspan="3" class="column-title">결재</td>
                            <td class="column-title">사장</td>
                            <td class="column-title">부장</td>
							<td class="column-title">팀장</td>
                            <td class="column-title"></td>
                            <td class="column-title"></td>   
							<td class="column-title"></td>
                            <td class="column-title"></td>  
                            
                          </tr>
                          <tr class="even pointer">
                            
                          
                            <td class=" ">박사장</td>
							<td class=" ">김부장</td>
                            <td class=" ">최팀장</td>
                            <td class=" "></td>
                            <td class=" "></td>
							<td class=" "></td>
                            <td class=" "></td>
                            
                            
							
                          </tr>
						  <tr class="even pointer">
                            
                           
                           
                            <td class=" "><img src="images/도장.jpg" style="height:50px; width:50px;"></td>
							<td class=" "><img src="images/도장.jpg"style="height:50px; width:50px;" ></td>
                            <td class=" "><img src="images/도장.jpg"style="height:50px; width:50px;" ></td>
                            <td class=" "></td>
                            <td class=" "></td>
							<td class=" "></td>
                            <td class=" "></td>
                            
                            
							
                          </tr>
                          <tr class="headings"style="background-color:#3f5367; color:#ECF0F1;">
                            
                            <td rowspan="3" class="column-title">참조</td>
                            <td class="column-title">팀장</td>
                            <td class="column-title"></td>
							<td class="column-title"></td>
                            <td class="column-title"></td>
                            <td class="column-title"></td>   
							<td class="column-title"></td>
                            <td class="column-title"></td>  
                            
                          </tr>
                        
                          <tr class="even pointer">
                            
                          
							
                            <td class=" ">박사장</td>
							<td class=" "></td>
                            <td class=" "></td>
                            <td class=" "></td>
                            <td class=" "></td>
							<td class=" "></td>
                            <td class=" "></td>
                            
                            
							
                          </tr>
				
                      </table>
	      코멘트
		  <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            
                            <th class="column-title">사원이름</th>
                            <th class="column-title">코멘트내용</th>
                            <th class="column-title">작성날짜</th>   
                            
                          </tr>
                        </thead>

                        <tbody>
                          <tr class="even pointer">
                            
                           
							
                            <td class=" ">이지희</td>
							<td class=" ">승인합니다.</td>
                            <td class=" ">2018-01-03 10:30</td>
                            
                            
							
                          </tr>
						  <tr class="even pointer">

                           <td class=" ">김부장</td>
							<td class=" ">잘 알겠습니다.</td>
                            <td class=" ">2018-01-04 10:30</td>
                           
							
                          </tr>
				</tbody>
                      </table>
                       문서 정보
					   <table class="table table-striped jambo_table bulk_action">
                        
                          <tr class="even pointer">
                            
                            <td class="column-title" style="background-color:#3f5367; color:#ECF0F1;">제목</td>
                            <td colspan="2" style="text-align:center;">금연 캠페인 기안서</td>
                            <td></td> 
                            
                          </tr>
                     

                    
                          <tr class="even pointer">
                            
                           
							
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">작성자</td>
                            <td class=" ">홍길동</td>
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">양식명</td>
                            <td class=" ">기안서</td>
                            
							
                          </tr>
						  <tr class="even pointer">

                           <td class=" " style="background-color:#3f5367; color:#ECF0F1;">부서</td>
							<td class=" ">인사1팀</td>
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">보존기한</td>
                            <td class=" ">영구보존</td>
                           
							
                          </tr>
						  <tr class="even pointer">

                           <td class=" " style="background-color:#3f5367; color:#ECF0F1;">작성일</td>
							<td class=" ">2018.01.03</td>
                            <td class=" " style="background-color:#3f5367; color:#ECF0F1;">긴급여부</td>
							<td class=" ">일반</td>
                           
							
                          </tr>
						 
							<tr>
								<td colspan="4">내용넣기</td>
							</tr>
                      </table>
					  </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
		
	      </div>
	    </div>
	  </div>
	</div>
	모달 끝 -->
	
	
		<div class="modal fade" id="layerpop" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      header
		      <div class="modal-header">
		        닫기(x) 버튼
		        <button type="button" class="close" data-dismiss="modal">×</button>
		        header title
		        <h4 class="modal-title">Header</h4>
		      </div>
		      body
		      <div class="modal-body test123">
		           <table class="table table-striped jambo_table bulk_action">
                       <thead>
                         <tr class="headings">
                           
                           <th class="column-title">순번</th>
                           <th class="column-title">결재자</th>
                           <th class="column-title">결재유형</th>
						   <th class="column-title">배정일시</th>
                           <th class="column-title">확인일시</th>
                           <th class="column-title">결재일시</th>      
                           
                         </tr>
                       </thead>
                        <tbody id=recordBody>
                        
	                   </tbody>       
	              </table> 
		      </div>
		      Footer
		      <div class="modal-footer">
		        Footer
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	
        
	    <!-- 모달 팝업
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:700px;">
		      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">Modal title</h4>
		      </div>
		      <div class="modal-body">
			<table class="table table-striped jambo_table bulk_action">
	                        <thead>
	                          <tr class="headings">
	                            
	                            <th class="column-title">순번</th>
	                            <th class="column-title">결재자</th>
	                            <th class="column-title">결재유형</th>
								<th class="column-title">배정일시</th>
	                            <th class="column-title">확인일시</th>
	                            <th class="column-title">결재일시</th>      
	                            
	                          </tr>
	                        </thead>
	
	                        <tbody>
	                          <tr class="even pointer">
	                            
	                            <td><a data-toggle="modal" data-target="#myModal">1</a><a></a></td>
								
	                            <td class=" ">이지희 대리 영업부</td>
								<td class=" ">결재</td>
	                            <td class=" ">2018-01-03 10:30</td>
	                            <td class=" ">2018-01-03 13:10</td>
	                            <td class=" ">2018-01-04 18:30</td>
	                            
	                            
								
	                          </tr>
							  <tr class="even pointer">
	                            
	                            <td><a data-toggle="modal" data-target="#myModal">2</a><a></a></td>
								
	                            <td class=" ">이지희 대리 영업부</td>
								<td class=" ">진행중</td>
	                            <td class=" ">2018-01-03 10:30</td>
	                            <td class=" ">2018-01-03 13:10</td>
	                            <td class=" "></td>
	                            
	                            
	                            
								
	                          </tr>
					</tbody>
	                      </table>
		      </div>
		      <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
			
		      </div>
		    </div>
		  </div>
		</div> -->
		<!-- 모달 팝업 끝 -->
</body>
</html>