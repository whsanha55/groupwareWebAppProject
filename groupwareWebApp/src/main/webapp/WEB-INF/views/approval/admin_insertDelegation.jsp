<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������</title>
<style>
#insertDeleg {
	text-align: center;
}
#datatable tr td:last-child {
	padding:0px;
}

input {height:34px !important;}
	
#delegationTmp {
	width : 140px;
}
</style>
<script>
var pKeyfield;  
var pKeyword;


$(document).ready(function(){
	
	templatePaging(1);//���ʷε�� ������ó��
	
	//��з� (��ļ� ī�װ�) ���� �̺�Ʈ
	$('#categorySelect').on('change',function() {
		var categoryNo = $(this).val();
		if(categoryNo==0) {	//��з� ���ù�ư
			$('#delegationTmp').html('<option value="0">��ļ� ����</option>');
			return;
		}
		if(categoryNo =='all'){	//��ü ��ȸ
			categoryNo = 0;
		}
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/retrieveTemplateList.do' ,
			method: 'POST' ,
			data: {
				categoryNo : categoryNo
			},
			dataType: 'json'
			,
			success: function(data) {
				var text = '<option value="0">��ļ� ����</option>';
				for(var i=0; i<data.length;i++) {
					text += '<option value="' + data[i].tmpNo +'">';
					text += data[i].tmpName;
					text += '</option>';
				}
				$('#delegationTmp').html(text);
			
			},
			error: function(jqXHR, textStatus, error) {
				alert("Error : " + jqXHR.status + "," + error);
			}
		});
	});
	
	 
	//�˻����� ����Ű �������� Ʈ���� �ߵ�
	$('.pKeyword').on('keydown', function(e) {
		if(e.keyCode == 13){
			e.preventDefault();
			$('#btn3').trigger('click');
        }
	});
	
	
	//�˻�
	 $("#btn3").on("click",function(){
		 
		 pKeyfield=$('#pKeyfield').val();
		 pKeyword=$('.pKeyword').val();
 		 if(pKeyword.trim() == '') {
 			swal("�˻�� �Է����ּ���.","", "error");
 			 return;
 		 } 
		 templatePaging(1);
	 });
	
	
	//����
	 $("#datatable").on("click",'.deleteDelegationBtn',function(){
		 swal({
			  title: "���� ���� ����",
			  text: "���õ� ������ �����Ͻðڽ��ϱ�?",
			  icon: "error",
			  buttons : true 
			}).then((e) => {
				if(e) {
					 location.href="${pageContext.request.contextPath}/admin/removeDelegation.do?deleNo="+$(this).attr('name');
				}	
			
			});
		
		 
	 });
	 
	 
	//���� �߰�
	 $("#btn1").on("click",function(){
//		 event.preventDefault();
		if($('#delegationTmp').val() ==0) {
			swal('��� ����','��ļ��� ������ �ּ���','error');
			return false;
		}
			swal({
				  title: "���� ���� �߰�",
				  text: "���� ������ �߰� �Ͻðڽ��ϱ�?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						$.ajax({
							url: '${pageContext.request.contextPath}/admin/checkDelegationIsTmpExist.do'
							,
							method: 'GET' 
							,
							data: {
								tmpNo : $('#delegationTmp').val() 
							}
							,
							dataType: 'json'
							,
							success: function(data) {
								if(!data) {	//false�� �̵�ϵ� ��ļ�
									registerDelegation();
								} else {	//��ϵ� ��ļ�
									swal("��� ����","�̹� ��ϵ� ��ļ��Դϴ�.","error");									
								}		
									
							},
							error: function(jqXHR, textStatus, error) {
								alert("Error : " + jqXHR.status + "," + error);
							}
						});
						
					}	
				});
		 
	 });
		
	    
	    
		//��� ��� �Լ�
		function registerDelegation(){			
			var tmpNo = $('#delegationTmp').val();
			var cNo = $('#delegationDuty').val();		
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/registerDelegation.do'
				,
				method: 'POST' 
				,
				data: {
					tmpNo: tmpNo	,
					cNo: cNo						
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					
						swal({
							  title: "�߰� �Ϸ�",
							  text: "���� ������ �߰��Ǿ����ϴ�.",
							  icon: "success",
							  confirmButton: true,
							  showCancelButton: false
							}) .then((e) => {
								if(e) {
									templatePaging(1);
								}	
							}) ;	

					
						
				},
				error: function(jqXHR, textStatus, error) {
					alert("Error : " + jqXHR.status + "," + error);
				}
			});
		}
 
});
	

	function templatePaging(currentPageNo) {
		var totalCount =  0;		//�� ��ļ� ��
		var countPerPage = 5;   //�� �������� �����ִ� ȸ�� ��
		var pageSize = 5;		//������ ����Ʈ�� �ԽõǴ� ������ ��
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		var apprFinalStatus=0;
		var apprStatus=0;
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/delegationPaging.do' 
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
				
				//datatable���̺� �����ϱ�
				var text = "";
				for(var i=0;i<data.delegations.length;i++) {

					text += "<tr><td>"+ data.delegations[i].template.tmpName + "</td>";
					text += "<td>"+ data.delegations[i].code.cName + "</td>";
					text += "<td>"+ data.delegations[i].deleDate + "</td>";
					text += "<td style='width:30px;'><a class='btn deleteDelegationBtn' name="+data.delegations[i].deleNo+" style='margin:0px;'>����</a></td>";
					text += "</tr>";
				}
					$('#datatable').html(text);
					
				 
					//����¡ ó��
					jqueryPager({
						countPerPage : countPerPage,
						pageSize : pageSize,
						currentPageNo : currentPageNo,
						totalCount : totalCount
					});
					
				
			} ,
			error: function(jqXHR) {
				alert("����: " + jqXHR.status);
			}
			
		});
		

	} //end templatePaging function
	
	//����¡ ó��
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
		html += '<a class="page-link" aria-label="Previous" onclick = "templatePaging(' + (sPage - pageSize) + ')">'; 
	}
	html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
	
	for(var i=sPage; i<=ePage; i++) {
		if(currentPage == i) {
			html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
		} else {
			html += '<li class="page-item"><a class="page-link" onclick="templatePaging(' + i + ');">' + i + '</a></li>';
		}
	}				

	if (ePage >= pageTotalCnt) {
		html += '<li class="page-item disabled">';
		html += '<a class="page-link" aria-label="Next">';
	} else {
		html += '<li class="page-item">';
		html += '<a class="page-link" aria-label="Next" onclick = "templatePaging(' + (ePage+1) + ')">';
	}
	html += '<span aria-hidden="true">&raquo;</span> </a></li>';
	html += '</ul>';
	
	$('#templatePaging').html(html);

}

