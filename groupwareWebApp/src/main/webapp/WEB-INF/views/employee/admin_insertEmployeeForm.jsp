<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원등록</title>
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
						text += '<option value="">팀선택</option>';					
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
				  title: "사원 등록",
				  text: "사원을 등록합니다. 계속 진행하시겠습니까?",
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
				$(this).after('<span style="color:red;">5~12자리 사이로 입력해주세요.</span>');
			}
		});
				
		$('input[name=empPwdCheck]').focus(function() {
			if($(this).next('span').text() != null){
				$(this).next('span').remove();
			}
		});
		
		$('input[name=empPwdCheck]').blur(function() {
			
			if($(this).val() != $('input[name=empPwd]').val()) {
				$(this).after('<span style="color:red;">비밀번호가 일치하지 않습니다.</span>');
			}
		});
		
		$('#regibtn').on('click', function() {
			event.preventDefault();
			checkUnload = false;
			if($('input[name=upload]').val().trim() == '') {
				swal("프로필 사진을 추가해주세요.","");
				return;
			}
			if($('input[name=empName]').val().trim() == '') {
				swal("사원이름을 입력해주세요.","");
				return;
			}
			if($('input[name=empPwd]').val().trim() == '') {
				swal("비밀번호를 입력해주세요.","");
				return;
			}
			if($('input[name=empPwdCheck]').val().trim() == '') {
				swal("비밀번호 확인을 입력해주세요.","");
				return;
			}
			if($('input[name=phoneNumber2]').val() == '' || $('input[name=phoneNumber3]').val() == '' ) {
				swal("연락처를 입력해주세요.","");
				return;
			}
			if($('input[name=regNumber1]').val() == '' || $('input[name=regNumber2]').val() == '') {
				swal("주민등록번호를 입력해주세요.","");
				return;
			}
			if($('input[name=dutyCode]').val().trim() == '') {
				swal("직책을 선택해주세요.","");
				return;
			}
			if($('input[name=deptCode]').val().trim() == '') {
				swal("부서를 선택해주세요.","");
				return;
			}
			if($('input[name=email1]').val().trim() == '' || $('input[name=email2]').val().trim() == '') {
				swal("이메일 입력해주세요.","");
				return;
			}
			if($('input[name=address]').val() == '') {
				swal("주소정보를 입력해주세요.","");
				return;
			}
			
			var phoneNumber = $('#phoneNumber1').val() + '-' + $('#phoneNumber2').val() + '-' + $('#phoneNumber3').val();
			$('#phoneNumber').val(phoneNumber);
			var regNumber = $('#regNumber1').val() + '-' + $('#regNumber2').val();
			$('#regNumber').val(regNumber);
			var email = $('#email1').val() + '@' + $('#email2').val();
			$('#email').val(email);
			
			swal({
				title: "사원 등록",
				text: "사원을 등록합니다. 계속 진행하시겠습니까?",
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
	

	/* //양식 등록 함수
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
			swal("프로필 사진을 등록해주세요!", "");
			return;
		}
		
		if(empName == "") {
			swal("이름을 입력해주세요!", "");
			return;
		}
		
		if(engName == "") {
			swal("영문 이름을 입력해주세요!", "");
			return;
		}
		
		if(empPwd == "") {
			swal("비밀번호를 입력해주세요!", "");
			return;
		}
		
		if(phoneNumber == "") {
			swal("연락처를 입력해주세요!", "");
			return;
		}
		
		if(deptCode == "") {
			swal("부서를 선택해주세요!", "");
			return;
		}
		
		if(dutyCode == "") {
			swal("직책을 선택해주세요!", "");
			return;
		}
		
		if(email == "") {
			swal("이메일을 입력해주세요!", "");
			return;
		}
		
		if(regNumber == "") {
			swal("주민번호를 입력해주세요", "");
			return;
		}
		
		if(postcode == "") {
			swal("주소등록을 위해 우측 주소찾기 버튼을 이용해주세요!", "");
			return;
		}
		
		if(detailAddress == "") {
			swal("상세 주소 정보를 입력해주세요!.", "");
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
				if(data == "등록 완료") {
					swal({
						  title: "등록 완료",
						  text: "사원정보가 등록되었습니다.",
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
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
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
				<h2>사원등록</h2>
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
						<label class="control-label col-md-3 col-sm-3 col-xs-12">프로필 사진 </label>
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
							for="empName">이름 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="empName" name="empName"
								 class="form-control col-md-7 col-xs-12" style="width:200px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="engName">영문 이름
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="engName" name="engName"
								 class="form-control col-md-7 col-xs-12" style="width:200px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwd">비밀번호 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwd" name="empPwd"
								 class="form-control col-md-7 col-xs-12" style="width:300px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwdCheck">비밀번호 확인 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwdCheck" name="empPwdCheck"
								 class="form-control col-md-7 col-xs-12" style="width:300px;">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="phoneNumber">연락처 <span class="required">*</span>
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
							for="regNumber">주민번호 <span class="required">*</span>
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
							for="last-name">직책 <span class="required">*</span>
						</label>&nbsp;&nbsp;
						<select id="dutyBtn" name="dutyBtn" style="width:100px;height:30px;">
							<option value="">직책선택</option>
							<c:forEach var="dutyCode" items="${requestScope.dutyCodes }" varStatus="loop">
								<option value="${pageScope.dutyCode.cNo }">${pageScope.dutyCode.cName }</option>
							</c:forEach>
						</select>
					</div>
					<div id="form-dept" class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="deptBtn">부서 <span class="required">*</span>
						</label>&nbsp;&nbsp;
						
						<select id="deptBtn" name="deptBtn" style="width:100px;height:30px;">
								<option value="">부서선택</option>
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</option>
							</c:forEach>
						</select>		
					</div>

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">이메일 <span class="required">*</span>
						</label>
						<div class="form-inline col-md-6 col-sm-6 col-xs-12">
							<input type="hidden" id="email" name="email" value="" >
							<input type='text' id="email1" name="email1" class="form-control" style="width:150px;">@
            				<input type='text' id="email2" name="email2" class="form-control" style="width:250px;">
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
								 class="form-control col-sm-6 col-xs-6">
						</div>
						<button type="button" id="findpostcode" class="btn btn-success">우편번호 찾기</button>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"> <span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address" placeholder="주소" readonly
									required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2"><span class="required"></span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"
								 class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="center-block" align="center">
							<c:url var="listEmployeeURL" value="/admin/listEmployee.do" scope="page" ></c:url>
							<a id="list" href="${pageScope.listEmployeeURL }"><button class="btn btn-primary" type="button">목록</button></a>
							<button id="regibtn" type="submit" class="btn btn-success">사원등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>