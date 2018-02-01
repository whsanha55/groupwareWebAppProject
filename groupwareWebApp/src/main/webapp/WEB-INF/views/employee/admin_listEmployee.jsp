<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
	var eKeyfield;
	var eKeyword;
	$(document).ready(function() {
	
		employeePaging(1); //최초 로드시 페이징 가즈아ㅏㅏㅏㅏ
		
		$('#regisBtn').click(function(){
			location.href="${pageContext.request.contextPath}/admin/registerEmployee.do";
		});

		//검색조건
		$('.search-panel .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
		});
		
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('.keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('.findTemplate').trigger('click');
	        }
		});
		
		
		// 검색 실행
		$('#findEmployee').on('click', function() {
			if($('.keyfield').attr('id') == null) {
				swal("검색조건를 선택해주세요","", "error");
				return;
			}
	
			eKeyfield = $('.keyfield').attr('id');
			eKeyword = $('.keyword').val();
			
			employeePaging(1);
			
		});
		
	});//$(document).ready End
	
	function employeePaging(currentPageNo) {
		var totalCount =  0;		//총  수
		var countPerPage = 10;   //한 페이지당 보여주는 회원 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/listEmployeeAjax.do' 
			,
			data: {
				keyfield: eKeyfield ,
				keyword: eKeyword ,	
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
				for(var i=0;i<data.employees.length;i++) {
					text += "<tr>";
					text += "<td><a data-toggle='modal' data-target='#myModal'>"+ data.employees[i].empNo + "</a></td>";
					text += "<td>"+ data.employees[i].empName 		+ "</td>";
					text += "<td>"+ data.employees[i].duty 			+ "</td>";
					text += "<td>"+ data.employees[i].department 	+ "</td>";
					text += "<td>"+ data.employees[i].phoneNumber	+ "</td>";
					text += "<td>"+ data.employees[i].hireDate		+ "</td>";
					text += "<td>"+ data.employees[i].email			+ "</td>";
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
			} 
			,
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}	
		});
		
	} //end templatePaging function
	
	
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
			html += '<a class="page-link" aria-label="Previous" onclick = "employeePaging(' + (sPage - pageSize) + ')">'; 
		}
		html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
		
		for(var i=sPage; i<=ePage; i++) {
			if(currentPage == i) {
				html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
			} else {
				html += '<li class="page-item"><a class="page-link" onclick="employeePaging(' + i + ');">' + i + '</a></li>';
			}
		}				

		if (ePage >= pageTotalCnt) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Next">';
		} else {
			html += '<li class="page-item">';
			html += '<a class="page-link" aria-label="Next" onclick = "employeePaging(' + (ePage+1) + ')">';
		}
		html += '<span aria-hidden="true">&raquo;</span> </a></li>';
		html += '</ul>';
		
		$('#employeePaging').html(html);
	
	}//end of jqueryPager
	
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>사원관리</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>사원명부</h2>
							</div>
							<%-- <c:url var=registerEmployee value="/admin/registerEmployee.do" scope="page" /> --%>
							<button id="regisBtn" type="button" class="btn btn-primary" data-toggle="modal">
								등록하기
							</button>
						</div>
						<div class="col-md-3 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" type="button">
										<span class="keyfield">검색조건</span><span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a id="empNo" role="menuitem">사원번호</a>
										</li>
										<li>
											<a id="empName" role="menuitem">이름</a>
										</li>
										<li>
											<a id="duty" role="menuitem">직책</a>
										</li>
										<li>
											<a id="department" role="menuitem">부서</a>
										</li>
									</ul>
								</div>
								<input type="text" class="form-control keyword" placeholder="검색어">
								<span class="input-group-btn">
									<button class="btn btn-default" id="findEmployee" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>직책</th>
									<th>부서</th>
									<th>연락처</th>
									<th>입사일자</th>
									<th>이메일</th>
								</tr>
							</thead>
							<tbody>
								<%-- <c:forEach var="employee" items="${requestScope.employees }" varStatus="loop">
								<tr>
									<td><a data-toggle="modal" data-target="#myModal">${pageScope.employee.empNo}</a></td>
									<td>${pageScope.employee.empName}</td>
									<td>${pageScope.employee.duty}</td>
									<td>${pageScope.employee.department}</td>
									<td>${pageScope.employee.phoneNumber}</td>
									<td>${pageScope.employee.hireDate}</td>
									<td>${pageScope.employee.email}</td>
								</tr>
								</c:forEach> --%>
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation" id = 'employeePaging'>
				
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">사원 상세정보 및 수정</h4>
				</div>
				<div class="modal-body">
					<div>
						<div class="col-md-5 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img class="img-responsive avatar-view"
										src="images/picture.jpg" alt="Avatar"
										title="Change the avatar">
								</div>
							</div>
							<br> <input type="file" data-role="magic-overlay"
								data-target="#pictureBtn" data-edit="insertImage">
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img class="img-responsive avatar-view"
										src="images/picture.jpg" alt="Avatar"
										title="Change the avatar">
								</div>
							</div>
						</div>
						<br> <br> <br>
						<table id="datatable" class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th>사번</th>
									<td><input type="text" class="form-control"
										disabled="disabled" placeholder="2018-00001"></td>
									<th>직책</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">직책</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">사장</a></li>
															<li><a href="#its_equal">부사장</a></li>
															<li><a href="#greather_than">부장</a></li>
															<li><a href="#less_than">팀장</a></li>
															<li><a href="#greather">대리</a></li>
															<li><a href="#less">사원</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" class="form-control"
										required="required" value="김사원"></td>
									<th>영문이름</th>
									<td><input type="text" class="form-control"
										value="Kim Employee"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" class="form-control"
										required="required" value="010-2345-6789"></td>
									<th>주민번호</th>
									<td><input type="text" class="form-control"
										required="required" value="920815-1081614"></td>
								</tr>
								<tr>
									<th>부서</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">부서</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">경영관리부</a></li>
															<li><a href="#its_equal">인사부</a></li>
															<li><a href="#greather_than">회계부</a></li>
															<li><a href="#less_than">영업부</a></li>
															<li><a href="#greather">개발부</a></li>
														</ul>
													</div>
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">팀</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">영업1팀</a></li>
															<li><a href="#its_equal">영업2팀</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<%-- <div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept">팀</span> <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#contains">영업1팀</a></li>
															<li><a href="#its_equal">영업2팀</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div> --%></td>
									<th>이메일</th>
									<td><input type="text" class="form-control"
										required="required" value="java1234@naver.com"></td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><input type="text" class="form-control"
										required="required" value="2018/01/01"></td>
									<th>계좌번호</th>
									<td><input type="text" class="form-control"
										required="required" value="110-328-521548"></td>
								</tr>
								<tr>
									<th>퇴사일</th>
									<td><input type="text" class="form-control" value="X"></td>
									<th>퇴사여부</th>
									<td><input type="text" class="form-control"
										required="required" value="X"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="3"><input type="text" class="form-control"
										required="required" value="서울시 서초구 테헤란로"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="text-center">
							<button type="button" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>