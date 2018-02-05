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
<script>
	$(document).ready(function () {		
		
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
						text += '<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" id="teamBtn" type="button" aria-expanded="false">팀';
						text += '<span class="caret"></span></button>';					
						text += '<ul id="teamBtnList" role="menu" class="dropdown-menu" aria-labelledby="d2Label">';
						
						for (var i = 0; i<data.length; i++) {
							text += '<li role="presentation">';
							text += '<a role="menuitem" href="#" value="'+ data[i].cNo +'">'+ data[i].cName +'</a>';
							text += '</li>';
						}
						
						text += '</ul>';	
						
						$(text).appendTo('#form-dept');						
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
		
		$("#form-dept").on('click','#teamBtnList li > a', function () {
			$("#teamBtn").text($(this).text());
			$('input[name=deptCode]').val($(this).attr('value'));
		});
		
		$("#upload-image").on("change", handleImgFileSelect);
		
		$("#findpostcode").click(execDaumPostcode); 
		//onclick="sample6_execDaumPostcode()" 
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
                document.getElementById('address2').focus();
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
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
								action="${pageContext.request.contextPath }/admin/registerEmployee.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="deptCode" value="" />
					<input type="hidden" name="dutyCode" value="" />			
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
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empName">이름 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="engName" name="engName"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwd">비밀번호 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwd" name="empPwd"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwdCheck">비밀번호 확인 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwdCheck" name="empPwdCheck"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="phoneNumber">연락처 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="phoneNumber" name="phoneNumber"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="regNumber">주민번호 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="regNumber" name="regNumber"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" 
							for="last-name">직책 <span class="required">*</span>
						</label>&nbsp;&nbsp;
						<button data-toggle="dropdown"
							class="btn btn-default dropdown-toggle" id="dutyBtn" type="button" value="cName"
							aria-expanded="true">직책 <span class="caret"></span>
						</button>
						<ul id="dutyBtnList" role="menu" class="dropdown-menu" aria-labelledby="searchType">
							<c:forEach var="dutyCode" items="${requestScope.dutyCodes }" varStatus="loop">
								<li role="presentation">
									<a role="menuitem" tabindex="-1" href="#" value="${pageScope.dutyCode.cNo }">${pageScope.dutyCode.cName }</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div id="form-dept" class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="deptBtn">부서 <span class="required">*</span>
						</label>&nbsp;&nbsp;
						
						<button data-toggle="dropdown"
							class="btn btn-default dropdown-toggle" id="deptBtn" type="button"
							aria-expanded="false">부서 <span class="caret"></span>
						</button>
						<ul id="deptBtnList" role="menu" class="dropdown-menu" aria-labelledby="dLabel">
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<li role="presentation">
									<a role="menuitem" href="#" value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</a>
								</li>
							</c:forEach>
						</ul>						
					</div>

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">이메일 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2">주소 <span class="required">*</span>
						</label>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly
									required="required" class="form-control col-sm-6 col-xs-6">
						</div>
						<button type="button" id="findpostcode" class="btn btn-success">우편번호 찾기</button>
					</div>
					
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address" placeholder="주소" readonly
									required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"
									required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">취소</button>
							<button type="submit" class="btn btn-success">사원등록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>