<%--admin_authority.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	
	$('#insert').on('click',function(){
		if($($('input:text[name=aName]')).val() == "" ){
			swal("이름을 입력하세요.");
			$('#aName').focus();
			return false;
		} 
		
		if(!($('input:radio[name=aWhether]').is(':checked'))){
			swal("사용유무를 선택해주세요.");
			$('input:radio[name=aWhether]').focus;
			return false;
	   }
		
		if($($('textarea[name=aNote]')).val() == "" ){
			swal("내용을 입력하세요.");
			$('#aNote').focus();
			return false;
		} 
		
	});
});
</script>
</head>
<body>
	<!-- 권한 추가 -->
	
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>권한 등록</h2>

				<div class="clearfix"></div>
			</div>
			<form action="${pageContext.request.contextPath }/admin/authority.do" method="post">
			<input type="hidden" name=aNo />
			<div class="x_content">
				
				<div class="col-md-12" style="margin: 40px 0;">
					<label class="control-label col-md-2" for="first-name">권한 명
					</label>
					<div class="col-md-8">
						<input type="text" id="first-name2" required="required" name="aName" id="aName"
							class="form-control col-md-7 col-xs-12">
					</div>
				</div>
				<div class="col-md-12" style="margin-bottom: 40px;">
					<label class="control-label col-md-2" for="first-name">유무 </label>
					<div class="col-md-8">
						<label class="radio-inline"> <input name="aWhether"
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="0"> 유
								</label> <label class="radio-inline"> <input type="radio"  name="aWhether"
										name="inlineRadioOptions" id="inlineRadio2" value="1">
									   무
								</label>
					</div>
				</div>
				<div class="col-md-12" style="margin: 40px 0;">
					<label class="control-label col-md-2" for="first-name">비고 </label>
					<div class="col-md-8">
						<textarea class="form-control" rows="5" name="aNote" id="aNote"></textarea>
					</div>
				</div>
			
			</div>
			<div class="col-md-12">
				<div class="text-center">
					<button class="btn btn-primary" type="submit" id="insert">등록</button>
					<button class="btn btn-primary" type="reset">취소</button>
					<a class="btn btn-primary" href='<c:url value="/admin/authorityList.do"/>'>뒤로가기</a>
				</div>
			</div>
			</form>	
		</div>
	</div>
	
</body>
</html>