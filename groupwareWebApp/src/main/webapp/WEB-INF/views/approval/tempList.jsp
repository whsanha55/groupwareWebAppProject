<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>임시보관함</title>
<style>

	.column-title{
		text-align:center;
	}
	
	table { table-layout:fixed; }

	#templatePaging li {
		cursor : pointer;
	}
</style>
<script>

	var pKeyfield;  
	var pKeyword;
	var pKeyword1;
	
	$(document).ready(function(){
		
		templatePaging(1);//최초로드시 페이지처리
		
		//체크박스 전체 선택&해제
		 $("#allCheck").click(function(){ 	
			 if($("#allCheck").prop("checked")) { 				  
				 $("input[type=checkbox]").prop("checked",true); 				  
			 } else {  
				 $("input[type=checkbox]").prop("checked",false); 
			 } 
		 });
		 
		 //기안페이지로 넘어가기
		  $('#datatable').on('click','.writeButton',function(){
			var apprNo=$(this).attr('id');  
			var url='${pageContext.request.contextPath}/writeApproval.do?apprNo='+ apprNo;
			location.href=url;
		 });
		  
		   
		 //선택삭제
		 $('#deleteApproval').click(function(){
			 var checkRow="";
			 $("input[name='checkRow']:checked").each(function(){
				 checkRow+= $(this).val()+",";
			 });
			 checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); 

			 if(checkRow ==''){
				 swal("삭제할 문서를 선택하세요.","");
				 return false;
			 }
			 swal({
				  title: "문서 삭제",
				  text: "선택된 문서를 삭제하시겠습니까?",
				  icon: "error",
				  buttons : true 
				}).then((e) => {
					if(e) {
						 location.href="${pageContext.request.contextPath}/deleteApproval.do?checkRow="+checkRow;
					}	
				});

		 });
		 
	});		
	
		//리스트 정보 뿌려주기 & 페이징처리
		function templatePaging(currentPageNo) {
			var totalCount =  0;		//총 양식서 수
			var countPerPage = 10;   //한 페이지당 보여주는 회원 수
			var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
			var startRow = (currentPageNo - 1) * countPerPage + 1;
			var endRow = currentPageNo * countPerPage;
			var apprFinalStatus=4;
			var apprStatus=7;
			
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
						text += "<tr><td width=50 ><input type=checkbox value="+data.approvals[i].apprNo+" name=checkRow ></td>"
						text += "<td>"+ data.approvals[i].template.tmpName + "</td>";
						text += "<td>"+data.approvals[i].apprTitle+"</td>";
						text += "<td><button type='button' class='btn btn-primary btn-sm writeButton' id="+ data.approvals[i].apprNo +" style='border-bottom-width:0px; margin-bottom: 0px; padding-top: 3px; padding-bottom: 1px;' >기안하기</button></td>";
						text += "</tr>";
					}
						$('#datatable').html(text);
						
	
					
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
	
	}
		
	

	
</script>
</head>
<body>
          
		  <!-- 등록된 관리자 리스트 -->
          <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>임시 보관함</h2>
                
                    <div class="clearfix" id="count1"></div>
                  </div>
				  <div style="width:100%;">
				   <div class="btn-group">
                     
                   
					<div class="col-sm-3">
						<div id="imaginary_container"> 
							<div class="input-group stylish-input-group">
							
							</div>
						</div>
					</div>
					
                    </div>
				  <a class="btn btn-primary pull-right" id="deleteApproval" style="float:left!important; margin-left:10px;">선택 삭제</a>
				  </div>
                  <div class="x_content">
					
                 

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action" style="text-align:center;">
                        <thead>
                          <tr class="headings" >
                            
                            <th style="text-align:center; width:80px;">
                              <input type="checkbox" id="allCheck"  >
                            </th>
                            <th class="column-title">양식명</th>
                            <th class="column-title">문서 제목</th>
                            <th class="column-title">기안</th>

                            
                          </tr>
                        </thead>

                        <tbody id="datatable">
                        
                        </tbody>
                      </table>
					  <div class="text-center">
						<nav aria-label="Page navigation" id = 'templatePaging'>				
					
						</nav> 
					
					  </div>
                     </div>
						
						
                   </div>
               	  </div>
            	  </div>
                </div>
                <!-- end of weather widget -->
              </div>
        
        
        <!-- /page content -->
        
	  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>