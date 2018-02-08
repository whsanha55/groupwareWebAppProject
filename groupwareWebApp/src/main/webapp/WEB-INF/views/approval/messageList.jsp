<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 보관함</title>
<style>
</style>
	
<script>
		var isSender = 1;	//받은 쪽지함
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
			
			//상세조회
			$('#datatable').on('click','.msgTitle',function() {			
				var msgNo = $(this).attr('id');
				//최초 확인시 확인일자 기록
				var check = $(this).attr('name');	 		  	 
				  if(check == 'isNotRead') {
				  	read(msgNo);
				  } 
				
				var url = '${pageContext.request.contextPath}/retrieveMessage.do?msgNo='+msgNo+'&isSender='+isSender;
				window.open(url,"쪽지상세정보","width=700, height=600");
				
			});
			
		 	$('#sendMsg').click(function() {
				
				var url = "${pageContext.request.contextPath}/writeMessage.do";
				window.open(url, "쪽지보내기", "width=700, height=600");
				
			});
		 	
		 	$('#removeMsg').click(function(){
		 		
		 		//List<Integer>타입으로 체크박스에서 선택된 값들을 데이터 매핑해주기 
		 		
		 		var msgNos = [];
		 		
		 		if(':checkbox[name=table_records]:checked==null '){
		 			swal({title: "삭제할 쪽지를 선택하세요",
						icon: "warning"});
		 			return;
		 		}
		 		$(':checkbox[name=table_records]:checked').each(function(){
		
		 			msgNos.push($(this).attr('id'));
		 		});
		 		
		 		/* $('checkbox[name=table_records]:checked').each(function(){
		 			var msgNos.(this).val());
		 			alert(msgNos);
		 		}); */ 
		 		
		 		/* $('checkbox[name=table_records]:checked').each(function(){
		 			
		 			$(this).map(function(){
		 				return this.val();
		 			})
		 			.get()
		 			.join(",");
		 			
		 		}); */
		 		
		 		$.ajax({
		 			
		 			url: '${pageContext.request.contextPath}/removeMessage.do'
		 			,
		 			method: 'POST'
		 			,
		 			dataType: 'json'
		 			,
		 			data: {
		 				
		 			 msgNos : msgNos.join(",")
		 				
		 			}		 				
		 			,
		 			
		 		success: function(data){
		 			
		 			
					swal({
						
						title: "쪽지 삭제 완료",
						text: "확인을 누르시면 받은 쪽지함으로 이동합니다",
						icon: "success"
						
																		
					}).then((s) => {

						window.close();
						location.href= '${pageContext.request.contextPath}/retrieveMessageList.do';
					});
					
		 			}
		 			,
		 		
		 		error: function(jqXHR) {
		 			alert("error : " + jqXHR.status);
		 		}
		 		
		 		
		 			
		 		});
		 		
		 	});
		 	
			 
		});
		
		function read(msgNo) {
			$.ajax({
				url: '${pageContext.request.contextPath}/messageReading.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				data: {
					msgNo: msgNo				
				},
				success: function (data, textStatus, jqXHR) {
					templatePaging(1);
				},
				error: function(jqXHR) {
					alert("에러: " + jqXHR.status);
				}
			});			
		}
		
		function templatePaging(currentPageNo) {
			var totalCount =  0;		//총 양식서 수
			var countPerPage = 8;   //한 페이지당 보여주는 회원 수
			var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
			var startRow = (currentPageNo - 1) * countPerPage + 1;
			var endRow = currentPageNo * countPerPage;
			
			
			$.ajax({
				url: '${pageContext.request.contextPath}/messagePaging.do' 
				,
				data: {
					startRow : startRow ,
					endRow : endRow,
					isSender : isSender
				},
				type: 'POST' ,
				cache: false ,
				dataType: 'json' ,
				success: function (data, textStatus, jqXHR) {
					
					totalCount = data.totalCount;
					
					//datatable테이블 변경하기
					var text = "";
					for(var i=0; i<data.messages.length ; i++){
						
						if(data.messages[i].isRead==1){
							text += "<tr class='even pointer'  style='color:#9e9e9e' >";
						}else{
							text += "<tr class='even pointer'  style='color:#0459c1' >";		
						} 

						text += "<td class='a-center'><input type='checkbox' class='flat' name='table_records' id="+data.messages[i].msgNo+"></td>";
						if(data.messages[i].isRead ==1){
							text += " <td><a class='msgTitle' id="+data.messages[i].msgNo+" name='isRead' style='color:#9e9e9e;cursor:pointer; font-weight:bolder;'>"+data.messages[i].msgTitle +"</a></td>";	
						}else{
							text += " <td><a class='msgTitle' id="+data.messages[i].msgNo+" name='isNotRead' style='color:#0459c1;cursor:pointer; font-weight:bolder;'>"+data.messages[i].msgTitle +"</a></td>";								
						}
						text += "<td>"+ data.messages[i].senderEmployee.empName + "</td>";
						text += "<td>"+ data.messages[i].msgDate + "</td>";
						if(data.messages[i].isRead ==1){
							text += "<td class='isRead' id='"+ data.messages[i].msgNo +"'>읽음</td>";	
						}else{
							text += "<td class='isNotRead' id='"+ data.messages[i].msgNo +"'>안읽음</td>";			
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
                  <div class="x_title" >
                    <h2>받은 쪽지함</h2>
                    <a class="btn btn-primary pull-right" href="<c:url value="/retrieveMessageList.do"/>">받은 쪽지함</a>
				   <a class="btn btn-primary pull-right" href="<c:url value="/retrieveSendMessageList.do"/>">보낸 쪽지함</a>
                    <div class="clearfix"></div>
                  </div>
				  <div >
				   <div class="btn-group">
                   
				   </div>
				   <div>
                   <a class="btn btn-primary pull-right" id="removeMsg">선택삭제</a>
				   <a class="btn btn-primary pull-right" id="sendMsg">쪽지보내기</a>
					</div>
					</div>
									  
				  
                  <div class="x_content">
					
                
                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            
                            <th>
                              <input type="checkbox" id="allCheck"  >
                            </th>
                            <th class="column-title">제목</th>
                            <th class="column-title">발신자</th>
                            <th class="column-title">발신일시</th>
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
		

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>