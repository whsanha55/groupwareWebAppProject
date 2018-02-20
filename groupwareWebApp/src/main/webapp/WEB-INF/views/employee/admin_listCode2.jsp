<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>부서 코드 목록 조회</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	a:link {color:blue;}
 	a:hover{color:gold;}
	a:visited{color:purple;}
	.listCode3 {
		cursor : pointer;	
	}
	.box3 {
		cursor : pointer;
	}
</style>
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
		
		$('#listCode1').click(function(){
			location.href = '${pageContext.request.contextPath}/admin/listCode1.do';
		});
		
		//하위 코드로 이동		
		$(document).on('click', '.listCode3', function(){
			var relationCode = $(this).attr('id');
			location.href = '${pageContext.request.contextPath}/admin/listCode3.do?superRelationCode=' + "${requestScope.superRelationCode}" + '&relationCode=' + relationCode;
		});
		
		//등록 버튼 클릭시 팝업창 생성
		$('#insert').click(function(){
			var relationCode = $("#relationCode").val();
			console.log(relationCode);

			var url = '${pageContext.request.contextPath}/admin/registerCode2.do?relationCode='+ "${param.relationCode}";
			window.open(url, "코드 등록", "width=700, height=600");
		});
		
		//수정 버튼 클릭시 팝업창 생성
		$('#datatable').on('click', '.modify', function() {
			var c_no = $(this).attr('id');
			var url = '${pageContext.request.contextPath}/admin/modifyCode2.do?cNo='+ c_no;
			
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
					removeCode2(cNo);
				}
			});
			
			
			function removeCode2(cNo) {	
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/removeCode2.do'
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
		
			var relationCode = "${param.relationCode}";
			
			$.ajax ({
				url: '${pageContext.request.contextPath}/admin/listCodeAjax2.do'
				,
				data : {
					relationCode: relationCode,
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
							text += "<input id='relationCode' type='hidden' value='" + data.codes[i].relationCode + "'>";
							text += "<tr>";
							text += "<td id='" + data.codes[i].cNo + "'class='listCode3'>" + data.codes[i].cNo + "</td>";
							text += "<td id='cName'" + i + ">" + data.codes[i].cName + "</td>";
							text += "<td id='countRelationCode'" + i + ">" + data.codes[i].countRelationCode + "</td>";
							if(data.codes[i].countRelationCode != 0) {
								text += "<td id='useable'" + i + ">O</td>"
							} else if(data.codes[i].countEmployee != 0) {
								text += "<td id='useable'" + i + ">O</td>"
							} else if(data.codes[i].countApproval != 0) {
								text += "<td id='useable'" + i + ">O</td>"
							} else if(data.codes[i].countApprovalRecord != 0) {
								text += "<td id='useable'" + i + ">O</td>"
							} else if(data.codes[i].countNotification != 0) {
								text += "<td id='useable'" + i + ">O</td>"
							} else if(data.codes[i].countPost != 0) {
								text += "<td id='useable'" + i + ">O</td>"
							} else if(data.codes[i].countPlan != 0) {
								text += "<td id='useable'" + i + ">O</td>"
							} else if(data.codes[i].countRelationCode == 0 &&
									  data.codes[i].countEmployee == 0 &&
									  data.codes[i].countApproval == 0 &&
									  data.codes[i].countApprovalRecord == 0 &&
									  data.codes[i].countNotification == 0 &&
									  data.codes[i].countPost == 0 &&
									  data.codes[i].countPlan == 0
									  ) {
								text += "<td id='useable'" + i + ">X</td>"
							}
							text += "<td id='modify'" + i + ">" + "<button class='modify btn btn-primary' id='" + data.codes[i].cNo + "'type='button'>수정</button></td>";
							if(data.codes[i].countRelationCode != 0) {
								text += "<td id='useable'" + i + "><button class='btn btn-primary' type='button' disabled='true'>삭제</button></td>"
							} else if(data.codes[i].countEmployee != 0) {
								text += "<td id='useable'" + i + "><button class='btn btn-primary' type='button' disabled='true'>삭제</button></td>"
							} else if(data.codes[i].countApproval != 0) {
								text += "<td id='useable'" + i + "><button class='btn btn-primary' type='button' disabled='true'>삭제</button></td>"
							} else if(data.codes[i].countApprovalRecord != 0) {
								text += "<td id='useable'" + i + "><button class='btn btn-primary' type='button' disabled='true'>삭제</button></td>"
							} else if(data.codes[i].countNotification != 0) {
								text += "<td id='useable'" + i + "><button class='btn btn-primary' type='button' disabled='true'>삭제</button></td>"
							} else if(data.codes[i].countPost != 0) {
								text += "<td id='useable'" + i + "><button class='btn btn-primary' type='button' disabled='true'>삭제</button></td>"
							} else if(data.codes[i].countPlan != 0) {
								text += "<td id='useable'" + i + "><button class='btn btn-primary' type='button' disabled='true'>삭제</button></td>"
							} else if(data.codes[i].countRelationCode == 0 &&
									  data.codes[i].countEmployee == 0 &&
									  data.codes[i].countApproval == 0 &&
									  data.codes[i].countApprovalRecord == 0 &&
									  data.codes[i].countNotification == 0 &&
									  data.codes[i].countPost == 0 &&
									  data.codes[i].countPlan == 0
									  ) {
								text += "<td id='remove'" + i + ">" + "<button class='btn btn-primary removeBtn' value='" + data.codes[i].cNo + "'type='button'>삭제</button></td>";
							}
							text += "</tr>";
						}
					}
					$('#datatable').html(text);
				}
				,
				error: function(jqXHR) {
					alert("에러: " + jqXHR.status);
				}
			});
		}
		
		
		
		
		
		
		
		
	});	//$(document).ready End
	
