<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var pKeyfield='';
var pKeyword;


//////////////////////////////////// 페이징 처리 ///////////////////////////////////////////////////////////

function Paging(currentPageNo) {

var totalCount =  0;		//총 양식서 수
var countPerPage = 5;   //한 페이지당 보여주는 양식서 수
var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
var startRow = (currentPageNo - 1) * countPerPage + 1;
var endRow = currentPageNo * countPerPage;
var num = 0;	//현재 페이지번호에 속한 게시글의 시작번호
var aNo = '${param.aNo}';




$.ajax({
	url: '${pageContext.request.contextPath}/AuthEmpListAjax.do' 
	,
	data: {
		keyfield: pKeyfield ,
		keyword: pKeyword ,	
		startRow : startRow ,
		endRow : endRow,
		aNo : aNo

	},
	type: 'POST' ,
	cache: false ,
	dataType: 'json' ,
	success: function (data, textStatus, jqXHR) {
		
		totalCount = data.totalCount;
		num = totalCount - (currentPageNo - 1) * countPerPage;
		
		//datatable테이블 변경하기
		var text = "";
		for(var i=0;i<data.authEmps.length;i++) {
		
			text += "<tr class='even pointer'>";
			text += "<td class='empNo text-center'><a data-toggle='modal' data-target='#myModal' class='myModal''>"+ data.authEmps[i].empNo + "</a></td>";
			text += "<td class='empName text-center'>"+ data.authEmps[i].empName + "</td>";
			text += "<td class='department text-center'>"+ data.authEmps[i].department + "</td>";
			text += "<td class='duty text-center'>"+ data.authEmps[i].duty + "</td>";
			text += "<td class='aNo text-center'><label class='radio-inline'> <input type='radio' name='aNo"+ [i]+" ' id='inlineRadio1' value='0' checked> 등록 </label> <label class='radio-inline'> <input type='radio' name='aNo"+ [i]+"' id='inlineRadio2' value='1'>미등록</label></td>";
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
	
});
		
		
</script>
<title>content</title>
</head>
<body>
	<!-- 역할 리스트 -등록,미등록 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>권한 등록리스트</h2>
				
				<div class="clearfix"></div>
			</div>
			권한번호 : ${param.aNo}
			권한명 : ${param.aName}
			 	<div class="container">
			    <div class="row"> 
			    	 
			        <div class="col-xs-7 col-xs-offset-5">
			        	<button type="submit"  id="deleteBtn"  class="btn btn-default pull-left" >추가</button>  
					    <div class="input-group">
					    	
			                <div class="input-group-btn search-panel">
			                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			                    	<span class="keyfield">검색조건</span> <span class="caret"></span>
			                    </button>
			                    <ul class="dropdown-menu" role="menu">
			                      <li><a id='empNo'>사번</a></li>
			                       <li><a id='empName'>이름</a></li>
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
			

			<%-- <form action="<%=request.getContextPath()%>/admin/modifyDesignate.do" method="post"> --%>
			<div class="x_content">
				<div class="table-responsive">
					<table  id="datatable"  class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th class="column-title text-center">사번</th>
								<th class="column-title text-center">이름</th>
								<th class="column-title text-center">부서</th>
								<th class="column-title text-center">직책</th>
								<th class="column-title text-center">등록여부</th>
							</tr>
						</thead>

						 <tbody>
							
                  		</tbody>
					</table>
				</div>
				
					<div class="text-center">
						<nav aria-label="Page navigation" id = 'Paging'></nav> 
         			 </div>
         			 <a class="btn btn-default pull-right" href='<c:url value="/admin/authorityList.do"/>'>뒤로가기</a>
					<button type="submit"  id="deleteBtn"  class="btn btn-primary pull-right" value="${param.aNo}">일괄 등록</button>
			</div>       
			
		</div>
	</div>
</body>
</html>