<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원등록</title>
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
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">프로필 사진 </label>
						<div class="btn-group">
							<a class="btn" title="Insert picture (or just drag &amp; drop)"
								id="pictureBtn"><i class="fa fa-picture-o"></i></a> <input
								type="file" data-role="magic-overlay" data-target="#pictureBtn"
								data-edit="insertImage">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">사번
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control" disabled="disabled"
								placeholder="2018-00050">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">이름 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">비밀번호 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">비밀번호 확인 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">연락처 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">주민번호 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="last-name">부서 <span class="required">*</span>
						</label>&nbsp;&nbsp;
						<button data-toggle="dropdown"
							class="btn btn-default dropdown-toggle" type="button"
							aria-expanded="false">부서 <span class="caret"></span>
						</button>
						<ul role="menu" class="dropdown-menu">
							<li>경영관리부</li>
							<li>인사부</li>
							<li>회계부</li>
							<li>영업부</li>
							<li>개발부</li>
						</ul>
						<button data-toggle="dropdown"
							class="btn btn-default dropdown-toggle" type="button"
							aria-expanded="false">부서 <span class="caret"></span>
						</button>
						<ul role="menu" class="dropdown-menu">
							<li>영업1팀</li>
							<li>영업2팀</li>
						</ul>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">직책 <span class="required">*</span>
						</label>&nbsp;&nbsp;
						<button data-toggle="dropdown"
							class="btn btn-default dropdown-toggle" type="button"
							aria-expanded="false">직책 <span class="caret"></span>
						</button>
						<ul role="menu" class="dropdown-menu">
							<li>사장</li>
							<li>부사장</li>
							<li>부장</li>
							<li>팀장</li>
							<li>대리</li>
							<li>사원</li>
						</ul>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">이메일 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">주소 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name" required="required" class="form-control col-md-7 col-xs-12">
						</div>
						<button type="button" class="btn btn-success">주소찾기</button>
					</div>
					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">Cancel</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>