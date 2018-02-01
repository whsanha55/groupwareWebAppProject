<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원등록</title>
<script>
	$(document).ready(function () {		
		
		$('#dutyBtnList li > a').on('click', function() {
		    $('#dutyBtn').text($(this).text());
		    $('input[name=dutyCode]').val($(this).attr('value'));
		});
		
		$('#deptBtnList li > a').on('click', function() {	
			$('#deptBtn').text($(this).text());
		    $('input[name=deptCode]').val($(this).attr('value'));		    
		    /* 
			$.ajax ({
				url: "${pageContext.request.contextPath}/admin/checkRelation.do"
				,
				method: 'POST'
				,
				data: {
					deptCode: $('input[name=deptCode]').val($(this).attr('value'))
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					alert("hi");
					if(data == 1) {
						
						text += '<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" id="teamBtn" type="button" aria-expanded="true">팀<span class="caret"></span></button>';
						text += '<ul id="teamBtnList" role="menu" class="dropdown-menu" aria-labelledby="searchType">';
						text += '<c:forEach var="relationdeptCode" items="${requestScope.relationdeptCodes }" varStatus="loop">';
						text += '<li role="presentation">';
						text += '<a role="menuitem" tabindex="-1" href="#" value="${pageScope.relationdeptCode.cNo }">${pageScope.relationdeptCode.cName }</a>';
						text += '</li>';
						text += '</c:forEach> ';
						text += '</ul>';	
						$('#form-dept').find('ul').html(text); 
					}
				}
				,
				error: function(jqXHR) {
					alert('error : ' + jqXHR.status);
				}
			}); */
		});
		
		
		
		
	});
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
						<label class="control-label col-md-3 col-sm-3 col-xs-12">프로필 사진 </label>
						<div class="btn-group">
							<a class="btn" title="Insert picture (or just drag &amp; drop)"
								id="pictureBtn"><i class="fa fa-picture-o"></i></a> <input name="upload"
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
							aria-expanded="true">부서 <span class="caret"></span>
						</button>
						<ul id="deptBtnList" role="menu" class="dropdown-menu" aria-labelledby="searchType">
						<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="#" value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</a>
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
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">주소 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="address" name="address" required="required" class="form-control col-md-7 col-xs-12">
						</div>
						<button type="button" class="btn btn-success">주소찾기</button>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">Cancel</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>