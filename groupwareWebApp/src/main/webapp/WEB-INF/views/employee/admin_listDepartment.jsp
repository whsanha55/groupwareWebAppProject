<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�μ����</title>
	<script>
					
		$(document).ready(function() {
		/* 	
			$('.searchList1 .dropdown-menu').on('click','a',function(e) {
				e.preventDefault();
				$('.keyfield').text($(this).text());
				$('.keyfield').attr('id',$(this).attr('id'));
				console.log($(this).attr('id'));
			});
			
			$('#keyword').on('keydown', function(e) {
				if(e.keyCode == 13){
					$('#findEmployee').trigger('click');
		        }
			});
			
			$('#findEmployee').on('click', function() {
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
			});  */
				
			$('#searchEmp').click(function() {
				$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
				$('#layerpop').modal({
					backdrop: 'static', 
					keyboard: false
				});
			});
				
			$('#modalChooseBtn').on('click',function() {
				$.ajax ({
					url : "${pageContext.request.contextPath}/admin/deptListAjax.do",
					method : "POST",
					data : {
						oldHead : oldHead,
						newHead : newHead
					},
					dataType : 'json',
					success : function(data) {
						
					},
					error : function(jqXHR) {
						alert("error : " + jqXHR.status);
					}
				});
			});
				
			$('#modalCloseBtn').on('click',function() {
				$('#chartBody').html(""); 
			});
				
		});
		
		/* function employeePaging(currentPageNo) {
		
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/departmentListSearchAjax.do'
				,
				data: {
					keyfield: eKeyfield ,
					keyword: eKeyword
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
					if(totalCount == 0) {
						text += '<tr><td>��ȸ�� �˻������ �����ϴ�<td></tr>';
					} else {
						for(var i=0;i<data.employees.length;i++) {
							text += '<tr id="pushBtn'+ i +'" class="even pointer">';
							text += '<td>'+ data.employees[i].department 			+'</td>';
							text += '<td id="deptEmpNo'+ i +'">'+ data.employees[i].empNo	+'</td>';
							text += '<td id="deptHead'+ i +'">'+ data.employees[i].empName +'</td>';
							text += '<td>'+ data.employees[i].duty 					+'</td>';
							text += '</tr>';
							
						}
					}
					$('#datatable').find('tbody').html(text);
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
			
		} //end templatePaging function */
		
	</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>�μ�����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-6">
							<div class="col-md-2">
								<h2>�μ����</h2>
							</div>
						</div>
						<div>
							<div class="col-xs-4 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span id="search_concept">�˻�</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">�μ��ڵ��ȣ</a></li>
											<li><a href="#">�μ���</a></li>
											<li><a href="#">å����</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all"
										id="search_param"> <input type="text"
										class="form-control" name="x" placeholder="Search term...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
				<table id="datatable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>�μ��ڵ��ȣ</th>
							<th>�μ���</th>
							<th>���� �����</th>
							<th>����� ����ó</th>
							<th>�μ���</th>
							<th>�μ��� �� ��</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="department" items="${requestScope.departments }" varStatus="loop">
							<tr>
								<td>${pageScope.department.cNo }</td>
								<td>${pageScope.department.cName }</td>
								<td><a id="searchEmp" data-toggle='modal'>${pageScope.department.headDept }</a></td>
								<td>${pageScope.department.phoneNumber }</td>
								<td>${pageScope.department.memberCount }</td>
								<td>${pageScope.department.teamCount }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
							
				<div class="modal-body" id="chartBody"></div>
							
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="modalChooseBtn"
							data-dismiss="modal">����</button>
					<button type="button" class="btn btn-default" id="modalCloseBtn"
							data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>