<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������� ����</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	$(document).ready(function() {
		
		$('#modiform').on('click','#modifyPwdBtn', function() {
			
			$(this).text('���� ���');
			$(this).attr('id', 'modicanBtn');
			$(this).attr('class','btn btn-primary');
		//	$(this).css('margin-left','+=10px');
			
			$.ajax ({
				success:function() {
					txt = "";
					txt += '<div class="form-group">';
					txt += '<label class="control-label col-md-3 col-sm-3 col-xs-12" for="empPwd">�� ��й�ȣ <span class="required">*</span>';
					txt += '</label>';
					txt += '<div class="col-md-4 col-sm-6 col-xs-12">';
					txt += '<input type="password" id="empPwd" name="empPwd" class="form-control col-md-7 col-xs-12">';
					txt += '</div>';
					txt += '</div>';
					txt += '<div class="form-group">';
					txt += '<label class="control-label col-md-3 col-sm-3 col-xs-12" for="empPwdCheck">�� ��й�ȣ Ȯ�� <span class="required">*</span>';
					txt += '</label>';
					txt += '<div class="col-md-4 col-sm-6 col-xs-12">';
					txt += '<input type="password" id="empPwdCheck" name="empPwdCheck" class="form-control col-md-7 col-xs-12">';
					txt += '</div>';
					txt += '</div>';
				//	txt += '<div class="ln_solid"></div>';
					
					$('#addPwd').html(txt);
				
				}
			});
		});
		
		$('#modiform').on('click','#modicanBtn', function() {
			$(this).text('����');
			$(this).attr('id','modifyPwdBtn');
			$(this).attr('class','btn btn-success');
			//$(this).css('margin-left','-=10px');
			$('#addPwd').html("");
		});
		
		$('select[name=emailaddr]').on('change', function () {	
			if ($('select[name=emailaddr]').val() == "") {
				$('#email2').attr('readonly', false);
				$('#email2').val("");
			}			
			if($('select[name=emailaddr]').val() != "") {
				$('#email2').attr('readonly', true);
				$('#email2').val($('select[name=emailaddr]').val());				
			} 
		});	
			
		var phoneArr = $('#phoneNumber').val().split('-');
		$('#phoneNumber1').val(phoneArr[0]);
		$('#phoneNumber2').val(phoneArr[1]);
		$('#phoneNumber3').val(phoneArr[2]);
					
		var emailArr = $('#email').val().split('@');
		console.log(emailArr);
		$('#email1').val(emailArr[0]);
		$('#email2').val(emailArr[1]);
		
		
		
		$('#modiform').on('click', '#checkPwdBtn', function () {
			if($(this).next('span').text() != null) {
				$(this).next('span').remove();
			}
			
			$.ajax ({
				url:'${pageContext.request.contextPath}/checkPwdEmployee.do',
				method:'POST',
				data: {
					checkPwd : $('#checkPwd').val()
				},
				dataType:'json',
				success: function(data) {
					
					var txt = '';
					/* if(data == true) {
						txt += "<span id='greenSpan' style='color:green;'>��й�ȣ�� ��ġ�մϴ�.</span>"
					} else {
						txt += "<span id='errorSpan' style='color:red;'>��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>"
					} */
					if(data) {
						swal('��й�ȣ�� ��ġ�մϴ�','','success');
						txt += "<span id='greenSpan'></span>";
						$('input[name=checkPwd]').attr('readonly', true);
					} else {
						swal('��й�ȣ�� ��ġ���� �ʽ��ϴ�.','','error');
						txt += "<span id='errorSpan'></span>";
					}
					
					$('#checkPwdBtn').after(txt);
				},
				error : function(jqXHR) {
					alert('error : ' + jqXHR.status);
				}
				
			});
		});
		if($('input[name=checkPwd], input[name=empPwd], input[name=empPwdCheck]').length > 0) {
			
			$('#modiform').on('focus', 'input[name=empPwd]', function() {
				if($(this).next('span').text() != null){
					$(this).next('span').remove();
				}
			});
			$('#modiform').on('focus','input[name=empPwdCheck]', function() {
				if($(this).next('span').text() != null){
					$(this).next('span').remove();
				}
			});
			
			$('#modiform').on('blur', 'input[name=empPwd]', function() {	
				if($(this).val().trim().length < 4 || $(this).val().trim().length > 12) {
					$(this).after('<span id="errorSpan" style="color:red;">4~12�ڸ� ���̷� �Է����ּ���.</span>');
				}
			});		
			$('#modiform').on('blur', 'input[name=empPwdCheck]', function() {	
				if($(this).val() != $('input[name=empPwd]').val()) {
					$(this).after('<span id="errorSpan" style="color:red;">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>');
				}
			});	
		}
		
		$('input[name=phoneNumber2]').focus(function() {
			if($('input[name=phoneNumber3]').next('span').text() != null){
				$('input[name=phoneNumber3]').next('span').remove();
			}
		});
		$('input[name=phoneNumber3]').focus(function() {
			if($(this).next('span').text() != null){
				$(this).next('span').remove();
			}
		});
		$('input[name=email1]').focus(function() {
			if($('select[name=emailaddr]').next('span').text() != null){
				$('select[name=emailaddr]').next('span').remove();
			}
		});
		$('input[name=email2]').focus(function() {
			if($('select[name=emailaddr]').next('span').text() != null){
				$('select[name=emailaddr]').next('span').remove();
			}
		});
		$('input[name=address]').focus(function() {
			if($(this).next('span').text() != null){
				$(this).next('span').remove();
			}
		});		
		
		$('input[name=phoneNumber2], input[name=phoneNumber3]').blur(function() {
			if(!($('input[name=phoneNumber2]').val().trim().length == 4 && $('input[name=phoneNumber3]').val().trim().length == 4)) {
				$('input[name=phoneNumber3]').after('<span id="errorSpan" style="color:red;">����ó�� ��Ȯ�� �Է����ּ���.</span>');
			}
		});
		/*
		$('input[name=email1], input[name=email2]').blur(function() {
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var email = $('input[name=email1]').val() + '@' + $('input[name=email2]').val();
			$('#email').val(email);
			if(!regEmail.test($('#email.val()'))) {
				$('select[name=emailaddr]').after('<span id="errorSpan" style="color:red;">�̸����� ��Ȯ�� �Է����ּ���.</span>');
			}
		});
		*/
		$('#modifyBtn').on('click', function() {
			event.preventDefault();
			checkUnload = false;
			if($('input[name=checkPwd]').length > 0) {
				if($('input[name=checkPwd]').val().trim() == '') {
					swal("����Ȯ���� �ʿ��մϴ�.","���� ��й�ȣ�� �Է����ּ���.");
					return;
				}
				
				if($("#greenSpan").length ==0) {
					swal("��й�ȣ Ȯ���� ���ּ���.","");
					return;
				}
			}
			if($('input[name=empPwd]').length > 0) {
				if($('input[name=empPwd]').val().trim() == '') {
					swal("�� ��й�ȣ�� �Է����ּ���.","");
					return;
				}
			}
			if($('input[name=empPwdCheck]').length > 0) {
				if($('input[name=empPwdCheck]').val().trim() == '') {
					swal("�� ��й�ȣ Ȯ���� ���ּ���.","");
					return;
				}
			}
			if($('input[name=phoneNumber2]').val() == '' || $('input[name=phoneNumber3]').val() == '' ) {
				swal("����ó�� �Է����ּ���.","");
				return;
			}
			if($('input[name=email1]').val().trim() == '' || $('input[name=email2]').val().trim() == '') {
				swal("�̸����� �Է����ּ���.","");
				return;
			}
			if($('input[name=address]').val() == '') {
				swal("�ּ������� �Է����ּ���.","");
				return;
			}			
			
			if($("#errorSpan").text() != "") {
				swal("��Ȯ���� ���� ������ �ֽ��ϴ�. �ٽ� Ȯ�����ּ���.");
				return;
			}
			
			var phoneNumber = $('#phoneNumber1').val() + '-' + $('#phoneNumber2').val() + '-' + $('#phoneNumber3').val();
			$('#phoneNumber').val(phoneNumber);
			var regNumber = $('#regNumber1').val() + '-' + $('#regNumber2').val();
			$('#regNumber').val(regNumber);
			var email = $('#email1').val() + '@' + $('#email2').val();
			$('#email').val(email);
			
			swal({
				title: "��� ����",
				text: "��������� �����մϴ�. ��� �����Ͻðڽ��ϱ�?",
				icon: "info",
				buttons : true 
			}).then((e) => {
				if(e) {
					$('#modiform').submit();
				} else if(!e) {
					checkUnload = true;
					return;
				}
			});			
		});
		
		$('#backBtn').click(function() {
			location.href="${pageContext.request.contextPath}/detailEmployee.do";
		});
		
		
		$("#findpostcode").click(execDaumPostcode);
		
	});
	
	
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

