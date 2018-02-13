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
	.detailApproval{
		cursor:pointer;
	}
	.currentRecord{
		cursor:pointer;
	}
	#return{
		cursor:pointer;
	}
	.btn-group {
		float : right;
		margin-right : 20px;
	}
</style>
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script>


	var pKeyfield;  
	var pKeyword;
	var pKeyword1;
	
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	  });
	
	$(document).ready(function(){
		
		templatePaging(1);//최초로드시 페이지처리
		
		//결재현황 팝업창생성
		 $('#datatable').on('click','.currentRecord',function() {
			var apprNo=$(this).attr('id');
			var url = '${pageContext.request.contextPath}/approvalRecord.do?apprNo='+apprNo;
			window.open(url, "결재문서","width=750, height=300");
		}); 
		
		//결재문서 상세조회 팝업창 생성
		 $('#datatable').on("click",'.detailApproval',function(){
	 		  
			  //최초 확인시 확인일자 기록
			  var check = $(this).parent().children(":last").attr('class');	 		  	 
			  if(check == 'isNotRead') {
				var recordNo = $(this).parent().children(":last").attr('id');
			  	checkDate(recordNo);
			  } 
			 
			  var apprNo = $(this).attr('id');
	  		  var status = 2;
			  var url = '${pageContext.request.contextPath}/approvalDetail.do?apprNo='+apprNo
							+'&status='+status+'&finalStatus=0';
				window.open(url, "결재문서","width=1100, height=800");
				
			});
		
		//검색창 타입 바꾸기
		  $('#pKeyfield').on("change",function(){
			if($(this).val()=='apprDate'){
				$(this).next().attr('placeholder','기간을 선택하세요');
				
				$(this).next().after("<b id=temp>~</b> ")
				$(this).next().next().after("<input type=text id=pKeyword1 placeholder='기간을 선택하세요'>")
				
				$(".pKeyword").datepicker({
		            dateFormat: 'yy년 mm월 dd일'              
		        });
				$('.pKeyword').datepicker("option", "maxDate", $("#pKeyword1").val());
			    $('.pKeyword').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#pKeyword1").datepicker( "option", "minDate", selectedDate );
			    });
				
				$("#pKeyword1").datepicker({
		            dateFormat: 'yy년 mm월 dd일'  
		        });
				$('#pKeyword1').datepicker("option", "minDate", $(".pKeyword").val());
			    $('#pKeyword1').datepicker("option", "onClose", function ( selectedDate ) {
			        $(".pKeyword").datepicker( "option", "maxDate", selectedDate );
			    });
			}else{
				$(this).next().attr('placeholder','검색어를 입력하세요');
				$('.pKeyword').datepicker("destroy");
				$('.pKeyword').val('');
				
				$('#pKeyword1').remove();
		//		$('#deptSelect').remove();
				$('#temp').remove();

				console.log($('form').html());
				
				var url = ''; 
				switch ($(this).val()) {
					case 'apprTitle':
						$("input[name=pKeyword]").autocomplete('option','source',[]);
						return;
					case 'tmpName':
						url = 'retrieveTemplateNameList.do';
						break;
					case 'empName':
						url = 'retrieveEmployeeNameAndDutyList.do';
						break;
					case 'department':
						url = 'retrieveDepartmentList.do';
						break;
				}
				
				$.ajax({
					 url : '${pageContext.request.contextPath}/' + url ,
					 cache : false ,
					 type : 'GET' ,
					 datatype : 'json' ,
					 success : function(data) {
						 $("input[name=pKeyword]").autocomplete('option','source',data);
					 } ,
					 error : function(jqXHR) {
							alert(jqXHR.status);
							console.log(jqXHR);
					 }
					 
				});	
				
			}
			 
		 }); 
		
		  $("input[name=pKeyword]").autocomplete({
				focus : function() {
					return false;
				}
		 });
		 
		//검색조건 엔터키 눌렀을때 트리거 발동--?
		$('.pKeyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				e.preventDefault();
				$('#btn3').trigger('click');
	        }
		});
		
		
		///검색
		 $("#btn3").on("click",function(){
			 pKeyfield=$('#pKeyfield').val();
			 if(pKeyfield=='finDate' || pKeyfield=='apprDate'){
				 pKeyword=convertDate($('#pKeyword').datepicker('getDate'));
				 pKeyword1=convertDate($('#pKeyword1').datepicker('getDate'));
			 }else{
				 pKeyword=$('#pKeyword').val();
			 }
			 
			 function pad(num) {
			        num = num + '';
			        return num.length < 2 ? '0' + num : num;
		     }
			   
			 function convertDate(date) {
			    return date.getFullYear() + "-" + pad((date.getMonth() + 1)) + "-" + pad(date.getDate());	
			 }
			 
	 			if(pKeyfield != "apprDate" && pKeyword == "") { 			
					swal("검색어를 입력해주세요.", "");
					return; 				
				}
	 			if(pKeyfield == "apprDate" ){
		 			if( pKeyword == "" || pKeyword1 == "") {
						swal("날짜를 입력해주세요.", "");
						return;
		 			}  
	 			}
			 
			 templatePaging(1);
		 });
		
		//검색후 다시 리스트로
			$('#return').click(function(){
				location.href="${pageContext.request.contextPath}/approvalTodo.do";
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
					templatePaging(1);
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
						if(data.approvals[i].urgency != 1){
							text += "<td id="+  data.approvals[i].apprNo +" class='detailApproval'style='font-weight:bolder'>"+data.approvals[i].apprTitle+"</td>";
						}else{
							text += "<td id="+  data.approvals[i].apprNo +" class='detailApproval'style='font-weight:bolder;'> <b style='color:#F44336;'>[긴급]</b>"+data.approvals[i].apprTitle+"</td>";
						}   
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
						<i class="fa fa-undo" id="return">되돌리기</i>
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
        
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>