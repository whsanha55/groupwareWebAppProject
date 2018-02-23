<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	$(document).ready(function() {
		
		$('#modifyBtn').click(function() {
			if($('#upload-image').val() == "") {
				swal("������ ������ ������ּ���.","");
				return;
			}
			
			swal({
				title: "���� ����",
				text: "������ �����մϴ�. ��� �����Ͻðڽ��ϱ�?",
				icon: "info",
				buttons : true 
			}).then((e) => {
				if(e) {
					$('#modisign').submit();
				} else if(!e) {
					return;
				}
			});
			
			/* $.ajax({
				url:'${pageContext.request.contextPath}/modifySign.do',
				method:'POST',
				dataType:'json',
				success:function(data) {
					if(data == "����") {
						
					}
				},
				error:function(jqXHR) {
					alert('error :' + jqXHR.status);
				}
			}); */
		});		
		
		$('#removeBtn').click(function() {
			
			swal({
				 title: "���� ����",
				 text: "������ �����մϴ�. ��� �����Ͻðڽ��ϱ�?",
				 icon: "info",
				 buttons : true	
			}).then((e) => {
				if(e) {
					removeSign();
				}
			});
			
			function removeSign(){
				$.ajax ({
					url:'${pageContext.request.contextPath}/removeSign.do',
					method:'POST',
					dataType:'json',
					success:function(data) {
						if(data=="�����Ϸ�"){
							swal({
								  title: "���� �Ϸ�",
								  text: "������ �����Ǿ����ϴ�.",
								  icon: "info",
								  buttons : "Ȯ��" 
							}).then((e) => {
								if(e) {
									location.href="${pageContext.request.contextPath}/retrieveSign.do";
								}
							});	
						}
					},
					error:function(jqXHR) {
						alert("error : " + jqXHR.status);
					}
				});
			}
		});
		
		$("#upload-image").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				swal("Ȯ���ڴ� �̹��� Ȯ���ڸ� �����մϴ�.","","error");
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
<style>
input[type=file] {
  cursor: pointer;
  width: 80px;
  height: 30px;
  overflow: hidden;
}

input[type=file]:before {
  width: 80px;
  height: 30px;
  font-size: 14px;
  line-height: 30px;
  color:#fff;
  content: '��������';
  display: inline-block;
  background: #26B99A;
    border: 1px solid #169F85;
       border-radius: 3px;
  padding: 0 10px;
  text-align: center;
  font-family: Helvetica, Arial, sans-serif;
}
</style>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>������ȸ</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="modisign" data-parsley-validate="" action="${pageContext.request.contextPath }/modifySign.do"
						method="POST" class="form-horizontal form-label-left" enctype="multipart/form-data">
					<div class="form-group">
						<div class="form-group" id="img_wrap">
							<img id="img" width="250px" height="250px" style=" border: 2px solid #ccc;"
								src="${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/${requestScope.signName}"
								class="img-responsive center-block"/>
							<input id="upload-image" name="upload" class="center-block" style="margin-top:2px;"
								type="file" data-role="magic-overlay" data-target="#pictureBtn"
								data-edit="insertImage">			
						</div>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3 text-center">
							<button id="modifyBtn" type="button" class="btn btn-success">����</button>
							<button id="removeBtn" type="button" class="btn btn-primary">����</button>							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>