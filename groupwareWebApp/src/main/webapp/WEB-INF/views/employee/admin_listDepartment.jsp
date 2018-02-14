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
		var eKeyfield;				
		var eKeyword;
		
		$(document).ready(function() {
			
			employeePaging();
			
			$('.search-panel .dropdown-menu').on('click','a',function(e) {
				e.preventDefault();
				$('.keyfield').text($(this).text());
				$('.keyfield').attr('id',$(this).attr('id'));
			});
			
			$('#keyword').on('keydown', function(e) {
				if(e.keyCode == 13){
					$('#findDept').trigger('click');
		        }
			});
			
			$('#findDept').on('click', function() {
				if($('.keyfield').attr('id') == undefined) {
					alert("choose keyfield");
					return false;
				} else if($('#keyword').val() == "") {
					alert("enter keyword");
					return false;
				}
			
				eKeyfield = $('.keyfield').attr('id');
				eKeyword = $('#keyword').val();
				
				console.log(eKeyfield);
				console.log(eKeyword);
				
				employeePaging();
			}); 
				
				
			$('#modalCloseBtn').on('click',function() {
				$('#chartBody').html(""); 
			});
				
		});
		
		function employeePaging() {
		
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
					var oldHead;
					var checkCno;
					var checkChooseCno;
					
					var text = "";
					if(data.totalCount == 0) {
						text += '<tr>��ȸ�� �˻������ �����ϴ�</tr>';
					} else {
						for(var i=0;i<data.departments.length;i++) {
							text += '<tr>';
							text += '<td id="check'+ i +'">'+ data.departments[i].cNo		 									 			+'</td>';
							text += '<td>'+ data.departments[i].cName	 	 											+'</td>';
							text += '<td id="head'+ i +'"><a id="searchEmp'+ i +'" data-toggle="modal">'+ data.departments[i].headDept 	+'</td>';
							text += '<td>'+ data.departments[i].phoneNumber												+'</td>';
							text += '<td>'+ data.departments[i].memberCount 											+'</td>';
							text += '<td>'+ data.departments[i].teamCount 												+'</td>';
							text += '</tr>';
							
							$('tbody').on('click','#searchEmp' + i, function() {
								$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
								$('#layerpop').modal({
									backdrop: 'static', 
									keyboard: false
								});
								oldHead = $(this).text().split(" ")[1];
								checkCno = $(this).parent().parent().find('td:nth-child(1)').text();
							});
						}	
						$('#modalChooseBtn').on('click',function() {
							checkChooseCno = selectedDeptNo;

							if(checkChooseCno != checkCno) {
								alert("���� �μ��� ����� ���� ����ڷ� ���� �����մϴ�!");
								return false;
							}
							
							$.ajax ({
								url : "${pageContext.request.contextPath}/admin/deptListAjax.do",
								method : "POST",
								data : {
									oldHead : oldHead,
									newHead : selectedNameAndDuty.split(" ")[0]
								},
								dataType : 'json',
								success : function(data) {
									location.reload();
								},
								error : function(jqXHR) {
									alert("error : " + jqXHR.status);
								}
							});
						});
					}
					$('#datatable').find('tbody').html(text);	
				} 
				,
				error: function(jqXHR) {
					alert("����: " + jqXHR.status);
				}	
			});
			
			
		} //end templatePaging function
		
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
											<span class="keyfield">�˻�����</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a id="cNo">�μ��ڵ��ȣ</a></li>
											<li><a id="cName">�μ���</a></li>
											<li><a id="headDept">å����</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all"
										id="search_param"> <input type="text" 
										class="form-control" id="keyword" name="x" placeholder="Search term...">
									<span class="input-group-btn">
										<button id="findDept" class="btn btn-default" type="button">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
				<table id="datatable" class="table table-striped jambo_table bulk_action" style="text-align:center;">
					<thead>
						<tr>
							<th id="1" class="text-center">�μ��ڵ��ȣ</th>
							<th id="2" class="text-center">�μ���</th>
							<th id="3" class="text-center">���� �����</th>
							<th id="4" class="text-center">����� ����ó</th>
							<th id="5" class="text-center">�μ���</th>
							<th id="6" class="text-center">�μ��� �� ��</th>
						</tr>
					</thead>
					<tbody>
			
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