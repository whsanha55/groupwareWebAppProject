<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<style>
	#img : {
		max-width : 100%;
		height : auto;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(document).ready(function () {
		
		
		$('#dutyBtn').on('change', function() {
			$('input[name=dutyCode]').val($('#dutyBtn option:selected').val());	
		});
		
		$('#deptBtn').on('change', function() {
			$('input[name=deptCode]').val($('#deptBtn option:selected').val());	
						
		  	$.ajax ({
				url: "${pageContext.request.contextPath}/admin/checkRelation.do"
				,
				method: 'POST'
				,
				data: {
					deptCode: $('#deptCode').val()
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					var text = "";					
					if(data.length != 0) {
						text += '<select id="teamBtn" name="teamBtn" style="width:100px;height:30px;">';
						text += '<option value="">������</option>';					
						for (var i = 0; i<data.length; i++) {
							text += '<option value="'+ data[i].cNo +'">'+ data[i].cName +'</option>';
						}
						text += '</select>';
						
						if($('#teamBtn').is(null) != true) {
							$('#teamBtn').remove();
						}
						
						$(text).appendTo('#form-dept');
											
					} else {
						$('#teamBtn').remove();
					}
					$('#teamBtn').on('change', function() {
						$('input[name=deptCode]').val($('#teamBtn option:selected').val());
					});
				}
				,
				error: function(jqXHR) {
					alert('error : ' + jqXHR.status);
				}
			});
		});
		
		
		/* $('#regibtn').click(function() {

			swal({
				  title: "��� ���",
				  text: "����� ����մϴ�. ��� �����Ͻðڽ��ϱ�?",
				  icon: "info",
				  buttons : true 
				}).then((e) => {
					if(e) {
						registerEmployee();
					} else if(!e) {
						return;
					}	
				});
		}); */
		
		$("#upload-image").on("change", handleImgFileSelect);
		
		$("#findpostcode").click(execDaumPostcode);
		
		$('select[name=emailaddr]').on('change', function () {	
			if($('select[name=emailaddr]').val() != "") {
				$('#email2').attr('readonly', true);
				$('#email2').val($('select[name=emailaddr]').val());				
			}
		});
		
		$('input[name=empPwd]').focus(function() {
			if($(this).next('span').text() != null){
				$(this).next('span').remove();
			}
		});
		
		$('input[name=empPwd]').blur(function() {	
			if($(this).val() < 5 || $(this).val() > 12) {
				$(this).after('<span style="color:red;">5~12�ڸ� ���̷� �Է����ּ���.</span>');
			}
		});
				
		$('input[name=empPwdCheck]').focus(function() {
			if($(this).next('span').text() != null){
				$(this).next('span').remove();
			}
		});
		
		$('input[name=empPwdCheck]').blur(function() {
			
			if($(this).val() != $('input[name=empPwd]').val()) {
				$(this).after('<span style="color:red;">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>');
			}
		});
		
		$('#regibtn').on('click', function() {
			event.preventDefault();
			checkUnload = false;
			if($('input[name=upload]').val().trim() == '') {
				swal("������ ������ �߰����ּ���.","");
				return;
			}
			if($('input[name=empName]').val().trim() == '') {
				swal("����̸��� �Է����ּ���.","");
				return;
			}
			if($('input[name=empPwd]').val().trim() == '') {
				swal("��й�ȣ�� �Է����ּ���.","");
				return;
			}
			if($('input[name=empPwdCheck]').val().trim() == '') {
				swal("��й�ȣ Ȯ���� �Է����ּ���.","");
				return;
			}
			if($('input[name=phoneNumber2]').val() == '' || $('input[name=phoneNumber3]').val() == '' ) {
				swal("����ó�� �Է����ּ���.","");
				return;
			}
			if($('input[name=regNumber1]').val() == '' || $('input[name=regNumber2]').val() == '') {
				swal("�ֹε�Ϲ�ȣ�� �Է����ּ���.","");
				return;
			}
			if($('input[name=dutyCode]').val().trim() == '') {
				swal("��å�� �������ּ���.","");
				return;
			}
			if($('input[name=deptCode]').val().trim() == '') {
				swal("�μ��� �������ּ���.","");
				return;
			}
			if($('input[name=email1]').val().trim() == '' || $('input[name=email2]').val().trim() == '') {
				swal("�̸��� �Է����ּ���.","");
				return;
			}
			if($('input[name=address]').val() == '') {
				swal("�ּ������� �Է����ּ���.","");
				return;
			}
			
			var phoneNumber = $('#phoneNumber1').val() + '-' + $('#phoneNumber2').val() + '-' + $('#phoneNumber3').val();
			$('#phoneNumber').val(phoneNumber);
			var regNumber = $('#regNumber1').val() + '-' + $('#regNumber2').val();
			$('#regNumber').val(regNumber);
			var email = $('#email1').val() + '@' + $('#email2').val();
			$('#email').val(email);
			
			swal({
				title: "��� ���",
				text: "����� ����մϴ�. ��� �����Ͻðڽ��ϱ�?",
				icon: "info",
				buttons : true 
			}).then((e) => {
				if(e) {
					$('#regiform').submit();
				} else if(!e) {
					checkUnload = true;
					return;
				}
			});			

		});

	});
	

	/* //��� ��� �Լ�
	function registerEmployee(){
		var upload = $('#upload-image').val();
		var empName = $('#empName').val();
		var empPwd = $('#empPwd').val();
		var engName = $('#engName').val();
		var phoneNumber = $('#phoneNumber').val();
		var deptCode =$('#deptCode').val();
		var dutyCode = $('#dutyCode').val();
		var email = $('#email').val();
		var regNumber = $('#regNumber').val();
		var postcode = $('#postcode').val();
		var address = $('#address').val();
		var detailAddress = $('#detailAddress').val();
		
		if(upload == "") {
			swal("������ ������ ������ּ���!", "");
			return;
		}
		
		if(empName == "") {
			swal("�̸��� �Է����ּ���!", "");
			return;
		}
		
		if(engName == "") {
			swal("���� �̸��� �Է����ּ���!", "");
			return;
		}
		
		if(empPwd == "") {
			swal("��й�ȣ�� �Է����ּ���!", "");
			return;
		}
		
		if(phoneNumber == "") {
			swal("����ó�� �Է����ּ���!", "");
			return;
		}
		
		if(deptCode == "") {
			swal("�μ��� �������ּ���!", "");
			return;
		}
		
		if(dutyCode == "") {
			swal("��å�� �������ּ���!", "");
			return;
		}
		
		if(email == "") {
			swal("�̸����� �Է����ּ���!", "");
			return;
		}
		
		if(regNumber == "") {
			swal("�ֹι�ȣ�� �Է����ּ���", "");
			return;
		}
		
		if(postcode == "") {
			swal("�ּҵ���� ���� ���� �ּ�ã�� ��ư�� �̿����ּ���!", "");
			return;
		}
		
		if(detailAddress == "") {
			swal("�� �ּ� ������ �Է����ּ���!.", "");
			return;
		}
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/registerEmployee.do'
			,
			method: 'POST'
			,
			data: {
				upload : upload,
				empName : empName,
				empPwd : empPwd,
				engName : engName,
				phoneNumber : phoneNumber,
				deptCode : deptCode,
				dutyCode : dutyCode,
				email : email,
				regNumber : regNumber,
				postcode : postcode,
				address : address,
				detailAddress : detailAddress			
			}
			,
			dataType: 'json'
			,
			success: function(data) {
				if(data == "��� �Ϸ�") {
					swal({
						  title: "��� �Ϸ�",
						  text: "��������� ��ϵǾ����ϴ�.",
						  icon: "success",
						  confirmButton: true,
						  showCancelButton: false
						}).then((e) => {
							if(e) {
								location.href="${pageContext.request.contextPath}/admin/listEmployee.do";
							}	
						});	
				}
				
			},
			error: function(jqXHR, textStatus, error) {
				alert("Error : " + jqXHR.status);
			}
		});
	}
 */
	
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
                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('address').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('detailAddress').focus();
                
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
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	
	
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>������</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="regiform" data-parsley-validate="" class="form-horizontal form-label-left"
								action="${pageContext.request.contextPath }/admin/registerEmployee.do" method="post" enctype="multipart/form-data">
					<input type="hidden" id="deptCode" name="deptCode" value="" />
					<input type="hidden" id="dutyCode" name="dutyCode" value="" />	
					<div class="form-group">		
						<div class="form-group" id="img_wrap">
							<%-- <i class="fa fa-picture-o"> --%>
							<img id="img" width="250px" height="250px" class="img-responsive center-block"/>
						</div>
						<label class="control-label col-md-3 col-sm-3 col-xs-12">������ ���� </label>
						<div class="btn-group">
							<a class="btn" title="Insert picture (or just drag &amp; drop)"
								id="pictureBtn"></a> 								
								<input id="upload-image" name="upload"
								type="file" data-role="magic-overlay" data-target="#pictureBtn"
								data-edit="insertImage">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empName">�̸� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="empName" name="empName"
								 class="form-control col-md-7 col-xs-12" style="width:200px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="engName">���� �̸�
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="engName" name="engName"
								 class="form-control col-md-7 col-xs-12" style="width:200px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwd">��й�ȣ <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwd" name="empPwd"
								 class="form-control col-md-7 col-xs-12" style="width:300px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwdCheck">��й�ȣ Ȯ�� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwdCheck" name="empPwdCheck"
								 class="form-control col-md-7 col-xs-12" style="width:300px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="phoneNumber">����ó <span class="required">*</span>
						</label>
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="phoneNumber" name="phoneNumber"
								 class="form-control col-md-7 col-xs-12">
							<div class="form-group">
								<select id="phoneNumber1" name="phoneNumber1" style="width:100px;height:30px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								</select>
							</div>
								 &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input type="text" id="phoneNumber2" name="phoneNumber2"
								 class="form-control" style="width:100px;">
								 &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input type="text" id="phoneNumber3" name="regNumber3"
								 class="form-control" style="width:100px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="regNumber">�ֹι�ȣ <span class="required">*</span>
						</label>
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="regNumber" name="regNumber"
								 class="form-control col-md-7 col-xs-12" value="">
							<input type="text" id="regNumber1" name="regNumber1"
								 class="form-control" style="width:200px;">
								 &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input type="text" id="regNumber2" name="regNumber2"
								 class="form-control" style="width:200px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" 
							for="last-name">��å <span class="required">*</span>
						</label>&nbsp;&nbsp;
						<select id="dutyBtn" name="dutyBtn" style="width:100px;height:30px;">
							<option value="">��å����</option>
							<c:forEach var="dutyCode" items="${requestScope.dutyCodes }" varStatus="loop">
								<option value="${pageScope.dutyCode.cNo }">${pageScope.dutyCode.cName }</option>
							</c:forEach>
						</select>
					</div>
					<div id="form-dept" class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="deptBtn">�μ� <span class="required">*</span>
						</label>&nbsp;&nbsp;
						
						<select id="deptBtn" name="deptBtn" style="width:100px;height:30px;">
								<option value="">�μ�����</option>
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</option>
							</c:forEach>
						</select>		
					</div>

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">�̸��� <span class="required">*</span>
						</label>
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="email" name="email" value="" >
							<input type='text' id="email1" name="email1" class="form-control" style="width:150px;">@
            				<input type='text' id="email2" name="email2" class="form-control" style="width:250px;">
			              <select name="emailaddr" class="form-control">
			                 <option value="">�����Է�</option>
			                 <option value="naver.com">naver.com</option>
			                 <option value="gmail.com">gmail.com</option>
			                 <option value="nate.com">nate.com</option>
			                 <option value="daum.net">daum.net</option>
			                 <option value="hanmail.net">hanmail.net</option>
			                 <option value="empal.com">empal.com</option>
			                 <option value="msn.com">msn.com</option>
			              </select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2">�ּ� <span class="required">*</span>
						</label>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<input type="text" id="postcode" name="postcode" placeholder="�����ȣ" readonly
								 class="form-control col-sm-6 col-xs-6">
						</div>
						<button type="button" id="findpostcode" class="btn btn-success">�����ȣ ã��</button>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"> <span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address" placeholder="�ּ�" readonly
									required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"><span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="detailAddress" name="detailAddress" placeholder="���ּ�"
								 class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="center-block" align="center">
							<c:url var="listEmployeeURL" value="/admin/listEmployee.do" scope="page" ></c:url>
							<a id="list" href="${pageScope.listEmployeeURL }"><button class="btn btn-primary" type="button">���</button></a>
							<button id="regibtn" type="submit" class="btn btn-success">������</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>