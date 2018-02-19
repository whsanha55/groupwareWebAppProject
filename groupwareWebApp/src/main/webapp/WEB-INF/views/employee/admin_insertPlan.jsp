<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=ad3a3657ebba1b7547bc9c0a370b50dc&libraries=services"></script>
<style>
.modal-dialog.modal-cSize {
	width:600px;
	height:auto;
}
</style>
<script>


$(document).ready(function() {	

	$('#registerBtn').on('click', function() {
		event.preventDefault();
		checkUnload = false;
		if($('input[name=pTitle]').val().trim() == '') {
			swal("������ �Է����ּ���.","");
			return;
		}
		if($('input[name=startDate]').val().trim() == '') {
			swal("�������� �Է����ּ���.","");
			return;
		}
		if($('input[name=endDate]').val().trim() == '') {
			swal("�������� �Է����ּ���.","");
			return;
		}
		if($('input[name=startDate]').val() >= $('input[name=endDate]').val()) {
			swal("�������� �����Ϻ��� Ŭ �� �����ϴ�.","");
			return;
		}
		if($('input[name=destination]').val().trim() == '') {
			swal("��������� �Է����ּ���.","");
			return;
		}
		if($('input[name=pContent]').val() == '') {
			swal("������ �Է����ּ���.","");
			return;
		}
		if($('input[name=empName]').val().trim() == '') {
			swal("����ڸ� �������ּ���.","");
			return;
		}
		swal({
			title: "���� ���",
			text: "������ ����մϴ�. ��� �����Ͻðڽ��ϱ�?",
			icon: "info",
			buttons : true 
		}).then((e) => {
			if(e) {
				$('#register').submit();
			} else if(!e) {
				checkUnload = true;
				return;
			}
		});			

	});
	
	
	$('#searchEmp').click(function() {
		$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
		$('#layerpop').modal({
			backdrop: 'static', 
			keyboard: false
		});
	});
	
	$('#modalChooseBtn').on('click',function() {		
		//�������� - ����ڼ���
		$('input[name=rspbNo]').val(selectedEmpNo);
		$('input[name=empName]').val(selectedNameAndDuty);
	
		$('#chartBody').html("");
		 
	});
	
	$('#modalCloseBtn').on('click',function() {
		$('#chartBody').html("");
	});
	
	$('#searchMap').click(function() {
		$('#mapBody').load('${pageContext.request.contextPath}/admin/map.do');
		$('#layerpop2').modal({
			backdrop : 'static',
			keyboard : false
		});
	});

 
	
	$('#modalChooseBtn2').on('click',function() {	
		console.log(selectedDest);
		$('input[name=destination]').val(selectedDest);
		$('input[name=latitude]').val(selectedLat);
		$('input[name=longitude]').val(selectedLng);

		$('#mapBody').html("");
	});
	
	$('#modalCloseBtn2').on('click',function() {
		$('#mapBody').html("");		
	});
	
});
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
					<br>
					<form id="register" data-parsley-validate="" class="form-horizontal form-label-left"
							action="${pageContext.request.contextPath }/admin/registerPlan.do" method="post"
							enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >�������� *</label>&nbsp;&nbsp;
							<select id="p_Class" name="pClass" style="width:100px;height:30px;">
							<option value="1">ȸ��</option>
							<option value="2">����</option>
							<option value="3">��Ÿ</option>
							</select>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >�μ� *</label>&nbsp;&nbsp;
							<select id="deptNo" name="deptNo" style="width:100px;height:30px;">
							<option value="A">��ü</option>
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.key }">${pageScope.deptCode.title }</option>
							</c:forEach>
							</select>
						</div>
						
						
						<br>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >���� *</label>&nbsp;&nbsp;
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" name="pTitle" class="form-control" placeholder="������ �Է����ּ���."
										style="width:600px;" required="required">
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
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >�Ⱓ *</label>&nbsp;&nbsp;
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<fieldset>
									<div class="control-group">
										<div class="controls">
											<div class="input-prepend input-group col-md-6 col-sm-6 col-xs-12">
												<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
												<input type="datetime-local" name="startDate" id="startDate"
														class="form-control" required="required" style="width:262px;" >
												<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
												<input type="datetime-local" name="endDate" id="endDate" 
														class="form-control" required="required" style="width:262px;" >
											</div>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						
		
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >��� *</label>&nbsp;&nbsp;
							<div class=" col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="destination" name="destination"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:515px;" value='��Ʈķ��'>
								<input type="hidden" id="latitude" name="latitude" value="37.49952673450098">
								<input type="hidden" id="longitude" name="longitude" value="127.0292843723033">
								<button id="searchMap" type="button" class="btn btn-success">�ּ�ã��</button>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >����</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								 <textarea name="pContent" class="resizable_textarea form-control" rows="3" style="width: 100%" ></textarea>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">÷������</label>
							<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
								<i class="fa fa-picture-o"></i></a>
								<input name="upload" type="file" data-role="magic-overlay" data-target="#fileBtn"
										data-edit="insertImage" >
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">�߿䵵 *</label>
								<div class="form-group">
									&nbsp;&nbsp;
									��: <input type="radio" name="pImpt" id="pImpt" value="1" checked="">
									&nbsp;&nbsp;
									��: <input type="radio" name="pImpt" id="pImpt" value="2">
									&nbsp;&nbsp;
									��: <input type="radio" name="pImpt" id="pImpt" value="3">
								</div>
							</div>


						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" for="empName">����� ���� *</label>
							<div class="input-group col-md-6 col-sm-6 col-xs-12">
								<input type="hidden" id="rspbNo" name="rspbNo" value="" >
								<input type="text" id="empName" name="empName" class="form-control" readonly>
									<span class="input-group-btn">
									<button id="searchEmp" type="button" class="btn btn-primary" data-toggle="modal">�˻�</button>
							</div>
						</div>


						<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<c:url var="listPlanURL" value="/admin/listPlan.do" scope="page" ></c:url>
									<a id="list" href="${pageScope.listPlanURL }"  ><button class="btn btn-primary" type="button">�ڷΰ���</button></a>
									<button id="registerBtn" type="submit" class="btn btn-success">���</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	
	<!-- ��� �˾� -->
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
	
	<!-- ��� �˾� -->
	<div class="modal fade" id="layerpop2">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
							
				<div class="modal-body" id="mapBody"></div>
							
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalChooseBtn2"
							data-dismiss="modal">����</button>
					<button type="button" class="btn btn-default" id="modalCloseBtn2"
							data-dismiss="modal">�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
	
</form>
</body>
</html>