<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ���</title>
<style>
.pagination {align:center};
</style>
  <link href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" />
  <script src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.js"></script>
  <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/ko.js"></script> --%>
 
<script>
	var eKeyfield;
	var eKeyword;
	var eKeyword1;
	
	var now = new Date();
    var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
    
    var NowTime = year + mon + day;
	   
	 $.datepicker.setDefaults({
		    dateFormat: 'yy-mm',
		    prevText: '���� ��',
		    nextText: '���� ��',
		    monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		    monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		    dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		    dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		    dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		    showMonthAfterYear: true,
		    yearSuffix: '��'
		  });
	 
	$(document).ready(function () {		

		employeePaging1(1);
		
		$('#startDate1').datetimepicker({
			format : "YYYY/MM/DD HH:00",		
			minDate : new Date().setHours(00) ,
			defaultDate : new Date().setHours(8)
			
		});
		$('#endDate1').datetimepicker({
			format : "YYYY/MM/DD HH:00",	 
			minDate : new Date().setHours(00) ,
			defaultDate : new Date().setHours(18)
		});
		
		$('#endDate1').click(function(){
			$(this).datetimepicker("minDate",$('#startDate1').val());
		});
		
		//�˻�â Ÿ�� �ٲٱ�
		 $('.keyfield1').on("change",function(){
			if($(this).val()=='date'){
				$(this).next().attr('placeholder','�Ⱓ�� �����ϼ���');
				
				$(this).next().after("<b id=temp>~</b> ")
				$(this).next().next().after("<input type=text id=pKeyword1 placeholder='�Ⱓ�� �����ϼ���'>")
				
				$("#pKeyword").datepicker({
		            dateFormat: 'yy�� mm�� dd��'              
		        });
				$('#pKeyword').datepicker("option", "maxDate", $("#pKeyword1").val());
			    $('#pKeyword').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#pKeyword1").datepicker( "option", "minDate", selectedDate );
			    });
				
				$("#pKeyword1").datepicker({
		            dateFormat: 'yy�� mm�� dd��'  
		        });
				$('#pKeyword1').datepicker("option", "minDate", $("#pKeyword").val());
			    $('#pKeyword1').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#pKeyword").datepicker( "option", "maxDate", selectedDate );
			    });
				
				console.log($('form').html());
			} else{
				$(this).next().attr('placeholder','�˻�� �Է��ϼ���');
				$('#pKeyword').datepicker("destroy");
				$('#pKeyword').val('');
				$('#pKeyword1').remove();
				$('#temp').remove();

					
			}
			
			
			 
		 });
		
		 $("input[name=pKeyword]").autocomplete({
				focus : function() {
					return false;
				}
		 });
		 
	
		
		
		//�˻����� ����Ű �������� Ʈ���� �ߵ�
		$('#pKeyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				e.preventDefault();
				$('#btn3').trigger('click');
	        }
		});
		
		
		// �˻� ����
		$("#btn3").on("click",function(){
			eKeyfield=$('.keyfield1').val();

			if(eKeyfield != "date" && eKeyword == "") { 			
				swal("�˻�� �Է����ּ���.", "","error");
				return; 				
			}
 			if(eKeyfield == "date" ){
	 			if( eKeyword == "" || eKeyword1 == "") {
					swal("��¥�� �Է����ּ���.", "","error");
					return;
	 			}  
 			}
 			
 			
			 if(eKeyfield=='date'){ 
				 eKeyword=convertDate($('#pKeyword').datepicker('getDate')); 
				 eKeyword1=convertDate($('#pKeyword1').datepicker('getDate'));
			 }else{
				 eKeyword=$('#pKeyword').val();
			 }
			 
			 function pad(num) {
			        num = num + '';
			        return num.length < 2 ? '0' + num : num;
		     }
			   
			 function convertDate(date) {
			    return date.getFullYear() + "-" + pad((date.getMonth() + 1)) + "-" + pad(date.getDate());	
			 }
	 				
			 
	 			
			 
			 employeePaging1(1);
		 });
		
		//�˻��� �ٽ� ����Ʈ��
		$('#return').click(function(){
			location.href="${pageContext.request.contextPath}/registerDeputy.do";
		});	
		
		$('#searchEmp').click(function() {
			$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
			$('#layerpop').modal({
				backdrop: 'static', 
				keyboard: false
			});
		});
		
		$('#modalChooseBtn').on('click',function() {
			//������� - �����ڼ���
			$('input[name=dempNo]').val(selectedEmpNo);
			$('input[name=empName]').val(selectedNameAndDuty);
		});
		
		$('#modalCloseBtn').on('click',function() {
			$('#chartBody').html(""); 
		});
		
		//����ߴ�
		$('#datatable').on('click','#stopUse',function() {
		   var startDate = $(this).parent().parent().find("#startDate").text();
		   var startDateArr = startDate.split('/');
		   var startDatdCompare = startDateArr[0] + startDateArr[1] + startDateArr[2];

		   swal({
				  title: "��� ��� �ߴ�",
				  text: "�ش� ����� ��� �ߴ� �Ͻðڽ��ϱ�?",
				  icon: "warning",
				  buttons : true 
				}).then((e) => {
					if(e) {
						
						$.ajax({
							url: "${pageContext.request.contextPath}/stopUseDeputy.do",
							method: 'POST',
							data : {
								depNo : $(this).parent().parent().find('.depNo').val(),
								status : $(this).parent().parent().find('.status').val()
							},
							dataType : 'json',
							success: function(data) {						
								employeePaging1(1);
							},
							error: function(jqXHR) {
								alert("error : " + jqXHR.status);
							}
						});
						
					}	
				});
		
		});
		
		
		//���
		$('#datatable').on('click','#candep',function() {
			
			  swal({
				  title: "��� ����",
				  text: "�ش� ����� �����Ͻðڽ��ϱ�?",
				  icon: "error",
				  buttons : true 
				}).then((e) => {
					if(e) {
			
					$.ajax({
						url: "${pageContext.request.contextPath}/cancelDeputy.do",
						method: 'POST',
						data : {
							depNo : $(this).parent().parent().find('input').val()
						},
						dataType : 'json',
						success: function(data) {
							employeePaging1(1);
						},
						error: function(jqXHR) {
							alert("error : " + jqXHR.status);
						}
					})
					
				}
			});		
		});
		
		//��� ���
		$('#submitBtn').click(function(e) {
			event.preventDefault();
			checkUnload = false;
			
			var startDate = $( "input[name='startDate']" ).val();
			var endDate = $( "input[name='endDate']" ).val();
			
			if($('input[name=empName]').val().trim() == '') {
				swal("�����ڸ� �������ּ���.","");
				return;
			}
			if($('input[name=startDate]').val().trim() == '') {
				swal("�Ⱓ�� �������ּ���.","");
				return;
			}
			if($('input[name=endDate]').val().trim() == '') {
				swal("�Ⱓ�� �������ּ���.","");
				return;
			}
			
			swal({
				  title: "��� ���",
				  text: "����� ��� �Ͻðڽ��ϱ�?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e){
					$.ajax({
						url: "${pageContext.request.contextPath}/checkDeputy.do",
						method: 'POST',
						data : {
							startDate : startDate,
							endDate : endDate
						},
						dataType : 'json',
						success: function(data) {						
							if(data > 0){
								 swal({
									  title: "��� ���� ����",
									  text: "�ش� �Ⱓ�� �̹� ������ �����ڰ� �ֽ��ϴ�.",
									  icon: "error",
									  buttons : false 
									})
							}else{
								$('#demo-form2').submit();
							}
						},
						error: function(jqXHR) {
							alert("error : " + jqXHR.status);
						}
					});
					}
				});
			/*  var startDateArr = startDate.split('/');
			var endDateArr = endDate.split('/');
		                 
			var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
			var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
		        alert(startDate+"~~"+endDate) 
		
			if(startDateCompare.getTime() > endDateCompare.getTime()) {        
		    	e.preventDefault();
				alert("���۳�¥�� ���ᳯ¥�� Ȯ���� �ּ���.");
			}  */
		});
		
	});
	
	function employeePaging1(currentPageNo) {
			var totalCount =  0;		//��  ��
			var countPerPage = 5;   //�� �������� �����ִ� ȸ�� ��
			var pageSize = 5;		//������ ����Ʈ�� �ԽõǴ� ������ ��
			var startRow = (currentPageNo - 1) * countPerPage + 1;
			var endRow = currentPageNo * countPerPage;

			$.ajax({
				url: '${pageContext.request.contextPath}/listDeputyAjax.do' 
				,
				data: {
					keyfield: eKeyfield ,
					keyword: eKeyword ,	
					keyword1: eKeyword1 ,	
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
						text += '<tr class="text-center"><td colspan=8>��ȸ�� �˻������ �����ϴ�</td></tr>';
					} else {
						for(var i=0;i<data.deputies.length;i++) {
							for(var j=0;j<data.deputies[i].employees.length;j++) {
								text += "<tr id='parent" + i + "'>";
								text += "<input type='hidden' class='depNo' id='depNo"+ i +"' value='"+ data.deputies[i].depNo +"'>";
								text += "<input type='hidden' class='status' value='"+ data.deputies[i].status +"'>";
								text += "<td>"+ data.deputies[i].dempNo +"</td>";
								text += "<td>"+ data.deputies[i].employees[j].duty +"</td>";
								text += "<td>"+ data.deputies[i].employees[j].empName; + "</td>";
								text += "<td id='startDate'>"+ data.deputies[i].startDate +"</td>";
								text += "<td id='endDate'>"+ data.deputies[i].endDate +"</td>";
								if(data.deputies[i].status == "����"){
									text += "<td>����</td>"
								}else{
									text += "<td>"+ data.deputies[i].progression +"</td>";																	
								}
								text += "<td>"+ data.deputies[i].depReason +"</td><td>";
								if(data.deputies[i].progression == "T"){
									if(data.deputies[i].status == "�̷�"){
							  			text += "<button id='stopUse' type='button' class='btn btn-warning' style='padding-top: 1px; padding-bottom: 1px;padding-left: 3px; padding-right: 3px;'>����ߴ�</button>"
										text += "<button id='candep' type='button' class='btn btn-default' style='padding-top: 1px; padding-bottom: 1px;padding-left: 3px; padding-right: 3px;'>����</button>";									
									}else if(data.deputies[i].status == "����"){
										text += "<button id='stopUse' type='button' class='btn btn-warning' style='padding-top: 1px; padding-bottom: 1px;padding-left: 3px; padding-right: 3px;'>����ߴ�</button>"									
									}
								}else{
									if(data.deputies[i].status == "�̷�"){
										text += "<button id='candep' type='button' class='btn btn-default' style='padding-top: 1px; padding-bottom: 1px;padding-left: 3px; padding-right: 3px;'>����</button>";									
									}
								}
								text += "</td></tr>";
							}
						}
					}   
					$('#datatable').find('tbody').html(text);
   
					//����¡ ó��
					jqueryPager1({
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
			
			var html ="<div class='center-block'>";
				html ="<ul class='pagination'>";

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
			html += '</ul>'
			html += '</div>';
			
			$('#employeePaging1').html(html);
	
	} //end of jqueryPager1
	
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
							<input type="text" id="empName" name="empName" class="form-control" readonly>
								<span class="input-group-btn">
									<button id="searchEmp" type="button" class="btn btn-default"
										data-toggle="modal" <%-- data-target="#myModal" --%>>�˻�</button>
								</span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="ex3">�Ⱓ���� :</label> 
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="startDate1" class="form-control" name="startDate"
									required="required" style="width:250px;">&nbsp;&nbsp;&nbsp;
									~&nbsp;&nbsp;&nbsp;
							<input type="text" id="endDate1"	class="form-control" name="endDate"
									required="required" style="width:250px;">
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="depReason">���� :</label>
						<div >
							<input type="text" id="depReason" name="depReason"
								required="required" class="form-control col-md-7 col-xs-12" style="width:535px;margin-left: 10px;">
							<button id="submitBtn" type="button" class="btn btn-primary" style="margin-left: 10px;">�����</button>
						</div>
					</div>
					</form>
					<br>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							
						</div>
					</div>
					  
					<div class="ln_solid"></div>
					
					<div class="col-md-3" style="width:100%;"> 
						<div class="input-group" style="width:100%;">  
							<div class="searchList2" style="float:right !important;">
								<select class="keyfield1" name="pKeyfield" style="height:25px;" >
									<option value="dempNo">�����ȣ</option>
									<option value="duty">��å</option>
									<option value="empName">�̸�</option>
									<option value="date">�Ⱓ</option>
								</select> <input id="pKeyword" type="text" name="pKeyword" placeholder="�˻�� �Է��ϼ���">
								<button id="btn3" type="button" class="btn btn-default" style="padding-left: 2px;
								    padding-right: 2px; padding-bottom: 2px; padding-top: 2px; margin-bottom: 1px;">�˻�</button>
								<i class="fa fa-undo" id="return">�ǵ�����</i>
						</div>
<<<<<<< HEAD
					</div>
						
=======
					</div>
>>>>>>> branch 'master' of https://github.com/whsanha55/groupwareWebAppProject.git
					<table id="datatable" class="table table-striped table-bordered" style="text-align:center;width:1202px;">
						<thead>
							<tr>
								<th id='1' class="text-center">���</th>
								<th id='2' class="text-center">��å</th>
								<th id='3' class="text-center">�̸�</th>
								<th id='4' class="text-center">������</th>
								<th id='5' class="text-center">������</th>
								<th id='6' class="text-center">��뿩��</th>
								<th id='7' class="text-center">����</th>
								<th id='8' class="text-center">���</th>
							</tr>
						</thead>
						<tbody id="tbody">
							
						</tbody>
					</table>
					<div >
				 		<nav aria-label="Page navigation" id='employeePaging1'
						style="text-align:center;">
				
						</nav> 
						</div>
				
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>