<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대결권자 등록</title>

<script>
	var eKeyfield;
	var eKeyword;
	
	$(document).ready(function () {		

		employeePaging1(1);
		
		
		
		/* $('#submitBtn').submit(function() {
			var dempNo = $('#dempNo').attr('value'); 
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var depReason = $('#depReason').val();
			
			$.ajax ({
				url: '${pageContext.request.contextPath}/registerDeputy.do'
				,
				method: 'POST'
				,
				data: {
					dempNo: $('#dempNo').attr('value'),
					startDate: $('#startDate').val(),
					endDate: $('#endDate').val(),
					depReason: $('#depReason').val(),
					empNo: '2018-00018'
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					console.log(dempNo);
					console.log(startDate);
					console.log(endDate);
					console.log(depReason);
					if(data == 1) {
						location.href="${pageContext.request.contextPath}/registerDeputy.do";
					} else {
						return false;
					}
				}
				,
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
				
			}); 
		});*/
		
		//검색조건
		/* $('.searchList1 .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
			console.log($(this).attr('id'));
		}); */
		$('.searchList2 .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield1').text($(this).text());
			$('.keyfield1').attr('id',$(this).attr('id'));
			console.log($(this).attr('id'));
		});
		
		
		//검색조건 엔터키 눌렀을때 트리거 발동
		/* $('#keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('#findEmployee').trigger('click');
	        }
		}); */
		$('#keyword1').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('#findEmployee1').trigger('click');
	        }
		});
		
		// 검색 실행
		/* $('#findEmployee').on('click', function() {
			if($('.keyfield').attr('id') == undefined) {
				alert("choose keyfield");
				return false;
			} else if($('.keyword').val() == "") {
				alert("enter keyword");
				return false;
			}
	
			eKeyfield = $('.keyfield').attr('id');
			eKeyword = $('.keyword').val();
			
			employeePaging(1);
		}); */
		$('#findEmployee1').on('click', function() {
			if($('.keyfield1').attr('id') == undefined) {
				alert("choose keyfield");
				return false;
			} else if($('.keyword1').val() == "") {
				alert("enter keyword");
				return false;
			}
	
			eKeyfield = $('.keyfield1').attr('id');
			eKeyword = $('.keyword1').val();

			employeePaging1(1);
		});
		
		$('#searchEmp').click(function() {
			$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
			$('#layerpop').modal({
				backdrop: 'static', 
				keyboard: false
			});
		});
		
		$('#modalCloseBtn').on('click',function() {
			$('#chartBody').html("");
			 
		});
		
	});
	
	/* function employeePaging(currentPageNo) {
		var totalCount =  0;		//총  수
		var countPerPage = 10;   //한 페이지당 보여주는 회원 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		
		$.ajax({
			url: '${pageContext.request.contextPath}/deputyRegisterSearchAjax.do' 
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
				if(totalCount == 0) {
					text += '<tr><td>조회된 검색결과가 없습니다<td></tr>';
				} else {
					for(var i=0;i<data.employees.length;i++) {
						text += '<tr id="pushBtn'+ i +'" class="even pointer">';
						text += '<td>'+ data.employees[i].department 			+'</td>';
						text += '<td id="deptEmpNo'+ i +'">'+ data.employees[i].empNo	+'</td>';
						text += '<td id="deptHead'+ i +'">'+ data.employees[i].empName +'</td>';
						text += '<td>'+ data.employees[i].duty 					+'</td>';
						text += '</tr>';
						
						$('#deputyRegister').on('click','#pushBtn' + i ,function() {
							alert('hi');
							$('#myModal').modal('hide');
							$('#dempNo').val($(this).find('td:nth-child(2)').text());
							$('#empName').val($(this).find('td:nth-child(3)').text());
						});
					}
				}
				$('#deputyRegister').find('tbody').html(text);
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
	} //end of jqueryPager */
		
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
						text += '<tr><td>조회된 검색결과가 없습니다<td></tr>';
					} else {
						for(var i=0;i<data.deputies.length;i++) {
							for(var j=0;j<data.deputies[i].employees.length;j++) {
								text += "<tr>";	
								text += "<td>"+ data.deputies[i].dempNo +"</td>";
								text += "<td>"+ data.deputies[i].employees[j].duty +"</td>";
								text += "<td>"+ data.deputies[i].employees[j].empName; + "</td>";
								text += "<td>"+ data.deputies[i].startDate +"</td>";
								text += "<td>"+ data.deputies[i].endDate +"</td>";
								text += "<td>"+ data.deputies[i].progression +"</td>";
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
			html += '</ul>';
			
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
					<div class="form-group form-inline col-md-12">
						<div class="form-group">
							<label for="ex3">기간지정 :</label> <input type="date" id="startDate"
								class="form-control" name="startDate">
						</div>
						<div class="form-group">
							<label for="ex4">~</label> <input type="date" id="endDate"
								class="form-control" name="endDate">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="depReason">사유 :</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="depReason" name="depReason"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button id="submitBtn" type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
					
					<div class="ln_solid"></div>
					
					<div class="col-md-3">
						<div class="input-group">
							<div class="input-group-btn searchList2">
								<button class="btn btn-default dropdown-toggle"
									data-toggle="dropdown" type="button">
									<span class="keyfield1">검색조건</span><span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a id="dempNo" role="menuitem">사원번호</a>
									</li>
									<li>
										<a id="duty" role="menuitem">직책</a>
									</li>
									<li>
										<a id="empName" role="menuitem">이름</a>
									</li>
									<li>
										<a id="startDate" role="menuitem">시작일</a>
									</li>
									<li>
										<a id="endDate" role="menuitem">종료일</a>
									</li>
								</ul>
							</div>
							<input type="keyword1" class="form-control keyword1" placeholder="검색어">
							<span class="input-group-btn">
								<button class="btn btn-default" id="findEmployee1" type="button">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
						
					<table id="datatable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>사번</th>
								<th>직책</th>
								<th>이름</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>진행여부</th>
							</tr>
						</thead>
						<tbody id="tbody">
							
						</tbody>
					</table>
					<nav aria-label="Page navigation" id='employeePaging1'>
				
					</nav>
				</form>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
							
				<div class="modal-body" id="chartBody"></div>
							
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalCloseBtn"
							data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
<%-- 	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">대결권자 지정</h4>
					※부서와 이름, 기간을 지정해주세요.
				</div>
				<div class="modal-body">
					<div>
						<div class="btn-group searchList1">
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" id="keyfieldBtn" type="button"
								aria-expanded="false"><span class='keyfield'>부서</span><span class="caret"></span>
							</button>
							<ul id="keyfieldItem" role="menu" class="dropdown-menu" aria-labelledby="searchType">
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<li>
									<a role="menuitem" id="${pageScope.deptCode.cName }">${pageScope.deptCode.cName }</a>
								</li>
							</c:forEach>
							</ul>
							
							<div class="col-sm-6">
								<div id="imaginary_container">
									<div class="input-group stylish-input-group">
										<input id="keyword" type="text" class="form-control keyword" placeholder="Search">
										<span class="input-group-addon" style="padding: 3px 10px">
											<button class="btn btn-default" type="button" id="findEmployee">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<table id="deputyRegister" class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">
									<th class="column-title">부서</th>
									<th class="column-title">사번</th>
									<th class="column-title">이름</th>
									<th class="column-title">직책</th>
								</tr>
							</thead>
							<tbody>
								<tr id="pushBtn" class="even pointer">
									<td>영업부</td>
									<td class=" ">부장</td>
									<td id="deptHead" class=" ">영부장</td>
								</tr>
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation" id='employeePaging'>
				
					</nav>
					<br>
					<div class="text-center">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div> --%>
</body>
</html>