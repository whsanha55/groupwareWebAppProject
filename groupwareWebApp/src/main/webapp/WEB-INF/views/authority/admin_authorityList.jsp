<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var pKeyfield='';
var pKeyword;
var aName1;

//////////////////////////////////// 페이징 처리 ///////////////////////////////////////////////////////////

function Paging(currentPageNo) {

var totalCount =  0;		//총 양식서 수
var countPerPage = 5;   //한 페이지당 보여주는 양식서 수
var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
var startRow = (currentPageNo - 1) * countPerPage + 1;
var endRow = currentPageNo * countPerPage;
var num = 0;	//현재 페이지번호에 속한 게시글의 시작번호


$.ajax({
	url: '${pageContext.request.contextPath}/AuthorityPagingAjax.do' 
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
		for(var i=0;i<data.authorities.length;i++) {
		
			text += "<tr class='even pointer'>";
			text += "<td class='a-center' id='selected'><input type='checkbox' id='ex_chk' name='selected' value="+ data.authorities[i].aNo +"> </td>";
			text += "<td class='aNo'><a data-toggle='modal' data-target='#myModal' class='myModal''>"+ data.authorities[i].aNo + "</a></td>";
			text += "<td class='aName'>"+ data.authorities[i].aName + "</td>";
			text += "<td class='aNote'>"+ data.authorities[i].aNote + "</td>";
		/* 	text += "<td class='aWhether'>"+ data.authorities[i].aWhether + "</td>"; */
			if(data.authorities[i].aWhether ==  '0'){	
				text += "<td class='aWhether'>유</td>";
			}else{
				text += "<td class='aWhether'>무</td>";
			} 
			text += "<td class='align-center selectBtn'><a class='btn btn-default' href='<c:url value='/admin/designRole.do?aName="+ data.authorities[i].aName +"&aNo="+data.authorities[i].aNo+"'/>'>역할</a><button type='button' class='btn btn-default'>수정</button><button type='button' class='btn btn-default'><a href='<c:url value='/admin/designAuthority.do?aName="+ data.authorities[i].aName +"&aNo="+data.authorities[i].aNo+ "'/>'>사원추가</a></button></td>";
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


$(document).ready(function() {	
	
	Paging(1);
	
	//검색조건
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
		

	

	
	//수정 폼 변경
	$('#datatable').on('click','button:contains(수정)', function () {
		
		
		aName1 = $(this).parents("tr").find('.aName').text();		
		var aNote = $(this).parents("tr").find('.aNote').text();
		var aWhether = $(this).parents("tr").find('.aWhether').text();
		console.log(aWhether);
		
	    $(this).parents("tr").find('.aName').html("<input type='text' name='aName' value="+aName1 +" />");	
	    $(this).parents("tr").find('.aNote').html("<input type='text'' name='aNote'>");	
	    $(this).parents("tr").find('.aNote').find(':text[name=aNote]').val(aNote);
	    $(this).parents("tr").find('.aWhether').html("<label class='radio-inline'> <input type='radio' name='aWhether' id='inlineRadio1' value='0'> 유 </label> <label class='radio-inline'> <input type='radio' name='aWhether' id='inlineRadio2' value='1'>무</label>");
	    $(this).parents("tr").find('.selectBtn').html("<td class='align-center'><button type='button' class='btn btn-default'>완료</button><button type='button' class='btn btn-default'>취소</button></td>");
		
	    
	    if(aWhether == '유') {
            $('input[name=aWhether][value=0]').prop('checked',true);
         }else{
            $('input[name=aWhether][value=1]').prop('checked',true);
         }
		
	    
	    
	    $('button:contains(수정)').prop("disabled", true);
	    $('button:contains(사원추가)').prop("disabled", true);

	});
	
	
	//수정 완료
 	$('#datatable').on('click','button:contains(완료)', function () {
 		
 		var aNo = $(this).parents("tr").find('.aNo').text();		
 		var aName = $(this).parents("tr").find('input[name=aName]').val();
 		var aNote = $(this).parents("tr").find('input[name=aNote]').val();
 		var aWhether = $(this).parents("tr").find('input[name=aWhether]:checked').val();		
 		
 		 var name = $(this).parents("tr").find('.aName');
         var note = $(this).parents("tr").find('.aNote');
         var whether = $(this).parents("tr").find('.aWhether');
         var selectBtn = $(this).parents("tr").find('.selectBtn');
         
         var text = "";
		swal({
			  title: "게시판을 수정하시겠습니까?",
			  icon: "info",
			  buttons : true 
			}).then((e) => {
				if(e) {
					$.ajax({
						url : '${pageContext.request.contextPath}/modifyAuthorityAjax.do' 
							,
							method : 'POST'
							,
							data : {
								aNo : aNo,
								aName : aName,
								aNote : aNote,
								aWhether : aWhether,
								aName1 : aName1
							}
							,
							dataType: 'json'
							,
							async : true 
							,
							cache : true
							,
							success : function(data, textStatus, jqXHR){	
								if(data.isSuccess == "true"){
									swal("수정 완료!","");
									$(name).html(data.authority.aName);
		                            $(note).html(data.authority.aNote);
		                            if(data.authority.aWhether ==  '0'){	
		                            	text += "<td class='aWhether'>유</td>";
		                			}else{
		                				text += "<td class='aWhether'>무</td>";
		                			} 
		                            $(whether).html(text);
		                            $(selectBtn).html("<a class='btn btn-default' href='<c:url value='/admin/designRole.do?aName="+ data.authority.aName +"&aNo="+data.authority.aNo+"'/>'>역할</a><button type='button' class='btn btn-default'>수정</button><button type='button' class='btn btn-default'><a href='<c:url value='/admin/designAuthority.do?aName="+ data.authority.aName +"&aNo="+data.authority.aNo+ "'/>'>사원추가</a></button>"); 
							
		                            $('button:contains(수정)').prop("disabled", false);
		                    	    $('button:contains(사원추가)').prop("disabled", false);
		                            
		                    	   
		                    	    
								}else if(data.isSuccess == "false"){
									swal("이미 권한이 존재합니다.");
								} 
							}
							,
							error : function(jqXHR, textStatus, errorThrown){
								alert('error: ' + jqXHR.status);
							}
					
						});
				}
			});

	});
	
	//취소
 	$('#datatable').on('click','button:contains(취소)', function () {  
 		var aNo = $(this).parents("tr").find('.aNo').text();		
 		var aName = $(this).parents("tr").find('input[name=aName]').val();
 		var aNote = $(this).parents("tr").find('input[name=aNote]').val();
 		var aWhether = $(this).parents("tr").find('input[name=aWhether]:checked').val();		
 		var text = "";
 		
 		$(this).parents("tr").find('.aName').html(aName);
        $(this).parents("tr").find('.aNote').html(aNote);
 		if(aWhether == '0'){
 			text += "<td class='aWhether'>유</td>";
 		}else{
 			text += "<td class='aWhether'>무</td>";
 		}
 		$(this).parents("tr").find('.aWhether').html(text);
 		$(this).parents("tr").find('.selectBtn').html("<a class='btn btn-default' href='<c:url value='/admin/designRole.do?aName="+ aName +"&aNo="+aNo+"'/>'>역할</a><button type='button' class='btn btn-default'>수정</button><button type='button' class='btn btn-default'><a href='<c:url value='/admin/designAuthority.do?aName="+ aName +"&aNo="+aNo+ "'/>'>사원추가</a></button>"); 
	
        $('button:contains(수정)').prop("disabled", false);
 	    $('button:contains(사원추가)').prop("disabled", false);
 	});
	
	
	//사원정보 조회
	//$('#myModal').click(function(){
	$("#datatable").on('click','.myModal',function() {
		var aNo = $(this).text();		
		$.ajax({
			url: '${pageContext.request.contextPath}/retrieveAuthEmpAjax.do' 
			,
			type: 'POST' 
			,
			data : {
					aNo : aNo
					}
			,
			cache: false 
			,
			dataType: 'json' 
			,
			success: function (data, textStatus, jqXHR) {
				//modal테이블 변경하기
				var text = "";
				for(var i=0;i<data.authorities.length;i++) {
					for(var j = 0; j<data.authorities[i].emp.length; j++){
					text += "<tr class='even pointer'>";
					text += "<td>"+ data.authorities[i].emp[j].empNo + "</td>";
					text += "<td>"+ data.authorities[i].emp[j].empName + "</td>";
					text += "<td>"+ data.authorities[i].aName + "</td>";		
					text += "</tr>";
					}
					
				} 
				$('#authEmp').find('tbody').html(text);			
				
			} ,
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}
			
		});	
	});
	
	//체크박스 모두 선택
	$('.checkAll').click(function(){
		if($('.checkAll').prop("checked")){
			$('input[type=checkbox]').prop("checked",true);
		}else{
			$('input[type=checkbox]').prop("checked",false);
		}
	});
	
	
	//삭제
	$('#removeBtn2').click(function(){
		var arrayParam = [];
		
		$("input[name=selected]:checked").each(function() {
		    arrayParam.push( $(this).val());		   
		});
		
		if(arrayParam.length == 0) {
			swal("권한을 선택하세요","");
		} else {
			swal({
				  title: "권한을 삭제하시겠습니까?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						$.ajax({
							url : '${pageContext.request.contextPath}/RemoveAuthorityAjax.do' 
								,
								method : 'POST'
								,
								data : {
									aNo : arrayParam.join()
								}
								,
								dataType: 'json'
								,
								async : true 
								,
								cache : true
								,
								success : function(data, textStatus, jqXHR){	
									if(data.isSuccess == "true"){
										swal("삭제 완료!","");
										 Paging(1); 
									}else if(data.isSuccess == "false"){
										swal("역할이 존재합니다.");
									} 
								}
								,
								error : function(jqXHR, textStatus, errorThrown){
									alert('error: ' + jqXHR.status);
								}
						
							});
					}
				});	
		}		
		
	});
	
});
		
		
		
