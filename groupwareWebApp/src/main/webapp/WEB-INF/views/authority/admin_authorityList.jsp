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
	<!-- 등록된 관리자 리스트 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>등록된 관리자 리스트</h2>

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
						<li><a href="#">아이디</a></li>
						<li><a href="#">이름</a></li>
						<li><a href="#">권한명</a></li>
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
					<a class="btn btn-primary pull-right"
						href='<c:url value="/admin/authority.do"/>'>추가</a>
				</div>

			</div>
			<div class="x_content">



				<div class="table-responsive">
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox" id="ex_chk"> </th>
								<th class="column-title">권한번호</th>
								<th class="column-title">권한명</th>
								<th class="column-title">비고</th>
								<th class="column-title">유무</th>
								<th class="column-title">관리</th>

							</tr>
						</thead>

						<tbody>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td><a data-toggle="modal" data-target="#myModal">A00001<a></td>

								<td class=" ">전체관리자</td>
								<td class=" ">커뮤니티 접근 (** .do 접근 롤 부여)</td>
								<td class=" ">유</td>
								<td class=" ">역할</a>
									<button>수정</button></td>

								</td>
							</tr>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td class=" ">A00001</td>
								<td class=" ">전체관리자</td>
								<td class=" ">커뮤니티 접근 (** .do 접근 롤 부여)</td>
								<td class=" ">유</td>
								<td class=" "><button>역할</button>
									<button>수정</button></td>

								</td>
							</tr>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td class=" ">A00001</td>
								<td class=" ">전체관리자</td>
								<td class=" ">커뮤니티 접근 (** .do 접근 롤 부여)</td>
								<td class=" ">유</td>
								<td class=" "><button>역할</button>
									<button>수정</button></td>

								</td>
							</tr>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td class=" ">A00001</td>
								<td class=" ">전체관리자</td>
								<td class=" ">커뮤니티 접근 (** .do 접근 롤 부여)</td>
								<td class=" ">유</td>
								<td class=" "><button>역할</button>
									<button>수정</button></td>

								</td>
							</tr>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td class=" ">A00001</td>
								<td class=" ">전체관리자</td>
								<td class=" ">커뮤니티 접근 (** .do 접근 롤 부여)</td>
								<td class=" ">유</td>
								<td class=" "><button>역할</button>
									<button>수정</button></td>

								</td>
							</tr>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td class=" ">A00001</td>
								<td class=" ">전체관리자</td>
								<td class=" ">커뮤니티 접근 (** .do 접근 롤 부여)</td>
								<td class=" ">유</td>
								<td class=" "><button>역할</button>
									<button>수정</button></td>

								</td>
							</tr>
						</tbody>
					</table>
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
					</div>
				</div>


			</div>
		</div>
	</div>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th><input type="checkbox" id="ex_chk "> 
								</th>
								<th class="column-title">사번</th>
								<th class="column-title">이름</th>
								<th class="column-title">권한명</th>

							</tr>
						</thead>

						<tbody>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td><a data-toggle="modal" data-target="#myModal">AAAA1<a></td>

								<td class=" ">일길동</td>
								<td class=" ">전체관리자</td>

								</td>

							</tr>
							<tr class="even pointer">
								<td class="a-center "><input type="checkbox" id="ex_chk"> </td>
								<td><a data-toggle="modal" data-target="#myModal">AAAA1<a></td>

								<td class=" ">홍길동</td>
								<td class=" ">전체관리자</td>

								</td>

							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">삭제</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>