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
  height: 35px;
  font-size: 14px;
  line-height: 30px;
  color:#fff;
  content: '파일선택';
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
  height: 35px;
  overflow: hidden;
}
</style>
<script>

	$(document).ready(function() {
		$("#upload-image").on("change", handleImgFileSelect);
		
		$('#upload-image').on('change', function() {
			if($('#upload-image').val() == "") {
				$('#img').attr('src','${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/noimage.jpg'); 
			}	
		});
		
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
				}
			});
		});
		
		$('#canbtn').click(function() {
			location.href="${pageContext.request.contextPath}/index.do";
		});
		
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				swal("확장자는 이미지 확장자만 가능합니다.","","error");
				$('#upload-image').val("");
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

						<div class="form-group" id="img_wrap">
							<%-- <i class="fa fa-picture-o"> --%>
							<div class="form-group" id="img_wrap">
							<%-- <i class="fa fa-picture-o"> --%>
							<img id="img" src="${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/noimage.jpg" 
									width="250px" height="250px"  style=" border: 2px solid #ccc;"   class="img-responsive center-block"/>
							<input id="upload-image" name="upload" class='center-block' style="margin-top:2px;"
								type="file" data-role="magic-overlay" data-target="#signBtn"
								data-edit="insertImage">
							</div>
						</div>
					<div class="ln_solid"></div>
					<div class="form-group text-center">
						<button id="canbtn" type="button" class="btn btn-primary">취소</button>
						<button id="regSignBtn" type="button" class="btn btn-success">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>