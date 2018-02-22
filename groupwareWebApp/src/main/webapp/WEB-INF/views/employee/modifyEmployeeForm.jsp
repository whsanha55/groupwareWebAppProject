<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원정보 수정</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	$(document).ready(function() {
		
		$('#modiform').on('click','#modifyPwdBtn', function() {
			
			$(this).text('수정 취소');
			$(this).attr('id', 'modicanBtn');
			$(this).attr('class','btn btn-primary');
		//	$(this).css('margin-left','+=10px');
			
			$.ajax ({
				success:function() {
					txt = "";
					txt += '<div class="form-group">';
					txt += '<label class="control-label col-md-3 col-sm-3 col-xs-12" for="empPwd">새 비밀번호 <span class="required">*</span>';
					txt += '</label>';
					txt += '<div class="col-md-4 col-sm-6 col-xs-12">';
					txt += '<input type="password" id="empPwd" name="empPwd" class="form-control col-md-7 col-xs-12">';
					txt += '</div>';
					txt += '</div>';
					txt += '<div class="form-group">';
					txt += '<label class="control-label col-md-3 col-sm-3 col-xs-12" for="empPwdCheck">새 비밀번호 확인 <span class="required">*</span>';
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
			$(this).text('수정');
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
						txt += "<span id='greenSpan' style='color:green;'>비밀번호가 일치합니다.</span>"
					} else {
						txt += "<span id='errorSpan' style='color:red;'>비밀번호가 일치하지 않습니다.</span>"
					} */
					if(data) {
						swal('비밀번호가 일치합니다','','success');
						txt += "<span id='greenSpan'></span>";
						$('input[name=checkPwd]').attr('readonly', true);
					} else {
						swal('비밀번호가 일치하지 않습니다.','','error');
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
					$(this).after('<span id="errorSpan" style="color:red;">4~12자리 사이로 입력해주세요.</span>');
				}
			});		
			$('#modiform').on('blur', 'input[name=empPwdCheck]', function() {	
				if($(this).val() != $('input[name=empPwd]').val()) {
					$(this).after('<span id="errorSpan" style="color:red;">비밀번호가 일치하지 않습니다.</span>');
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
				$('input[name=phoneNumber3]').after('<span id="errorSpan" style="color:red;">연락처를 정확히 입력해주세요.</span>');
			}
		});
		/*
		$('input[name=email1], input[name=email2]').blur(function() {
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var email = $('input[name=email1]').val() + '@' + $('input[name=email2]').val();
			$('#email').val(email);
			if(!regEmail.test($('#email.val()'))) {
				$('select[name=emailaddr]').after('<span id="errorSpan" style="color:red;">이메일을 정확히 입력해주세요.</span>');
			}
		});
		*/
		$('#modifyBtn').on('click', function() {
			event.preventDefault();
			checkUnload = false;
			if($('input[name=checkPwd]').length > 0) {
				if($('input[name=checkPwd]').val().trim() == '') {
					swal("본인확인이 필요합니다.","기존 비밀번호를 입력해주세요.");
					return;
				}
				
				if($("#greenSpan").length ==0) {
					swal("비밀번호 확인을 해주세요.","");
					return;
				}
			}
			if($('input[name=empPwd]').length > 0) {
				if($('input[name=empPwd]').val().trim() == '') {
					swal("새 비밀번호를 입력해주세요.","");
					return;
				}
			}
			if($('input[name=empPwdCheck]').length > 0) {
				if($('input[name=empPwdCheck]').val().trim() == '') {
					swal("새 비밀번호 확인을 해주세요.","");
					return;
				}
			}
			if($('input[name=phoneNumber2]').val() == '' || $('input[name=phoneNumber3]').val() == '' ) {
				swal("연락처를 입력해주세요.","");
				return;
			}
			if($('input[name=email1]').val().trim() == '' || $('input[name=email2]').val().trim() == '') {
				swal("이메일을 입력해주세요.","");
				return;
			}
			if($('input[name=address]').val() == '') {
				swal("주소정보를 입력해주세요.","");
				return;
			}			
			
			if($("#errorSpan").text() != "") {
				swal("정확하지 않은 정보가 있습니다. 다시 확인해주세요.");
				return;
			}
			
			var phoneNumber = $('#phoneNumber1').val() + '-' + $('#phoneNumber2').val() + '-' + $('#phoneNumber3').val();
			$('#phoneNumber').val(phoneNumber);
			var regNumber = $('#regNumber1').val() + '-' + $('#regNumber2').val();
			$('#regNumber').val(regNumber);
			var email = $('#email1').val() + '@' + $('#email2').val();
			$('#email').val(email);
			
			swal({
				title: "사원 수정",
				text: "사원정보를 수정합니다. 계속 진행하시겠습니까?",
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
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullAddr = ''; // 최종 주소 변수
	            var extraAddr = ''; // 조합형 주소 변수
	
	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;
	
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('address').value = fullAddr;
	
	            // 커서를 상세주소 필드로 이동한다.
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
				<h2>사원정보 수정</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="modiform" action="${pageContext.request.contextPath }/modifyEmployee.do" method="POST" 
					data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">사번
						</label>
						<div class="col-md-4 col-sm-6 col-xs-12">
							<input type="text" class="form-control" 
								id="empNo" name="empNo" readonly
								value="${requestScope.employee.empNo }">
						</div>

					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="checkPwd">비밀번호 <span class="required">*</span>
						</label>
						<div class="col-md-4 col-sm-6 col-xs-6">
							<input type="password" id="checkPwd" name="checkPwd"
								 class="form-control col-sm-4 col-xs-6" >
						</div>
						<button type="button" id="checkPwdBtn" class="btn btn-success">비밀번호 확인</button>
						<button type="button" id="modifyPwdBtn" class="btn btn-success">수정</button>
					</div>
					<div id="addPwd">
					<%--
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwd">새 비밀번호 <span class="required">*</span>
						</label>
						<div class="col-md-4 col-sm-6 col-xs-12">
							<input type="password" id="empPwd" name="empPwd"
								 class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwdCheck">새 비밀번호 확인 <span class="required">*</span>
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
							for="empName">이름 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="empName" name="empName" readonly
								 class="form-control col-md-7 col-xs-12" style="width:200px;"
								 value="${requestScope.employee.empName }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="engName">영문 이름
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="engName" name="engName"
								 class="form-control col-md-7 col-xs-12" style="width:200px;"
								 value="${requestScope.employee.engName }">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="phoneNumber">연락처 <span class="required">*</span>
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
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">이메일 <span class="required">*</span>
						</label>
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="email" name="email" value="${requestScope.employee.email }" >
							<input type='text' id="email1" name="email1" class="form-control" style="width:150px;">@
            				<input type='text' id="email2" name="email2" class="form-control" style="width:150px;">
			              <select name="emailaddr" class="form-control">
			                 <option value="">직접입력</option>
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
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2">주소 <span class="required">*</span>
						</label>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly
								 class="form-control col-sm-6 col-xs-6" value="${requestScope.employee.postcode }">
						</div>
						<button type="button" id="findpostcode" class="btn btn-success">우편번호 찾기</button>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"> <span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address" placeholder="주소" readonly
									required="required" class="form-control col-md-7 col-xs-12"
									value="${requestScope.employee.address }">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"><span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"
								 class="form-control col-md-7 col-xs-12" value="${requestScope.employee.detailAddress }">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="text-center">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button id="modifyBtn" type="submit" class="btn btn-success">수정</button>
							<button id="backBtn" class="btn btn-primary" type="button">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>