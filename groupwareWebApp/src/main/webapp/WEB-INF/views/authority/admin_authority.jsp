<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
</head>
<body>
	<!-- 권한 추가 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>권한 등록</h2>

				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-12" style="margin: 40px 0;">
					<label class="control-label col-md-2" for="first-name">권한 명
					</label>
					<div class="col-md-8">
						<input type="text" id="first-name2" required="required"
							class="form-control col-md-7 col-xs-12">
					</div>
				</div>
				<div class="col-md-12" style="margin-bottom: 40px;">
					<label class="control-label col-md-2" for="first-name">유무 </label>
					<div class="col-md-8">
						<p>유 :
						<div class="iradio_flat-green checked" style="position: relative;">
							<input type="radio" class="flat" name="gender" id="genderM"
								value="M" checked="" required=""
								style="position: absolute; opacity: 0;">
							<ins class="iCheck-helper"
								style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
						</div>
						무 :
						<div class="iradio_flat-green" style="position: relative;">
							<input type="radio" class="flat" name="gender" id="genderF"
								value="F" style="position: absolute; opacity: 0;">
							<ins class="iCheck-helper"
								style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
						</div>
						</p>
					</div>
				</div>
				<div class="col-md-12" style="margin: 40px 0;">
					<label class="control-label col-md-2" for="first-name">사번 </label>
					<div class="col-md-8">
						<input type="text" id="first-name2" required="required"
							class="form-control col-md-7 col-xs-12">
					</div>
				</div>
				<div class="col-md-12" style="margin: 40px 0;">
					<label class="control-label col-md-2" for="first-name">이름 </label>
					<div class="col-md-8">
						<input type="text" id="first-name2" required="required"
							class="form-control col-md-7 col-xs-12">
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<button class="btn btn-primary pull-right">찾기</button>
			</div>
			<div class="col-md-12">
				<div class="text-center">
					<button class="btn btn-primary">등록</button>
					<button class="btn btn-default">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>