<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>최상위 코드 목록 조회</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	/* function msg() {
		if(confirm("이 코드를 삭제하시겠습니까?") == true) {
			alert("코드가 삭제되었습니다.")
			return true;
		} else {
			return false;
		}
	} */
</script>
<script>
	var eKeyfield;
	var eKeyword;
	$(document).ready(function() {
		
/* 		employeePaging(1); //최초 로드시 페이징 가즈아ㅏㅏㅏㅏ */
		
		//검색 조건 선택
		$('#keyfieldList li > a').on('click', function() {
			$('#keyfield').text($(this).text());
			$('input[name=keyfield]').val($(this).attr('value'));
		})
		
		//검색조건
		$('.search-panel .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
		});
	
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('.keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('.findCode').trigger('click');
	        }
		});
	
		// 검색 실행
		$('.findCode').on('click', function() {
			if($('.keyfield').attr('id') == null) {
				swal("검색조건을 선택해주세요!","", "error");
				return;
			}
			
			eKeyfield = $('.keyfield').attr('id');
			eKeyword = $('.keyword').val();
			
			
		});
		
		
		
		
		
		$('#insert').click(function(){
			var url = '${pageContext.request.contextPath}/admin/registerCode1.do';
			window.open(url, "코드 등록", "width=700, height=600");
		});
		
		$('.modify').click(function(){
			var c_no = $(this).attr('id');
			var url = '${pageContext.request.contextPath}/admin/modifyCode1.do?cNo='+ c_no;

			window.open(url, "코드 수정", "width=700, height=600");
		});
		
		$('.removeBtn').on('click', function() {
			var cNo = $(this).val();
			
			swal({
				 title: "코드 삭제",
				 text: "코드를 삭제합니다. 계속 진행하시겠습니까?",
				 icon: "info",
				 buttons : true	
			}).then((e) => {
				if(e) {
					removeCode1(cNo);
				}
			});
			
			
			function removeCode1(cNo) {	
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/removeCode1.do'
					,
					method: 'GET'
					,
					data: {cNo}
					, 
					async: true
					,
					cache: false
					,
					success: function(data) {
						swal({
							  title: "삭제 완료",
							  text: "코드가 삭제되었습니다.",
							  icon: "info",
							  buttons : "확인" 
						}).then((e) => {
							if(e) {
							  	location.reload();
							}
						});		
					}
					, 
					error: function(jqXHR) {
						alert('Error : ' + jqXHR.status);
					}	 				
				});	
			}
		});

	});	//$(document).ready End
	
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>코드관리</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">

					<div>
						<div class="col-md-6">
							<div class="col-md-2">
								<h2>코드목록</h2>
							</div>
							<button type="button" id="insert" class="btn btn-success">등록</button>&nbsp;&nbsp;&nbsp;※코드 번호 클릭 시, 하위 코드 목록으로 이동합니다.
						</div>
						
						<div>
							<div>
							<div class="col-md-3 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" id="keyfield" value="keyfield" aria-expanded="true">
											<span class="keyfield">검색조건 <span class="caret"></span></span>
										</button>
										<ul id="keyfieldList" class="dropdown-menu" role="menu" aria-labelledby="searchType">
											<li><a id="cNo" role="menuitem">코드번호</a></li>
											<li><a id="cName" role="menuitem">코드명</a></li>
										</ul>
									</div>
									<input type="text" class="form-control keyword" placeholder="검색어를 입력하세요.">
									<span class="input-group-btn">
										<button class="btn btn-default findCode" type="button">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
						</div>
					</div>
					<div class="col-md-6"></div>
				</div>
			<form id="#form">
				<table id="datatable"
					class="table table-striped table-bordered text-center">
					<thead>
						<tr>
							<th>코드번호</th>
							<th>코드명</th>
							<th>등록된 하위 코드 수</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
						<tbody>
						<c:forEach var="code" items="${requestScope.codes }" varStatus="loop">
							<c:url var="url1" value="/admin/listCode2.do" scope="page" >
								<c:param name="relationCode" value="${pageScope.code.cNo }" />
							</c:url>
							<c:url var="url2" value="/admin/listCode3.do" scope="page" >
								<c:param name="relationCode" value="${pageScope.code.cNo }" />
							</c:url>
							<tr>
							<c:if test="${pageScope.code.cNo == 'B'}" >
								<td><a href="${pageScope.url2}">${pageScope.code.cNo }</a></td>
							</c:if>
							<c:if test="${pageScope.code.cNo == 'DC'}" >
								<td><a href="${pageScope.url2}">${pageScope.code.cNo }</a></td>
							</c:if>
							<c:if test="${pageScope.code.cNo != 'B' && pageScope.code.cNo != 'DC'}" >
								<td><a href="${pageScope.url1}">${pageScope.code.cNo }</a></td>
							</c:if>
								<td>${pageScope.code.cName }</td>
								<td>${pageScope.code.countRelationCode }</td>
								<td><button class="modify btn btn-success" id="${pageScope.code.cNo }" type="button">수정</button></td>
							<c:if test="${pageScope.code.countRelationCode == 0 }" >
								<td><button type="button" value="${pageScope.code.cNo }" class="btn btn-primary removeBtn" >삭제</button></td>
							</c:if>
							<c:if test="${pageScope.code.countRelationCode != 0 }">
								<td></td>
							</c:if>	
								</tr>
						</c:forEach>
						</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>