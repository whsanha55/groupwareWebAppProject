<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>대결권자 등록</title>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>대결권자 설정</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left">
					<div class="form-group form-inline">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">대결권자 지정 </label>&nbsp;&nbsp;
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control"> <span class="input-group-btn">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#myModal">검색</button>
								<button class="btn btn-primary" type="reset">삭제</button>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">사유 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" id="last-name" name="last-name"
								required="required" class="form-control col-md-7 col-xs-12">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<button class="btn btn-primary" type="button">Cancel</button>
							<button class="btn btn-primary" type="reset">Reset</button>
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
					<div class="ln_solid"></div>
					<table id="datatable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>사번</th>
								<th>이름</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>사유</th>
								<th>진행여부</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2015-00035</td>
								<td>김대리</td>
								<td>2018/01/05</td>
								<td>2018/01/10</td>
								<td>연차</td>
								<td>X</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>2015-00036</td>
								<td>박대리</td>
								<td>2018/01/10</td>
								<td>2018/01/15</td>
								<td>병가</td>
								<td>X</td>
								<td><button type="button">상세보기</button></td>
							</tr>
							<tr>
								<td>2015-00037</td>
								<td>이대리</td>
								<td>2018/01/15</td>
								<td>2018/01/30</td>
								<td>프로젝트</td>
								<td>O</td>
								<td><button type="button">상세보기</button></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">대결권자 지정</h4>
					※부서와 이름, 기간을 지정해주세요.
				</div>
				<div class="modal-body">
					<div>
						<div class="btn-group">
							<button data-toggle="dropdown"
								class="btn btn-default dropdown-toggle" type="button"
								aria-expanded="false">
								검색조건 <span class="caret"></span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li><a href="#">경영관리부</a></li>
								<li><a href="#">인사부</a></li>
								<li><a href="#">회계부</a></li>
								<li><a href="#">개발부</a></li>
								<li><a href="#">영업부</a></li>
							</ul>
							<div class="col-sm-6">
								<div id="imaginary_container">
									<div class="input-group stylish-input-group">
										<input type="text" class="form-control" placeholder="Search">
										<span class="input-group-addon" style="padding: 3px 10px">
											<button type="submit">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings">
									<th class="column-title">부서</th>
									<th class="column-title">직책</th>
									<th class="column-title">이름</th>
								</tr>
							</thead>
							<tbody>
								<tr class="even pointer">
									<td><a data-toggle="modal" data-target="#myModal">영업부</a><a></a></td>
									<td class=" ">부장</td>
									<td class=" ">영부장</td>
								</tr>
							</tbody>
						</table>
						<div class="form-group form-inline col-md-12">
							<div class="form-group">
								<label for="ex3">기간지정 :</label> <input type="date" id="ex3"
									class="form-control" placeholder=" ">
							</div>
							<div class="form-group">
								<label for="ex4">~</label> <input type="date" id="ex4"
									class="form-control" placeholder=" ">
							</div>
						</div>
					</div>
					<br>
					<div class="text-center">
						<button type="button" class="btn btn-primary">설정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>