</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>������� ����</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="modiform" action="${pageContext.request.contextPath }/modifyEmployee.do" method="POST" 
					data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">���
						</label>
						<div class="col-md-4 col-sm-6 col-xs-12">
							<input type="text" class="form-control" 
								id="empNo" name="empNo" readonly
								value="${requestScope.employee.empNo }">
						</div>

					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="checkPwd">��й�ȣ <span class="required">*</span>
						</label>
						<div class="col-md-4 col-sm-6 col-xs-6">
							<input type="password" id="checkPwd" name="checkPwd"
								 class="form-control col-sm-4 col-xs-6" >
						</div>
						<button type="button" id="checkPwdBtn" class="btn btn-success">��й�ȣ Ȯ��</button>
						<button type="button" id="modifyPwdBtn" class="btn btn-success">����</button>
					</div>
					<div id="addPwd">
					<%--
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwd">�� ��й�ȣ <span class="required">*</span>
						</label>
						<div class="col-md-4 col-sm-6 col-xs-12">
							<input type="password" id="empPwd" name="empPwd"
								 class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwdCheck">�� ��й�ȣ Ȯ�� <span class="required">*</span>
						</label>
						<div class="col-md-4 col-sm-6 col-xs-12">
							<input type="password" id="empPwdCheck" name="empPwdCheck"
								 class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					--%>
					</div>
					
					<div class="ln_solid"></div>
										
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empName">�̸� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="empName" name="empName" readonly
								 class="form-control col-md-7 col-xs-12" style="width:200px;"
								 value="${requestScope.employee.empName }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="engName">���� �̸�
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="engName" name="engName"
								 class="form-control col-md-7 col-xs-12" style="width:200px;"
								 value="${requestScope.employee.engName }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="phoneNumber">����ó <span class="required">*</span>
						</label>
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="phoneNumber" name="phoneNumber" value="${requestScope.employee.phoneNumber }"
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
							<input type="text" id="phoneNumber3" name="phoneNumber3"
								 class="form-control" style="width:100px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">�̸��� <span class="required">*</span>
						</label>
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="email" name="email" value="${requestScope.employee.email }" >
							<input type='text' id="email1" name="email1" class="form-control" style="width:150px;">@
            				<input type='text' id="email2" name="email2" class="form-control" style="width:150px;">
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
								 class="form-control col-sm-6 col-xs-6" value="${requestScope.employee.postcode }">
						</div>
						<button type="button" id="findpostcode" class="btn btn-success">�����ȣ ã��</button>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"> <span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address" placeholder="�ּ�" readonly
									required="required" class="form-control col-md-7 col-xs-12"
									value="${requestScope.employee.address }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"><span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="detailAddress" name="detailAddress" placeholder="���ּ�"
								 class="form-control col-md-7 col-xs-12" value="${requestScope.employee.detailAddress }">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="text-center">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button id="modifyBtn" type="submit" class="btn btn-success">����</button>
							<button id="backBtn" class="btn btn-primary" type="button">���</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>