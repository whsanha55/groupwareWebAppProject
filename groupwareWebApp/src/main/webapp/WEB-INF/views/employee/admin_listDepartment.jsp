<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�μ����</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	#modalBtn , .click {
		cursor: pointer;
	}
</style>
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
					swal("�˻������� �������ּ���.","", "error");
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
							text += '<td><a id="modalBtn" data-toggle="modal" data-target="#myModal">'+ data.departments[i].cName	 	 					+'</a></td>';
							text += '<td id="head'+ i +'"><a id="searchEmp'+ i +'" class="click" data-toggle="modal">'+ data.departments[i].headDept 	+'</a></td>';
							text += '<td>'+ data.departments[i].phoneNumber												+'</td>';
							text += '<td>'+ data.departments[i].memberCount 											+'</td>';
							text += '<td>'+ data.departments[i].teamCount 												+'</td>';
							text += '</tr>';
							
							$('#tbody1').on('click','#searchEmp' + i, function() {
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
						
						$('#tbody1').on('click','#modalBtn',function() {
					
							$.ajax ({
								url: '${pageContext.request.contextPath}/admin/deptMemberListAjax.do'
									,
								data: {
									cNo : $(this).parent().parent().find('td:nth-child(1)').text()
								}
								,
								type: 'POST' 
								,
								cache: false 
								,
								dataType: 'json' 
								,
								success: function (data) {
									var txt = "";
									for(var i = 0; i<data.length;i++) {
										txt += '<tr>';
										txt += '<td>' + data[i].empNo + '</td>';
										txt += '<td>' + data[i].empName + '</td>';
										txt += '<td>' + data[i].duty + '</td>';
										txt += '<td>' + data[i].hireDate + '</td>';
										txt += '<td>' + data[i].department + '</td>';
										txt += '</tr>';
									}
									$('#datatable2').find('#tbody2').html(txt);
								}
								,
								error: function(jqXHR) {
									alert("����: " + jqXHR.status);
								}
							});
						});
					}
					$('#datatable').find('#tbody1').html(text);
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
							<div class="col-xs-4 col-xs-offset-2  pull-right">
								<div class="input-group" style="margin-right:-35px;">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle" style="margin-right:3px;"
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
										class="form-control" id="keyword" name="x" placeholder="�˻���">
									<span class="input-group-btn">
										<button id="findDept" class="btn btn-default" type="button" style="margin-left:3px; height:34px;">
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
					<tbody id="tbody1">
			
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
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">�μ��� ������</h4>
				</div>
				<div class="modal-body">
					<div>
						<table id="datatable2" class="table table-striped table-bordered jambo_table" style="text-align:center;">
							<thead>
								<tr id="deptEmpListTR">
									<th class="text-center">���</th>
									<th class="text-center">�̸�</th>
									<th class="text-center">��å</th>
									<th class="text-center">�Ի���</th>
									<th class="text-center">�ҼӺμ�</th>
								</tr>
							</thead>
							<tbody id="tbody2">
								
							</tbody>
						</table>
						<br>
						<div class="text-center">
							<button id="closeBtn2" type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>