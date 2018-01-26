<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자_이력조회</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>이력조회</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2"></div>
						</div>
						<div>
							<div class="col-md-3 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown">
											<span id="search_concept">검색</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#contains">코드번호</a></li>
											<li><a href="#its_equal">코드명</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all"
										id="search_param"> <input type="text"
										class="form-control" name="x" placeholder="Search term...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
				<table id="datatable"
					class="table table-striped table-bordered text-center">
					<thead>
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>부서</th>
							<th>직책</th>
							<th>변경 일자</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>2007-00001</td>
							<td>박병진</td>
							<td>경영관리부</td>
							<td>사원</td>
							<td>2018/01/01</td>
						</tr>
						<tr>
							<td>2007-00002</td>
							<td>원정우</td>
							<td>경영관리부</td>
							<td>사원</td>
							<td>2018/01/05</td>
						</tr>
						<tr>
							<td>2007-00003</td>
							<td>김사원</td>
							<td>회계부</td>
							<td>사원</td>
							<td>2018/01/15</td>
						</tr>
						<tr>
							<td>2007-00004</td>
							<td>박대리</td>
							<td>개발1팀</td>
							<td>대리</td>
							<td>2018/01/20</td>
						</tr>
						<tr>
							<td>2007-00005</td>
							<td>이부장</td>
							<td>개발부</td>
							<td>부장</td>
							<td>2018/01/22</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>