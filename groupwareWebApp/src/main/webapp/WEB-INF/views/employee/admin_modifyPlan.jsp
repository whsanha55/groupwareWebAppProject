<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var eKeyfield;
var eKeyword;

$(document).ready(function () {		
	$('#something').click(function() {
		location.reload();
		});
	
	
	//���� ���� 
	$('#deleteBtn').on('click', function() {	
		var fileNo = $(this).val();
		
		swal({
			  title: "���� ����",
			  text: "������ �����մϴ�. ��� �����Ͻðڽ��ϱ�?",
			  icon: "info",
			  buttons : true 
		}).then((e) => {
		     if(e) {
		    	 deletePlanFile(fileNo);		
			 }
		});		
		
		alert($(this).val());
		function deletePlanFile(fileNo) {	
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/removePlanFile.do'
				,
				method: 'GET'
				,
				data: {fileNo}
				, 
				async: true
				,
				cache: false
				,
				success: function(data) {
					swal({
						  title: "���� �Ϸ�",
						  text: "�����Ͻ� ������ �����Ǿ����ϴ�.",
						  icon: "info",
						  buttons : "Ȯ��" 
					}).then((e) => {
					     if(e) {
					    	 location.reload();		
						 }
					});		
				}
				, 
				error: function(jqXHR) {
					alert('Error : ' + jqXHR.status);
				}	 			
				
			});	
		}
	});	 
	
	
	//�˻�
	$('#rspbRegister').on('click','#pushBtn',function() {
		$('#myModal').modal('hide');
		$('#empName').val($('#deptHead').text());
		$('#rspbNo').val($('#deptEmpNo').text());
	});
	
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
			$('#rspbRegister').find('tbody').html(text);

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
					<h2>��������</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br>
					<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
							action="${pageContext.request.contextPath }/admin/modifyPlan.do" method="post"
							enctype="multipart/form-data">
						<input type="hidden" name="pNo" value="${requestScope.plan.pNo }">
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >��������</label>&nbsp;&nbsp;
							<select id="p_Class" name="pClass" style="width:100px;height:30px;" value="${requestScope.plan.pClass }" >
							<option value="1">ȸ��</option>
							<option value="2">����</option>
							<option value="3">��Ÿ</option>
							</select>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >�μ�</label>&nbsp;&nbsp;
							<select id="deptNo" name="deptNo" style="width:100px;height:30px;" value="${requestScope.plan.cName }">
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</option>
							</c:forEach>
							</select>
						</div>
						
						
						<br>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >����</label>&nbsp;&nbsp;
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" name="pTitle" class="form-control" placeholder="������ �Է����ּ���."
										style="width:1000px;" value="${requestScope.plan.pTitle }">
							</div>
						</div>
						
						<div class="form-group">
							<!-- <label class="control-label col-md-1 col-sm-3 col-xs-12" >�ݺ�����</label>
							<div class="form-group">
								&nbsp;&nbsp;
								����:<input type="radio" class="flat" name="gender" id="genderM" value="M" checked="" required="">
								&nbsp;&nbsp;
								�ݺ�: <input type="radio" class="flat" name="gender" id="genderF" value="F">
							</div> -->
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >�Ⱓ</label>&nbsp;&nbsp;
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<fieldset>
									<div class="btn-group">
										<div class="controls">
											<div class="input-prepend input-group col-md-6 col-sm-6 col-xs-12">
												<span class="add-on input-group-addon"><i
													class="glyphicon glyphicon-calendar fa fa-calendar"></i></span> <input
													type="datetime-local" name="startDate" id="startDate"
													class="form-control" required="required" value="${requestScope.plan.startDate }">
											</div>
										</div>
									</div>
									<div class="btn-group">
										<div class="controls">
											<div class="input-prepend input-group col-md-6 col-sm-6 col-xs-12">
												<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
												<input type="datetime-local" name="endDate" id="endDate" 
														class="form-control" required="required" value="to_date(${requestScope.plan.startDate }, 'YYYY-MM-DD"T"HH24:mi:ss')">
											</div>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						
		
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >���</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="latitude" name="latitude"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:100px;" value="${requestScope.plan.latitude }">
								<input type="text" id="longitude" name="longitude"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:100px;" value="${requestScope.plan.longitude }">
							</div>
							<button type="button" class="btn btn-success">�ּ�ã��</button>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >����</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="pContent" name="pContent"
									required="required" class="form-control col-md-10 col-xs-12" 
									style="width:1000px;height:100px;" value="${requestScope.plan.pContent }">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">÷������</label>&nbsp;&nbsp;
								<c:forEach var="file" items="${requestScope.plan.files }" varStatus="loop">
									<c:url var="deleteUrl" value="/admin/removePlanFile.do" scope="page" >
										<c:param name="fileNo" value="${pageScope.file.fileNo }" />
									</c:url>
									${pageScope.file.fileName }
									<button type="button" value="${pageScope.file.fileNo }" id="deleteBtn" class="btn btn-primary" >����</button>
								</c:forEach>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12"></label>
							<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
								<i class="fa fa-picture-o"></i></a>
								<input name="upload" type="file" data-role="magic-overlay" data-target="#fileBtn"
										data-edit="insertImage">
							</div>
						</div>
						



						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">�߿䵵</label>
								<div class="form-group">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="pImpt" id="pImpt" value="1" checked="" required="">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="pImpt" id="pImpt" value="2">
									&nbsp;&nbsp;
									��: <input type="radio" class="flat" name="pImpt" id="pImpt" value="3">
								</div>
							</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" for="empName">����� ����</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="hidden" id="rspbNo" name="rspbNo"
									required="required" class="form-control col-md-10 col-xs-12" value="">
								<input type="text" id="empName" name="empName" class="form-control" readonly value="${requestScope.plan.empName }">
								<span class="input-group-btn">
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">�˻�</button>
						</div>


						<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<c:url var="detailURL" value="/admin/detailPlan.do" scope="page" >
										<c:param name="pNo" value="${requestScope.plan.pNo }" />
									</c:url>
									<a id="modify" href="${pageScope.detailURL }"  ><button class="btn btn-primary" type="button">�ڷΰ���</button></a>
									<button type="submit" class="btn btn-success">����</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- ��� �˾� -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">����� ����</h4>
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
						<table id="rspbRegister" class="table table-striped jambo_table bulk_action">
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
	</form>
</body>
</html>