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
						text += '<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" id="teamBtn" type="button" aria-expanded="false">��';
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
                document.getElementById('address2').focus();
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
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
								action="${pageContext.request.contextPath }/admin/registerEmployee.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="deptCode" value="" />
					<input type="hidden" name="dutyCode" value="" />			
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
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empName">�̸� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="engName" name="engName"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwd">��й�ȣ <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwd" name="empPwd"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="empPwdCheck">��й�ȣ Ȯ�� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="password" id="empPwdCheck" name="empPwdCheck"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="phoneNumber">����ó <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="phoneNumber" name="phoneNumber"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="regNumber">�ֹι�ȣ <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="regNumber" name="regNumber"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" 
							for="last-name">��å <span class="required">*</span>
						</label>&nbsp;&nbsp;
						<button data-toggle="dropdown"
							class="btn btn-default dropdown-toggle" id="dutyBtn" type="button" value="cName"
							aria-expanded="true">��å <span class="caret"></span>
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
							for="deptBtn">�μ� <span class="required">*</span>
						</label>&nbsp;&nbsp;
						
						<button data-toggle="dropdown"
							class="btn btn-default dropdown-toggle" id="deptBtn" type="button"
							aria-expanded="false">�μ� <span class="caret"></span>
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
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">�̸��� <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-6" for="sample6_address2">�ּ� <span class="required">*</span>
						</label>
						<div class="col-md-3 col-sm-6 col-xs-6">
							<input type="text" id="postcode" name="postcode" placeholder="�����ȣ" readonly
									required="required" class="form-control col-sm-6 col-xs-6">
						</div>
						<button type="button" id="findpostcode" class="btn btn-success">�����ȣ ã��</button>
					</div>
					
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address" placeholder="�ּ�" readonly
									required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="detailAddress" name="detailAddress" placeholder="���ּ�"
									required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">���</button>
							<button type="submit" class="btn btn-success">������</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>