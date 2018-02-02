<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
</head>
<body>
	<!-- 역할 리스트 -등록,미등록 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>역할 등록리스트</h2>

				<div class="clearfix"></div>
			</div>
			<div>
				<div class="btn-group">
					<button data-toggle="dropdown"
						class="btn btn-default dropdown-toggle" type="button"
						aria-expanded="false">
						검색조건 <span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu">
						<li><a href="#">롤명</a></li>
						<li><a href="#">롤설명</a></li>
					</ul>
					<div class="col-sm-3">
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

			</div>
			<div class="x_content">



				<div class="table-responsive">
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th class="column-title">롤 ID</th>
								<th class="column-title">롤 명</th>
								<th class="column-title">롤 타입</th>
								<th class="column-title">롤 설명</th>
								<th class="column-title">등록일자</th>
								<th class="column-title">등록여부</th>

							</tr>
						</thead>

						<tbody>
							<tr class="even pointer">
								<td>R00001</td>

								<td>공지사항 수정</td>
								<td>url</td>
								<td>/user/auth/modifyNotice.do</td>
								<td>2018.01.01</td>
								<td><label class="radio-inline"> <input
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="option1"> 등록
								</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
										미등록
								</label></td>
							</tr>
							<tr class="even pointer">
								<td>R00001</td>

								<td>공지사항 수정</td>
								<td>url</td>
								<td>/user/auth/modifyNotice.do</td>
								<td>2018.01.01</td>
								<td><label class="radio-inline"> <input
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="option1"> 등록
								</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
										미등록
								</label></td>
							</tr>
							<tr class="even pointer">
								<td>R00001</td>

								<td>공지사항 수정</td>
								<td>url</td>
								<td>/user/auth/modifyNotice.do</td>
								<td>2018.01.01</td>
								<td><label class="radio-inline"> <input
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="option1"> 등록
								</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
										미등록
								</label></td>
							</tr>
							<tr class="even pointer">
								<td>R00001</td>

								<td>공지사항 수정</td>
								<td>url</td>
								<td>/user/auth/modifyNotice.do</td>
								<td>2018.01.01</td>
								<td><label class="radio-inline"> <input
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="option1"> 등록
								</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
										미등록
								</label></td>
							</tr>
							<tr class="even pointer">
								<td>R00001</td>

								<td>공지사항 수정</td>
								<td>url</td>
								<td>/user/auth/modifyNotice.do</td>
								<td>2018.01.01</td>
								<td><label class="radio-inline"> <input
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="option1"> 등록
								</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
										미등록
								</label></td>
							</tr>
							<tr class="even pointer">
								<td>R00001</td>

								<td>공지사항 수정</td>
								<td>url</td>
								<td>/user/auth/modifyNotice.do</td>
								<td>2018.01.01</td>
								<td><label class="radio-inline"> <input
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="option1"> 등록
								</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
										미등록
								</label></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<div class="text-center">
						<ul class="pagination ">
							<li class="disabled"><a href="#"><span
									class="glyphicon glyphicon-chevron-left"></span></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-chevron-right"></span></a></li>
						</ul>

					</div>
					<button class="pull-right">일괄 등록</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>