</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>���� ����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<div class="form-group form-inline" style='border-bottom : 2px solid #d8d3d3;'>
					<div id="insertDeleg" >
						<form id="search" style="margin-bottom:10px;">
							<select id='categorySelect' style='height:34px;'>
								<option value='0' >��з�</option>
								<c:forEach var="category" items="${requestScope.categories}">
									<option value="${pageScope.category.categoryNo}">
										${pageScope.category.categoryName }
									</option>
								</c:forEach>
								<option value='all' >��ü</option>
							</select>
							<select id="delegationTmp" name="delegationTmp" style="height: 34px;">
								<option value='0'>
									��ļ� ����
								</option>
							</select> 
							<select id="delegationDuty" name="delegationDuty" style="height: 34px; width: 150px;">
								<c:forEach var="duty" items="${requestScope.duty}">
									<option value="${pageScope.duty.cNo }">
										${pageScope.duty.cName }
									</option>
								</c:forEach>
							</select>
							<button id="btn1" class="btn btn-primary" type="button"
								    style="margin-bottom: 4px; padding-top: 2px; height: 34px;">
								���� ���
							</button>
						</form>
					</div>
					

				</div>
				<div class='col-md-1'></div>
				
				<div class='col-md-10' style='margin-top:30px;'>
					<div style='float:right; margin-bottom:10px;'>
		                    <select id="pKeyfield" name="pKeyfield" style="height: 34px;width:80px;">
								<option value="template">��ĸ�</option>
								<option value="duty">����</option>
							</select>
		                <input class="pKeyword" type="text" name="pKeyword"
								placeholder="�˻�� �Է��ϼ���" style="width: 172px; height: 34px;">
		                    <button id="btn3" class="btn btn-primary" type="button"
								style="margin-bottom: 4px; padding-top: 2px; margin-left:3px; height: 34px;">
								�˻�
							</button>
		            </div>
				
				
					<table class="table table-striped table-bordered"
						style=" text-align: center; margin-left:-4px;">
						<thead>
							<tr>
								<th style="text-align: center;">��ĸ�</th>
								<th style="text-align: center;">��å</th>
								<th style="text-align: center;">������</th>
								<th style="text-align: center;">����</th>
							</tr>
						</thead>
						<tbody id="datatable">
						</tbody>
					</table>
				
					<nav aria-label="Page navigation" id='templatePaging' style="text-align:center;">
					</nav>
				</div>
				
				<div class='col-md-1'></div>
			</div>
		</div>
	</div>
					<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>