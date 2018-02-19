<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대결권자 등록</title>
<style>
.pagination {align:center};
.current-page a{
	background-color:#5a69798a;
}
</style>
  <link href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" />
  <script src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.js"></script>
  <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/ko.js"></script> --%>

<script>
	var eKeyfield;
	var eKeyword;
	var eKeyword1;
	
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
	 
	$(document).ready(function () {		

		employeePaging1(1);
		
		$('#startDate1').datetimepicker({
			format : "YYYY/MM/DD HH:00",		
			defaultDate : new Date().setHours(00) 

			
		});
		$('#endDate1').datetimepicker({
			format : "YYYY/MM/DD HH:00",	 
			defaultDate : new Date().setHours(00)

		});
		
		
		//검색창 타입 바꾸기
		 $('.keyfield1').on("change",function(){
			if($(this).val()=='date'){
				$(this).next().attr('placeholder','기간을 선택하세요');
				
				$(this).next().after("<b id=temp>~</b> ")
				$(this).next().next().after("<input type=text id=pKeyword1 placeholder='기간을 선택하세요'>")
				
				$("#pKeyword").datepicker({
		            dateFormat: 'yy년 mm월 dd일'              
		        });
				$('#pKeyword').datepicker("option", "maxDate", $("#pKeyword1").val());
			    $('#pKeyword').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#pKeyword1").datepicker( "option", "minDate", selectedDate );
			    });
				
				$("#pKeyword1").datepicker({
		            dateFormat: 'yy년 mm월 dd일'  
		        });
				$('#pKeyword1').datepicker("option", "minDate", $("#pKeyword").val());
			    $('#pKeyword1').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#pKeyword").datepicker( "option", "maxDate", selectedDate );
			    });
				
				console.log($('form').html());
			} else{
				$(this).next().attr('placeholder','검색어를 입력하세요');
				$('#pKeyword').datepicker("destroy");
				$('#pKeyword').val('');
				$('#pKeyword1').remove();
				$('#temp').remove();

				console.log($('form').html());
				
				//$("input[name=pKeyword]").autocomplete('option','source',
				//[ "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby" ]);
				var url = ''; 
				switch ($(this).val()) {
					case 'empName':
						url = 'retrieveEmployeeNameAndDutyList.do';
						break;
					case 'department':
						url = 'retrieveDepartmentList.do';
						break;
					default :
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
		 
	
		
		
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('#pKeyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				e.preventDefault();
				$('#btn3').trigger('click');
	        }
		});
		
		
		// 검색 실행
		$("#btn3").on("click",function(){
			eKeyfield=$('#pKeyfield').val();
			 if(pKeyfield=='date'){ 
				 eKeyword=convertDate($('#pKeyword').datepicker('getDate'));
				 eKeyword1=convertDate($('#pKeyword1').datepicker('getDate'));
			 }else{
				 eKeyword=$('#pKeyword').val();
			 }
			 
			 function pad(num) {
			        num = num + '';
			        return num.length < 2 ? '0' + num : num;
		     }
			   
			 function convertDate(date) {
			    return date.getFullYear() + "-" + pad((date.getMonth() + 1)) + "-" + pad(date.getDate());	
			 }
			 
	 			if(eKeyfield != "date" && eKeyword == "") { 			
					swal("검색어를 입력해주세요.", "");
					return; 				
				}
	 			if(eKeyfield == "date" ){
		 			if( pKeyword == "" || eKeyword1 == "") {
						swal("날짜를 입력해주세요.", "");
						return;
		 			}  
	 			}
			 
			 employeePaging1(1);
		 });
		
		//검색후 다시 리스트로
		$('#return').click(function(){
			location.href="${pageContext.request.contextPath}/registerDeputy.do";
		});	
		
		$('#searchEmp').click(function() {
			$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
			$('#layerpop').modal({
				backdrop: 'static', 
				keyboard: false
			});
		});
		
		$('#modalChooseBtn').on('click',function() {
			//사원관리 - 대결권자설정
			$('input[name=dempNo]').val(selectedEmpNo);
			$('input[name=empName]').val(selectedNameAndDuty);
		});
		
		$('#modalCloseBtn').on('click',function() {
			$('#chartBody').html(""); 
		});
		
		$('#datatable').on('click','#stopUse',function() {
		   var startDate = $(this).parent().parent().find("#startDate").text();
		   var startDateArr = startDate.split('/');
		   var startDatdCompare = startDateArr[0] + startDateArr[1] + startDateArr[2];
		    
		   var now = new Date();
		   var year= now.getFullYear();
		   var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
		   var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
		    
		   var NowTime = year + mon + day;
		   
		   if(startDateArr > NowTime) {
				$.ajax({
					url: "${pageContext.request.contextPath}/cancelDeputy.do",
					method: 'POST',
					data : {
						depNo : $(this).parent().parent().find('input').val()
					},
					dataType : 'json',
					success: function(data) {
						employeePaging1(1);
					},
					error: function(jqXHR) {
						alert("error : " + jqXHR.status);
					}
				})
		     } else {
				$.ajax({
					url: "${pageContext.request.contextPath}/stopUseDeputy.do",
					method: 'POST',
					data : {
						depNo : $(this).parent().parent().find('input').val()
					},
					dataType : 'json',
					success: function(data) {						
						employeePaging1(1);
					},
					error: function(jqXHR) {
						alert("error : " + jqXHR.status);
					}
				});
				//$('#stopUse').detach();
		    }
		});
		
		
		//취소
		$('#datatable').on('click','#candep',function() {
			console.log($(this).parent().parent().find('input').val());
			$.ajax({
				url: "${pageContext.request.contextPath}/cancelDeputy.do",
				method: 'POST',
				data : {
					depNo : $(this).parent().parent().find('input').val()
				},
				dataType : 'json',
				success: function(data) {
					employeePaging1(1);
				},
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
			})
		});
		
		//대결 등록
		$('#submitBtn').click(function(e) {
			var startDate = $( "input[name='startDate']" ).val();
			var endDate = $( "input[name='endDate']" ).val();
		     
			
			/* var startDateArr = startDate.split('-');
			var endDateArr = endDate.split('-');
		                 
			var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
			var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
		         
			if(startDateCompare.getTime() > endDateCompare.getTime()) {        
		    	e.preventDefault();
				alert("시작날짜와 종료날짜를 확인해 주세요.");
			} */
		});
		
	});
	
	function employeePaging1(currentPageNo) {
			var totalCount =  0;		//총  수
			var countPerPage = 5;   //한 페이지당 보여주는 회원 수
			var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
			var startRow = (currentPageNo - 1) * countPerPage + 1;
			var endRow = currentPageNo * countPerPage;
			
			$.ajax({
				url: '${pageContext.request.contextPath}/listDeputyAjax.do' 
				,
				data: {
					keyfield: eKeyfield ,
					keyword: eKeyword ,	
					keyword1: eKeyword1 ,	
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
						text += '<tr class="text-center"><td colspan=8>조회된 검색결과가 없습니다</td></tr>';
					} else {
						for(var i=0;i<data.deputies.length;i++) {
							for(var j=0;j<data.deputies[i].employees.length;j++) {
								text += "<tr id='parent" + i + "'>";
								text += "<input type='hidden' id='depNo"+ i +"' value='"+ data.deputies[i].depNo +"'>";
								text += "<td>"+ data.deputies[i].dempNo +"</td>";
								text += "<td>"+ data.deputies[i].employees[j].duty +"</td>";
								text += "<td>"+ data.deputies[i].employees[j].empName; + "</td>";
								text += "<td id='startDate'>"+ data.deputies[i].startDate +"</td>";
								text += "<td id='endDate'>"+ data.deputies[i].endDate +"</td>";
								text += "<td>"+ data.deputies[i].progression +"</td>";
								text += "<td>"+ data.deputies[i].depReason +"</td>";
								text += "<td><button id='stopUse' type='button'>사용중단</button><button id='candep' type='button'>취소</button></td>";
								text += "</tr>";
							}
						}
					}
					$('#datatable').find('tbody').html(text);

					//페이징 처리
					jqueryPager1({
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
			
		} //end templatePaging1 function
		
		
		function jqueryPager1(subOption) {
			
			var pageBlock = subOption.countPerPage;      
			var pageSize = subOption.pageSize;        
			var currentPage = subOption.currentPageNo;   
			var pageTotal = subOption.totalCount;       
			var pageTotalCnt = Math.ceil(pageTotal/pageBlock);
			var pageBlockCnt = Math.ceil(currentPage/pageSize);
			var sPage = (pageBlockCnt-1) * pageSize + 1;
			var ePage;
			
			var html ="<div class='center-block'>";
				html ="<ul class='pagination'>";

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
				html += '<a class="page-link" aria-label="Previous" onclick = "employeePaging1(' + (sPage - pageSize) + ')">'; 
			}
			html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
			
			for(var i=sPage; i<=ePage; i++) {
				if(currentPage == i) {
					html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
				} else {
					html += '<li class="page-item"><a class="page-link" onclick="employeePaging1(' + i + ');">' + i + '</a></li>';
				}
			}				

			if (ePage >= pageTotalCnt) {
				html += '<li class="page-item disabled">';
				html += '<a class="page-link" aria-label="Next">';
			} else {
				html += '<li class="page-item">';
				html += '<a class="page-link" aria-label="Next" onclick = "employeePaging1(' + (ePage+1) + ')">';
			}
			html += '<span aria-hidden="true">&raquo;</span> </a></li>';
			html += '</ul>'
			html += '</div>';
			
			$('#employeePaging1').html(html);
	
	} //end of jqueryPager1
	
</script>

</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>대결권자 설정</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
						action="${pageContext.request.contextPath }/registerDeputy.do" method="POST">
					<div class="form-group form-inline">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="empName">대결권자 지정 :</label>&nbsp;&nbsp;
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="dempNo" name="dempNo" value="" >
							<input type="hidden" id="empNo" name="empNo" value="${requestScope.empNo }"/>
							<input type="text" id="empName" name="empName" class="form-control" readonly>
								<span class="input-group-btn">
									<button id="searchEmp" type="button" class="btn btn-primary"
										data-toggle="modal" <%-- data-target="#myModal" --%>>검색</button>
								</span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="ex3">기간지정 :</label> 
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="startDate1" class="form-control" name="startDate"
									required="required" style="width:250px;">&nbsp;&nbsp;&nbsp;
									~&nbsp;&nbsp;&nbsp;
							<input type="text" id="endDate1"	class="form-control" name="endDate"
									required="required" style="width:250px;">
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="depReason">사유 :</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="depReason" name="depReason"
								required="required" class="form-control col-md-7 col-xs-12" style="width:535px;">
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button id="submitBtn" type="submit" class="btn btn-success">대결등록</button>
						</div>
					</div>
					
					<div class="ln_solid"></div>
					
					<div class="col-md-3">
						<div class="input-group">  
							<div class="searchList2" style="width:700px;">
								<select class="keyfield1" name="pKeyfield" style="height:25px;" >
									<option value="dempNo">사원번호</option>
									<option value="duty">직책</option>
									<option value="empName">이름</option>
									<option value="date">기간</option>
								</select> <input id="pKeyword" type="text" name="pKeyword" placeholder="검색어를 입력하세요">
								<button id="btn3" type="button">검색</button>
								<i class="fa fa-undo" id="return">되돌리기</i>
						</div>
					</div>
						
					<table id="datatable" class="table table-striped table-bordered" style="width:1202px;">
						<thead>
							<tr>
								<th id='1' class="text-center">사번</th>
								<th id='2' class="text-center">직책</th>
								<th id='3' class="text-center">이름</th>
								<th id='4' class="text-center">시작일</th>
								<th id='5' class="text-center">종료일</th>
								<th id='6' class="text-center">사용여부</th>
								<th id='7' class="text-center">사유</th>
								<th id='8' class="text-center">비고</th>
							</tr>
						</thead>
						<tbody id="tbody">
							
						</tbody>
					</table>
					<div class="text-center">
				 		<nav aria-label="Page navigation" id = 'employeePaging1'>
				
						</nav> 
						</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
							
				<div class="modal-body" id="chartBody"></div>
							
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="modalChooseBtn"
							data-dismiss="modal">선택</button>
					<button type="button" class="btn btn-default" id="modalCloseBtn"
							data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>