</script>
<style>
	.page-link{cursor:pointer !important;}
</style>
</head>
<body>
	<!-- 등록된 관리자 리스트 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>권한 리스트</h2>
				<div class="removeBtn1">
						<button id="removeBtn2" class="btn btn-primary pull-right" type="button">삭제</button>
						<a class="btn btn-default pull-right" href='<c:url value="/admin/authority.do"/>'>추가</a>
					</div>
					<div class="clearfix"></div>
				</div>
			 <div class="container">
			<div class="row">    
			        
			        
				</div>
					<div class="col-xs-5">
					    <div class="input-group">
			                <div class="input-group-btn search-panel">
			                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="margin-right:3px;">
			                    	<span class="keyfield">검색조건</span> <span class="caret"></span>
			                    </button>
			                    <ul class="dropdown-menu" role="menu">
			                      	<li><a id="empNo">아이디</a></li>
								  	<li><a id="empName">이름</a></li>
								  	<li><a id="aName">권한명</a></li>
			                    </ul>
			                </div>
			                <input type="text" class="form-control keyword" placeholder="검색어를 입력하세요">
			                <span class="input-group-btn" >
			                    <button class="btn btn-default find" type="button" style="margin-left:3px; height:34px;">
			                    	<span class="glyphicon glyphicon-search"></span>
			                    </button>
			                </span>
			            </div>   
			        </div>
				</div>
			
			
			
				<div class="table-responsive">
					<table id="datatable"  class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox" id="ex_chk" class="checkAll"> </th>
								<th class="column-title">권한번호</th>
								<th class="column-title">권한명</th>
								<th class="column-title">비고</th>
								<th class="column-title">유무</th>
								<th class="column-title">관리</th>

							</tr>
						</thead>

						<tbody class="modifyForm">
	
						</tbody>
					</table>
					<div>
						<div class="text-center">
							<nav aria-label="Page navigation" id = 'Paging'></nav> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">사원 정보</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped jambo_table bulk_action  text-center" id="authEmp">
						<thead>
							<tr class="headings  text-center">
								<th class="column-title  text-center">사번</th>
								<th class="column-title  text-center">이름</th>
								<th class="column-title  text-center">권한명</th>

							</tr>
						</thead>

						<tbody>

						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>