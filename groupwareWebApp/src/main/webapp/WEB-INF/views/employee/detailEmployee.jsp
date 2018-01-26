<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내 정보</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>개인정보</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
					<div class="profile_img">
						<div id="crop-avatar">
							<!-- Current avatar -->
							<img class="img-responsive avatar-view" src="images/iu.jpg"
								alt="Avatar" title="Change the avatar">
						</div>
					</div>
					<h3>이지은</h3>
					<br> <a href="profile_modify.html" class="btn btn-success"><i
						class="fa fa-edit m-right-xs"></i>사원 정보 수정</a> <br>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="profile_title">
						<div class="col-md-6">
							<h2>사원정보</h2>
						</div>
						<div class="col-md-6"></div>
					</div>
					<table id="datatable" class="table table-striped table-bordered">
						<tbody>
							<tr>
								<th>이름</th>
								<td>이지은</td>
							</tr>
							<tr>
								<th>사번</th>
								<td>2018-00001</td>
							</tr>
							<tr>
								<th>입사일자</th>
								<td>2018/01/01</td>
							</tr>
							<tr>
								<th>부서</th>
								<td>개발1팀</td>
							</tr>
							<tr>
								<th>직책</th>
								<td>사원</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>010-2346-6789</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>iu123@naver.com</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>서울시 서초구 테헤란로</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>