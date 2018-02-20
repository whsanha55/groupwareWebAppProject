<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>서명등록</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

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
				<h2>서명설정</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="regSign" data-parsley-validate="" class="form-horizontal form-label-left" 
						action="${pageContext.request.contextPath }/registerSign.do" method="POST" 
						enctype="multipart/form-data">
					<div class="form-group">
						<div class="form-group" id="img_wrap">
							<%-- <i class="fa fa-picture-o"> --%>
							<img id="img" width="250px" height="250px" class="img-responsive center-block"/>
						</div>				
						<label class="control-label col-md-4 col-sm-3 col-xs-6">서명</label>
						<div class="btn-group center-block">
							<a class="btn center-block" title="Insert picture (or just drag &amp; drop)"
								id="signBtn"></a> 
								<input id="upload-image" name="upload"
								type="file" data-role="magic-overlay" data-target="#signBtn"
								data-edit="insertImage">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-8 col-xs-12 col-md-offset-3 text-center">
							<button class="btn btn-primary" type="button">취소</button>
							<button id="regSignBtn" type="submit" class="btn btn-success">등록</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>