</script>
<style type="text/css">
	.box3{width:100px; height:34px; background:#4aa3ef; text-align:center; line-height:34px; color:#fff; margin-bottom:5px; display:inline-block;}
	.tri{    position: absolute;
    top: 0px;
    left: 110px;
    width: 0px;
    border-top: 17px solid transparent;
    border-bottom: 17px solid transparent;
    border-left: 15px solid #4aa3ef;
    border-right: 15px solid transparent;
}

.box4{width:100px; height:34px;margin-left:10px; margin-bottom:5px; display:inline-block;background:#4aa3efc4; text-align:center; line-height:34px; color:#fff;}
	.tri2{    position: absolute; 
    top: 0px;
    left: 231px;
    width: 0px;
    border-top: 17px solid transparent;
    border-bottom: 17px solid transparent;
    border-left: 15px solid #4aa3efc4;
    border-right: 15px solid transparent;
}
</style>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>코드관리</h2>
				<div class="pull-right">
					<button type="button" id="insert" class="btn btn-primary">등록</button>
				<c:url var="previousCodeURL" value="/admin/listCode1.do" scope="page" ></c:url>
				<a id="previous" href="${pageScope.previousCodeURL }"><button type="button" class="btn btn-primary" >이전</button></a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
				
					<div>
						<div class="col-md-8">
								
								<div id="listCode1" class="box3">최상위 코드<div class="tri"></div></div>
								&nbsp;
								<div id="listCode2" class="box4">${requestScope.superRelationCode }<div class="tri2"></div></div>
								<br>
								※코드 번호 클릭 시, 하위 코드 목록으로 이동합니다.

						</div>
						
						<div>
							<div>
							<div>
								<div class="input-group">
									<div class="input-group-btn search-panel">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="margin-right:3px;">
											<span class="keyfield">검색조건</span> <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a id="cNo">코드번호</a></li>
											<li><a id="cName">코드명</a></li>
										</ul>
									</div>
									<input type="hidden" name="search_param" value="all" id="search_param">
									<input type="text" class="form-control" id="keyword" name="x" placeholder="대문자, 소문자를 구분해주세요!">
									<span class="input-group-btn">
										<button id="findCode" class="btn btn-default" type="button" style="margin-left:3px; height:34px;">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>
				<table class="table table-striped jambo_table bulk_action" style="text-align:center;">
					<thead>
						<tr>
							<th id="1" class="text-center">코드번호</th>
							<th id="2" class="text-center">코드명</th>
							<th id="5" class="text-center">등록된 하위 코드 수</th>
							<th id="6" class="text-center">코드 사용 여부</th>
							<th id="7" class="text-center">수정</th>
							<th id="8" class="text-center">삭제</th>
						</tr>
					</thead>
						<tbody id="datatable">
						
						</tbody>
				</table>
			</div>
			
		</div>
	</div>
</body>
</html>