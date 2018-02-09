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
		
		codePaging();

		//검색조건
		$('.search-panel .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
		});
	
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('#keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('#findCode').trigger('click');
	        }
		});
		
		//등록 버튼 클릭시 팝업창 생성
		$('#insert').click(function(){
			var url = '${pageContext.request.contextPath}/admin/registerCode1.do';
			window.open(url, "코드 등록", "width=700, height=600");
		});
		
		//수정 버튼 클릭시 팝업창 생성
		$('#datatable').on('click', '.modify', function() {
			var c_no = $(this).attr('id');
			var url = '${pageContext.request.contextPath}/admin/modifyCode1.do?cNo='+ c_no;

			window.open(url, "코드 수정", "width=700, height=600");
		});
		
		//삭제 버튼 클릭시 삭제
		$('#datatable').on('click', '.removeBtn', function() {
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
	
		// 검색 실행
		$('#findCode').on('click', function() {
			if($('.keyfield').attr('id') == undefined) {
				swal("검색조건을 선택해주세요!","", "error");
				return false;
			} else if($('#keyword').val() == "") {
				eKeyfield = $('.keyfield').attr('id');
				eKeyword = $('#keyword').val();
				
				console.log(eKeyfield);
				console.log(eKeyword);
				
				codePaging();
			}
			
			eKeyfield = $('.keyfield').attr('id');
			eKeyword = $('#keyword').val();
			
			console.log(eKeyfield);
			console.log(eKeyword);
			
			codePaging();
				
		});
		
		function codePaging() {
			
			$.ajax ({
				url: '${pageContext.request.contextPath}/admin/listCodeAjax1.do'
				,
				data : {
					keyfield: eKeyfield,
					keyword: eKeyword
				}
				,
				type: 'POST'
				,
				cache: false
				,
				dataType: 'json'
				,
				success: function (data, textStatus, jqXHR) {
					
					var text ="";
					if(data.totalCount == 0) {
						text += '<tr>조회된 검색결과가 없습니다</tr>';
					} else {
						for(var i=0; i<data.codes.length;i++) {
							text += "<tr>";
							if(data.codes[i].cNo == 'B') {
								text += "<td id='cNo'" + i +"><a href=/groupware/admin/listCode3.do?relationCode=" + data.codes[i].cNo + ">" + data.codes[i].cNo + "</td>";
							} else if (data.codes[i].cNo == 'DC') {
								text += "<td id='cNo'" + i +"><a href=/groupware/admin/listCode3.do?relationCode=" + data.codes[i].cNo + ">" + data.codes[i].cNo + "</td>";
							} else {
								text += "<td id='cNo'" + i +"><a href=/groupware/admin/listCode2.do?relationCode=" + data.codes[i].cNo + ">" + data.codes[i].cNo + "</td>";
							}
							
							text += "<td id='cName'" + i + ">" + data.codes[i].cName + "</td>";
							text += "<td id='countRelationCode'" + i + ">" + data.codes[i].countRelationCode + "</td>";
							text += "<td id='modify'" + i + ">" + "<button class='modify btn btn-success' id='" + data.codes[i].cNo + "'type='button'>수정</button></td>";
							if(data.codes[i].countRelationCode == 0) {
								text += "<td id='remove'" + i + ">" + "<button class='btn btn-primary removeBtn' value='" + data.codes[i].cNo + "'type='button'>삭제</button></td>";
							} else {
								text +="<td></td>"
							}
							text += "</tr>";
						}
					}
					$('#datatable').find('tbody').html(text);
				}
				,
				error: function(jqXHR) {
					alert("에러: " + jqXHR.status);
				}
			});
		}
			
		
		

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
							<div class="col-md-4 col-xs-offset-2">
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
											<span class="keyfield">검색조건</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" >
											<li><a id="cNo">코드번호</a></li>
											<li><a id="cName">코드명</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all" id="search_param">
									<input type="text" class="form-control" id="keyword" name="x" placeholder="대문자, 소문자를 구분해주세요!">
									<span class="input-group-btn">
										<button id="findCode" class="btn btn-default" type="button">
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
						
						</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>