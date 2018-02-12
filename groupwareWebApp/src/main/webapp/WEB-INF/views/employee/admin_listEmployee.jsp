<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	var eKeyfield;
	var eKeyword;
	$(document).ready(function() {
	
		employeePaging(1); //���� �ε�� ����¡ ����Ƥ�������
		
		$('#regisBtn').click(function(){
			location.href="${pageContext.request.contextPath}/admin/registerEmployee.do";
		});

		//�˻�����
		$('#search-panel .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
		});
		
		//�˻����� ����Ű �������� Ʈ���� �ߵ�
		$('.keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('#findEmployee').trigger('click');
	        }
		});
		
		
		// �˻� ����
		$('#findEmployee').on('click', function() {
			if($('.keyfield').attr('id') == "") {
				swal("�˻����Ǹ� �������ּ���");
				return;
			}
	
			eKeyfield = $('.keyfield').attr('id');
			
			if($('.keyword').val() == '���') {
				eKeyword = '0';
			} else if($('.keyword').val() == '����') {
				eKeyword = '1';
			} else {
				eKeyword = $('.keyword').val();
			}
				
			employeePaging(1);
			
		});
		
		$('#dutyBtnList li > a').on('click', function() {
		    $('#dutyBtn').text($(this).text());
		    $('input[name=dutyCode]').val($(this).attr('value'));
		});
		
		$('#deptBtnList li > a').on('click', function() {	
			$('#deptBtn').text($(this).text());
		    $('input[name=deptCode]').val($(this).attr('value'));		    
		    
			$.ajax ({
				url: "${pageContext.request.contextPath}/admin/checkRelation.do"
				,
				method: 'POST'
				,
				data: {
					deptCode: $('input[name=deptCode]').val()
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					var text = "";					
					
					if(data.length != 0) {
						text += '<div class="input-group-btn search-panel">';
						text += '<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" id="teamBtn" type="button" aria-expanded="false">��';
						text += '<span class="caret"></span></button>';					
						text += '<ul id="teamBtnList" role="menu" class="dropdown-menu teambtn" aria-labelledby="d2Label">';
						
						for (var i = 0; i<data.length; i++) {
							text += '<li role="presentation">';
							text += '<a role="menuitem" href="#" value="'+ data[i].cNo +'">'+ data[i].cName +'</a>';
							text += '</li>';
						}
						
						text += '</ul>';
						text += '</div>';
						$('#deptDiv').after(text);						
					} else {
						return false;
					}
				}
				,
				error: function(jqXHR) {
					alert('error : ' + jqXHR.status);
				}
			});
		});
		
		$("#inputDeptDiv").on('click','#teamBtnList li > a', function () {
			$("#teamBtn").text($(this).text());
			$('input[name=deptCode]').val($(this).attr('value'));
		});
		
		$()
		
		$('#modifyBtn').click(function () {
			if($('#modRetireStatus').val()=='X') {
				$('#modRetireStatus').val('1');	
			} else {
				$('#modRetireStatus').val('0');	
			}
			/* $.ajax ({
				url:'${pageContext.request.contextPath}/admin/modifyEmployee.do'
				,
				method:'POST'
				,
				data: $('#modalForm').serialize()
				,
				dataType:'json'
				,
				success: function(data) {
					if(data==0) {
					swal({
						title : "��������� �����մϴ�.",
						text : "��� �����Ͻðڽ��ϱ�?",
						icon : "info",
						buttons : ["���", "Ȯ��"] 
					}).then((e) => {
					     if(e) {
						     swal("������ �Ϸ�Ǿ����ϴ�!", {
						    	 icon : "success"						    	
						     });
					     } else {
					    	 swal("��ҵǾ����ϴ�.");							
						 }
					});
						employeePaging(1);
						$('#myModal').modal('hide');
					}
					
				}
				,
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
					
			}); */
		}); 
		
		$("#retireBtn").click(function() {
			$.ajax ({
				url : '${pageContext.request.contextPath}/admin/retireEmployee.do',
				method : 'POST',
				data : {
					empNo : $('#modifyEmpNo').val()
				},
				dateType : 'json',
				success : function(data) {
					$('#modRetireStatus').val(data.retireStatus);
					$('#modRetireDate').val(data.retireDate);
					$('#myModal').modal('hide');
					location.reload();
				},
				error : function(jqXHR) {
					alert("error : " + jqXHR.status);
				}				
			});
		});
		
		$("#upload-image").on("change", handleImgFileSelect);
	
		$("#findpostcode").click(execDaumPostcode);
		
	});//$(document).ready End
	
	function execDaumPostcode() {
		
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('modpostcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('modAddress').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('moddetailAddress').focus();
                
                close();
            }
        		
        }).open();
    }
	
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("Ȯ���ڴ� �̹��� Ȯ���ڸ� �����մϴ�.");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#photo").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	function employeePaging(currentPageNo) {
		var totalCount =  0;		//��  ��
		var countPerPage = 10;   //�� �������� �����ִ� ȸ�� ��
		var pageSize = 5;		//������ ����Ʈ�� �ԽõǴ� ������ ��
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
				
				//datatable���̺� �����ϱ�
				var text = "";
				if(totalCount == 0) {
					text += '<tr><td>��ȸ�� �˻������ �����ϴ�<td></tr>';
				} else {
					for(var i=0;i<data.employees.length;i++) {
						text += "<tr>";
						text += "<input id='submitPhotoName' type='hidden' value='"+ data.employees[i].systemPhotoName +"'>";
						text += "<input id='submitSignName' type='hidden' value='"+ data.employees[i].systemSignName +"'>";
						text += "<td id='submitEmpNo'"+ i +"><a data-toggle='modal' data-target='#myModal'>"+ data.employees[i].empNo + "</a></td>";
						text += "<td id='submitEmpName'"+ i +">"+ data.employees[i].empName 		+ "</td>";
						text += "<input id='submitEngName' type='hidden' value='"+ data.employees[i].engName +"'>";
						text += "<input id='submitDeptNo' type='hidden' value='"+ data.employees[i].deptNo +"'>";
						text += "<td id='submitDuty'"+ i +">"+ data.employees[i].duty 			+ "</td>";
						text += "<input id='submitDutyNo' type='hidden' value='"+ data.employees[i].dutyNo +"'>";
						text += "<td id='submitDept'"+ i +">"+ data.employees[i].department 	+ "</td>";
						text += "<td id='submitPhoneNumber'"+ i +">"+ data.employees[i].phoneNumber	+ "</td>";
						text += "<input id='submitRegNumber' type='hidden' value='"+ data.employees[i].regNumber +"'>";
						text += "<td id='submitHireDate'"+ i +">"+ data.employees[i].hireDate		+ "</td>";
						text += "<td id='submitEmail'"+ i +">"+ data.employees[i].email			+ "</td>";
						if(data.employees[i].retireStatus == 0) {
							text += "<td id='submitRetireStatus"+ i +"'>���</td>";
						} else {
							text += "<td id='submitRetireStatus"+ i +"'>����</td>";
						}
						text += "<input id='submitRetireDate' type='hidden' value='"+ data.employees[i].retireDate +"'>";
						text += "<input id='submitpostcode' type='hidden' value='"+ data.employees[i].postcode +"'>";
						text += "<input id='submitAddress' type='hidden' value='"+ data.employees[i].address +"'>";
						text += "<input id='submitdetailAddress' type='hidden' value='"+ data.employees[i].detailAddress +"'>";
						text += "</tr>";
						
						
						$('#datatable').on('click','#submitEmpNo', function(){
							$('#photo').attr('src','${pageContext.request.contextPath }/resources/upload/employeeFiles/photos/' + ($(this).parent().children('#submitPhotoName').val()));
							$('#sign').attr('src','${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/' + ($(this).parent().children('#submitSignName').val()));
							$('#modifyEmpNo').val($(this).text());
							$('#modEmpName').val($(this).next('#submitEmpName').text());							
							$('#modEngName').val($(this).parent().children('#submitEngName').val());
							$('input[name=dutyCode]').val($(this).parent().children('#submitDutyNo').val());
							$('.preDuty').text($(this).nextAll('#submitDuty').text());
							$('input[name=deptCode]').val($(this).parent().children('#submitDeptNo').val());
							$('.preDept').text($(this).nextAll('#submitDept').text());
							$('#modPhoneNumber').val($(this).nextAll('#submitPhoneNumber').text());
							$('#modRegNumber').val($(this).nextAll('#submitRegNumber').val());
							$('#modEmail').val($(this).nextAll('#submitEmail').text());
							$('#modHireDate').val($(this).nextAll('#submitHireDate').text());
							if($(this).nextAll('#submitRetireStatus').text() == '���') {
								$('#modRetireStatus').val('���');
								$('#modRetireDate').val($(this).nextAll('#submitRetireDate').val());
							} else {
								$('#modRetireStatus').val('����');
								$('#modRetireDate').val("");
							}
							$('#modpostcode').val($(this).parent().children('#submitpostcode').val());
							$('#modAddress').val($(this).parent().children('#submitAddress').val());	
							$('#moddetailAddress').val($(this).parent().children('#submitdetailAddress').val());
						})
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
				<h2>�������</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>������</h2>
							</div>
							<%-- <c:url var=registerEmployee value="/admin/registerEmployee.do" scope="page" /> --%>
							<button id="regisBtn" type="button" class="btn btn-primary" data-toggle="modal">
								����ϱ�
							</button>
						</div>
						<div class="col-md-3 col-xs-offset-2">
							<div class="input-group">
								<div id="search-panel" class="input-group-btn search-panel">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" type="button">
										<span class="keyfield">�˻�����</span><span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a id="empNo" role="menuitem">�����ȣ</a>
										</li>
										<li>
											<a id="empName" role="menuitem">�̸�</a>
										</li>
										<li>
											<a id="duty" role="menuitem">��å</a>
										</li>
										<li>
											<a id="department" role="menuitem">�μ�</a>
										</li>
										<li>
											<a id="retireStatus" role="menuitem">��翩��</a>
										</li>
									</ul>
								</div>
								<input type="text" class="form-control keyword" placeholder="�˻���">
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
									<th>���</th>
									<th>�̸�</th>
									<th>��å</th>
									<th>�μ�</th>
									<th>����ó</th>
									<th>�Ի�����</th>
									<th>�̸���</th>
									<th>��翩��</th>
								</tr>
							</thead>
							<tbody>
								
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
		<form id="modalForm" action="${pageContext.request.contextPath }/admin/modifyEmployee.do"
				enctype="multipart/form-data" method="POST">
		<input type="hidden" name="dutyCode" value="">
		<input type="hidden" name="deptCode" value="">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">��� ������ �� ����</h4>
				</div>
				<div class="modal-body">
					<div>
						<div class="col-md-5 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img id="photo" width="250px" height="250px" 
									src="" class="img-responsive center-block"/>
								</div>
							</div>
							<br> <input id="upload-image" name="upload"
								type="file" data-role="magic-overlay" data-target="#pictureBtn"
								data-edit="insertImage">
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img id="sign" width="250px" height="250px" 
									src="" class="img-responsive center-block"/>
								</div>
							</div>
						</div>
						<br> <br> <br>
						<table id="datatable" class="table table-striped table-bordered">
							<tbody>
								<tr>
									<th>���</th>
									<td><input id="modifyEmpNo" name="empNo" type="text" class="form-control"
										readonly readonly value=""></td>
									<th>��å</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button id="dutyBtn" type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept" class="preDuty">��å</span><span class="caret"></span>
														</button>
														<ul id="dutyBtnList" class="dropdown-menu" role="menu">
															<c:forEach var="dutyCode" items="${requestScope.dutyCodes }" varStatus="loop">
																<li role="presentation">
																	<a role="menuitem" tabindex="-1" href="#" value="${pageScope.dutyCode.cNo }">${pageScope.dutyCode.cName }</a>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
								<tr>
									<th>�̸�</th>
									<td><input id="modEmpName" name="empName" type="text" class="form-control"
										required="required" value="" readonly></td>
									<th>�����̸�</th>
									<td><input id="modEngName" name="engName" type="text" class="form-control"
										value="" readonly></td>
								</tr>
								<tr>
									<th>����ó</th>
									<td><input id="modPhoneNumber" name="phoneNumber" type="text" class="form-control"
										required="required" value="" readonly></td>
									<th>�ֹι�ȣ</th>
									<td><input id="modRegNumber" name="regNumber" type="text" class="form-control"
										required="required" value="" readonly></td>
								</tr>
								<tr>
									<th>�μ�</th>
									<td><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div id="inputDeptDiv" class="input-group">
													<div id="deptDiv" class="input-group-btn search-panel">
														<button id="deptBtn" type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept" class="preDept">�μ�</span> <span class="caret"></span>
														</button>
														<ul id="deptBtnList" class="dropdown-menu" role="menu">
															<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
																<li role="presentation">
																	<a role="menuitem" href="#" value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</a>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
									<th>�̸���</th>
									<td><input id="modEmail" name="email" type="text" class="form-control"
										required="required" value="" readonly></td>
								</tr>
								<tr>
									<th>�Ի���</th>
									<td><input id="modHireDate" name="hireDate" type="text" class="form-control"
										required="required" value="" readonly></td>
									<th>���¹�ȣ</th>
									<td><input id="modnull" type="text" class="form-control"
										required="required" value="110-328-521548" readonly></td>
								</tr>
								<tr>
									<th>��翩��</th>
									<td><input id="modRetireStatus" name="retireStatus" type="text" class="form-control"
										required="required" readonly value=""></td>
									<th>�����</th>
									<td><input id="modRetireDate" name="retireDate" type="text" class="form-control" value="" readonly></td>
								</tr>
								<tr>
									<th>�ּ�</th>
									<td colspan="3">
									<div class="col-md-6 col-sm-6 col-xs-6">
										<input type="text" id="modpostcode" name="postcode" placeholder="�����ȣ" readonly
												required="required" class="form-control col-sm-6 col-xs-6">
									</div>
									<button type="button" id="findpostcode" class="btn btn-success">�����ȣ ã��</button><br>
									<div class="col-md-12 col-sm-6 col-xs-12">
										<input type="text" id="modAddress" name="address" placeholder="�ּ�" readonly
												required="required" class="form-control col-md-7 col-xs-12">
									</div><br>
									<div class="col-md-12 col-sm-6 col-xs-12">
										<input type="text" id="moddetailAddress" name="detailAddress" placeholder="���ּ�"
												required="required" class="form-control col-md-7 col-xs-12" readonly>
									</div>
								</tr>
							</tbody>
						</table> 
						
						<br>
						<div class="text-center">
							<button id="modifyBtn" type="submit" class="btn btn-primary">����</button>
							<button id="retireBtn" type="button" class="btn btn-primary retire">���</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">�ݱ�</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
</html>