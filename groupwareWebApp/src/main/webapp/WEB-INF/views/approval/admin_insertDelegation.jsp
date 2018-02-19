<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전결관리</title>
<style>
#insertDeleg {
	margin: 0 auto;
	width: 590px;
}
</style>
<script>
var pKeyfield;  
var pKeyword;


$(document).ready(function(){
	
	templatePaging(1);//최초로드시 페이지처리
	
	 
	//검색조건 엔터키 눌렀을때 트리거 발동
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
 
		 templatePaging(1);
	 });
	
	
	//삭제
	 $("#datatable").on("click",'.pull-right',function(){
		 swal({
			  title: "전결 조건 삭제",
			  text: "선택된 조건을 삭제하시겠습니까?",
			  icon: "error",
			  buttons : true 
			}).then((e) => {
				if(e) {
					 location.href="${pageContext.request.contextPath}/admin/removeDelegation.do?deleNo="+$(this).attr('name');
				}	
			
			});
		
		 
	 });
	 
	 
	//전결 추가
	 $("#btn1").on("click",function(){
//		 event.preventDefault();
			swal({
				  title: "전결 조건 추가",
				  text: "전결 조건을 추가 하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						registerDelegation();
					}	
				});
		 
	 });
		
	    
	    
		//양식 등록 함수
		function registerDelegation(){			
			var tmpNo = $('#delegationTmp').val();
			var cNo = $('#delegationDuty').val();		
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/registerDelegation.do'
				,
				method: 'POST' 
				,
				data: {
					tmpNo: tmpNo	,
					cNo: cNo						
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					
						swal({
							  title: "추가 완료",
							  text: "전결 조건이 추가되었습니다.",
							  icon: "success",
							  confirmButton: true,
							  showCancelButton: false
							}) .then((e) => {
								if(e) {
									templatePaging(1);
								}	
							}) ;	

					
						
				},
				error: function(jqXHR, textStatus, error) {
					alert("Error : " + jqXHR.status + "," + error);
				}
			});
		}
 
});
	

	function templatePaging(currentPageNo) {
		var totalCount =  0;		//총 양식서 수
		var countPerPage = 5;   //한 페이지당 보여주는 회원 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var apprFinalStatus=0;
		var apprStatus=0;
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/delegationPaging.do' 
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
				for(var i=0;i<data.delegations.length;i++) {

					text += "<tr><td>"+ data.delegations[i].template.tmpName + "</td>";
					text += "<td>"+ data.delegations[i].code.cName + "</td>";
					text += "<td>"+ data.delegations[i].deleDate + "</td>";
					text += "<td style='width:30px;'><a class='btn btn-primary pull-right'  name="+data.delegations[i].deleNo+" style='padding:0px; margin:auto; background-color:#c53b31; border-color:#c53b31; color:white;'>삭제</a></td>";
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
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>전결 관리</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<%-- 		<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
						action="${pageContext.request.contextPath }/registerDeputy.do" method="POST"> --%>
				<div class="form-group form-inline">
					<div id="insertDeleg col-md-3" style="display: inline-block; margin-left:70px; border-bottom:2px solid #e6e9ed;">
						<form id="search" style="margin-bottom:10px;">
							전결 조건 추가 : <select id="delegationTmp" name="delegationTmp"
								style="height: 28px;">
								<c:forEach var="template" items="${requestScope.template}">
									<option value="${pageScope.template.tmpNo }">${pageScope.template.tmpName }</option>
								</c:forEach>
							</select> <select id="delegationDuty" name="delegationDuty"
								style="height: 28px; width: 150px;">
								<c:forEach var="duty" items="${requestScope.duty}">
									<option value="${pageScope.duty.cNo }">${pageScope.duty.cName }</option>
								</c:forEach>
							</select>
							<button id="btn1" class="btn btn-primary" type="button"
								style="height: 28px; margin-bottom: 4px; padding-top: 2px;">추가</button>
						</form>
					</div>
					<div class="col-md-3">
						 <div class="input-group"
							style="display: inline-flex; margin-top: 66px; margin-left:464px;">

							<select id="pKeyfield" name="pKeyfield"
								style="height: 28px; width: 80px;">
								<option value="template">양식명</option>
								<option value="duty">직급</option>
							</select> <input class="pKeyword" type="text" name="pKeyword"
								placeholder="검색어를 입력하세요" style="width: 172px; height: 28px;">
							<button id="btn3" class="btn btn-primary" type="button"
								style="height: 28px; margin-bottom: 4px; padding-top: 2px;">검색</button>


						</div> 
					</div>
					<!-- <div class="input-group col-md-3 pull-right"
						style="display: inline-flex; ">

						<select id="pKeyfield" name="pKeyfield"
							style="height: 28px; width: 80px;">
							<option value="template">양식명</option>
							<option value="duty">직책</option>
						</select> <input class="pKeyword" type="text" name="pKeyword"
							placeholder="검색어를 입력하세요" style="width: 172px; height: 28px;">
						<button id="btn3" class="btn btn-primary" type="button"
							style="height: 28px; margin-bottom: 4px; padding-top: 2px;">검색</button>


					</div> -->

				</div>
				<div class="col-md-12" style="width: 100%">


					<table class="table table-striped table-bordered"
						style="width: 80%; text-align: center; margin: auto;">
						<thead>
							<tr>
								<th style="text-align: center;">양식명</th>
								<th style="text-align: center;">직책</th>
								<th style="text-align: center;">지정일</th>
								<th style="text-align: center;">삭제</th>
							</tr>
						</thead>
						<tbody id="datatable">

						</tbody>
					</table>
					<nav aria-label="Page navigation" id='templatePaging'
						style="text-align:center;"> </nav>




				</div>


				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>