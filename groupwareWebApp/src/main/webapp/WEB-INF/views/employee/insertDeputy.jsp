<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ���</title>
<script>
	var eKeyfield;
	var eKeyword;
	
	$(document).ready(function () {		

		$('#deputyRegister').on('click','#pushBtn',function() {
			$('#myModal').modal('hide');
			$('#empName').val($('#deptHead').text());
			$('#dempNo').val($('#deptEmpNo').text());
		});
		
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
		
		//�˻�����
		$('.searchList1 .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
			console.log($(this).attr('id'));
		});
		
		//�˻����� ����Ű �������� Ʈ���� �ߵ�
		$('#keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('#findEmployee').trigger('click');
	        }
		});
		
		// �˻� ����
		$('#findEmployee').on('click', function() {
			if($('.keyfield').attr('id') == null) {
				swal("�˻����Ǹ� �������ּ���","", "error");
				return;
			}
	
			eKeyfield = $('.keyfield').attr('id');
			eKeyword = $('.keyword').val();
			console.log(eKeyfield);
			
			employeePaging(1);
		});
		
	});
	
	function employeePaging(currentPageNo) {
		var totalCount =  0;		//��  ��
		var countPerPage = 10;   //�� �������� �����ִ� ȸ�� ��
		var pageSize = 5;		//������ ����Ʈ�� �ԽõǴ� ������ ��
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
				
				//datatable���̺� �����ϱ�
				var text = "";
				for(var i=0;i<data.employees.length;i++) {
					text += '<tr id="pushBtn" class="even pointer">';
					text += '<td>'+ data.employees[i].department 			+'</td>';
					text += '<td id="deptEmpNo">'+ data.employees[i].empNo	+'</td>';
					text += '<td id="deptHead">'+ data.employees[i].empName +'</td>';
					text += '<td>'+ data.employees[i].duty 					+'</td>';
					text += '</tr>';
				}
				$('#deputyRegister').find('tbody').html(text);

				//����¡ ó��
				jqueryPager({
					countPerPage : countPerPage,
					pageSize : pageSize,
					currentPageNo : currentPageNo,
					totalCount : totalCount
				});		
			} 
			,
			error: function(jqXHR) {
				alert("����: " + jqXHR.status);
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
				<h2>������ ����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
						action="${pageContext.request.contextPath }/registerDeputy.do" method="POST">
					<div class="form-group form-inline">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="empName">������ ���� :</label>&nbsp;&nbsp;
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="dempNo" name="dempNo" value="" >
							<input type="hidden" id="empNo" name="empNo" value="${requestScope.empNo }"/>
							<input type="text" id="empName" name="empName" class="form-control" readonly><span class="input-group-btn">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#myModal">�˻�</button>
							</span>
						</div>
					</div>
					<div class="form-group form-inline col-md-12">
						<div class="form-group">
							<label for="ex3">�Ⱓ���� :</label> <input type="date" id="startDate"
								class="form-control" name="startDate">
						</div>
						<div class="form-group">
							<label for="ex4">~</label> <input type="date" id="endDate"
								class="form-control" name="endDate">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="depReason">���� :</label>
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
					<table id="datatable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>���</th>
								<th>�̸�</th>
								<th>������</th>
								<th>������</th>
								<th>����</th>
								<th>���࿩��</th>
								<th>�󼼺���</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="deputy" items="${requestScope.deputies}" varStatus="loop">
								<c:forEach var="employee" items="${pageScope.deputy.employees }">
								<tr>
									<td>${pageScope.deputy.dempNo }</td>
									<td>${pageScope.employee.empName }</td>
									<td>${pageScope.deputy.startDate }</td>
									<td>${pageScope.deputy.endDate }</td>
									<td>${pageScope.deputy.depReason }</td>
									<td>${pageScope.deputy.progression }</td>
									<td><button type="button">�󼼺���</button></td>
								</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">������ ����</h4>
					�غμ��� �̸�, �Ⱓ�� �������ּ���.
				</div>
				<div class="modal-body">
					<div>
						<div class="btn-group searchList1">
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" id="keyfieldBtn" type="button"
								aria-expanded="true"><span class='keyfield'>�μ�</span><span class="caret"></span>
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
									<th class="column-title">�μ�</th>
									<th class="column-title">���</th>
									<th class="column-title">�̸�</th>
									<th class="column-title">��å</th>
								</tr>
							</thead>
							<tbody>
								<%-- <tr id="pushBtn" class="even pointer">
									<td>������</td>
									<td class=" ">����</td>
									<td id="deptHead" class=" ">������</td>
								</tr> --%>
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation" id='employeePaging'>
				
					</nav>
					<br>
					<div class="text-center">
						<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>