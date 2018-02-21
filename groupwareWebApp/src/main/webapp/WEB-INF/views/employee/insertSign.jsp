<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>서명등록</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
input[type=file]:before {
  width: 80px;
  height: 30px;
  font-size: 14px;
  line-height: 30px;
  color:#fff;
  content: '사진선택';
  display: inline-block;
  background: #26B99A;
    border: 1px solid #169F85;
       border-radius: 3px;
  padding: 0 10px;
  text-align: center;
  font-family: Helvetica, Arial, sans-serif;
}

input[type=file] {
  cursor: pointer;
  width: 80px;
  height: 30px;
  overflow: hidden;
}
</style>
<script>

	$(document).ready(function() {
		$("#upload-image").on("change", handleImgFileSelect);
		
		$('#regSignBtn').click(function() {
			if($('#upload-image').val() == "") {
				swal("등록할 서명파일을 첨부해주세요.","");
				return;
			}
			
			swal({
				title: "서명 등록",
				text: "서명을 등록합니다. 계속 진행하시겠습니까?",
				icon: "info",
				buttons : true 
			}).then((e) => {
				if(e) {
					$('#regSign').submit();
				} else if(!e) {
					return;
				}
			});
		});		
		
	});

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
							<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
								<i class="fa fa-picture-o"></i></a>
								<input id="upload-image" name="upload"
								type="file" data-role="magic-overlay" data-target="#signBtn"
								data-edit="insertImage">
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-8 col-xs-12 col-md-offset-3 text-center">
							<button id="regSignBtn" type="button" class="btn btn-success">등록</button>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>