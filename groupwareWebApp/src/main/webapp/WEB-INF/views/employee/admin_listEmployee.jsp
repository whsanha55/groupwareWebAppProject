<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	.modal-dialog {
		width:670px;
	}
</style>
<script>
	var eKeyfield;
	var eKeyword;
	$(document).ready(function() {
	
		employeePaging(1); //최초 로드시 페이징 가즈아ㅏㅏㅏㅏ
		
		$('#regisBtn').click(function(){
			location.href="${pageContext.request.contextPath}/admin/registerEmployee.do";
		});

		//검색조건
		$('#search-panel .dropdown-menu').on('click','a',function(e) {
			e.preventDefault();
			$('.keyfield').text($(this).text());
			$('.keyfield').attr('id',$(this).attr('id'));
		});
		
		//검색조건 엔터키 눌렀을때 트리거 발동
		$('.keyword').on('keydown', function(e) {
			if(e.keyCode == 13){
				$('#findEmployee').trigger('click');
	        }
		});
		
		
		// 검색 실행
		$('#findEmployee').on('click', function() {
			if($('.keyfield').attr('id') == "") {
				swal("검색조건를 선택해주세요");
				return;
			}
	
			eKeyfield = $('.keyfield').attr('id');
			
			if($('.keyword').val() == '퇴사') {
				eKeyword = '0';
			} else if($('.keyword').val() == '재직') {
				eKeyword = '1';
			} else {
				eKeyword = $('.keyword').val();
			}
				
			employeePaging(1);
			
		});
		
		$('#dutyBtnList li > a').on('click', function() {
		    $('#dutyBtn').text($(this).text());
		    $('input[name=dutyCode]').val($(this).attr('value'));
		});
		
		$('#deptBtnList li > a').on('click', function() {	
			$('#deptBtn').text($(this).text());
		    $('input[name=deptCode]').val($(this).attr('value'));		    
		    
			$.ajax ({
				url: "${pageContext.request.contextPath}/admin/checkRelation.do"
				,
				method: 'POST'
				,
				data: {
					deptCode: $('input[name=deptCode]').val()
				}
				,
				dataType: 'json'
				,
				success: function(data) {
					var text = "";					
					
					if(data.length != 0) {
						text += '<div class="input-group-btn search-panel">';
						text += '<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" id="teamBtn" type="button" aria-expanded="false">팀';
						text += '<span class="caret"></span></button>';					
						text += '<ul id="teamBtnList" role="menu" class="dropdown-menu teambtn" aria-labelledby="d2Label">';
						
						for (var i = 0; i<data.length; i++) {
							text += '<li role="presentation">';
							text += '<a role="menuitem" href="#" value="'+ data[i].cNo +'">'+ data[i].cName +'</a>';
							text += '</li>';
						}
						
						text += '</ul>';
						text += '</div>';
						$('#deptDiv').after(text);						
					} else {
						return false;
					}
				}
				,
				error: function(jqXHR) {
					alert('error : ' + jqXHR.status);
				}
			});
		});
		
		$("#inputDeptDiv").on('click','#teamBtnList li > a', function () {
			$("#teamBtn").text($(this).text());
			$('input[name=deptCode]').val($(this).attr('value'));
		});
		
		$('#modifyBtn').click(function() {
			$('#modEmpName').attr('readonly', false);
			$('#modEngName').attr('readonly', false);
			$('#modPhoneNumber').attr('readonly', false);
			$('#modRegNumber').attr('readonly', false);
			$('#modEmail').attr('readonly', false);
			$('#moddetailAddress').attr('readonly', false);
			$('#modnull').attr('readonly', false);
			
			$(this).remove();
			$('#retireBtn').before("<button id='modifyCompBtn' type='submit' class='btn btn-primary'>확인</button>");
			
			console.log($('#modifyCompBtn').text());
		});
		
		$('#modalForm').on('click', '#modifyCompBtn' , function() {
			$(this).submit();
		});
		
		/* $('#modifyBtn').click(function () {
			console.log($('#modRetireStatus').val())
			if($('#modRetireStatus').val()=='재직') {
				$('#modRetireStatus').val('1');	
			} else {
				$('#modRetireStatus').val('0');	
			}
			$.ajax ({
				url:'${pageContext.request.contextPath}/admin/modifyEmployee.do'
				,
				method:'POST'
				,
				data: $('#modalForm').serialize()
				,
				dataType:'json'
				,
				success: function(data) {
					if(data==0) {
					swal({
						title : "사원정보를 수정합니다.",
						text : "계속 진행하시겠습니까?",
						icon : "info",
						buttons : ["취소", "확인"] 
					}).then((e) => {
					     if(e) {
						     swal("수정이 완료되었습니다!", {
						    	 icon : "success"						    	
						     });
					     } else {
					    	 swal("취소되었습니다.");							
						 }
					});
						employeePaging(1);
						$('#myModal').modal('hide');
					}
					
				}
				,
				error: function(jqXHR) {
					alert("error : " + jqXHR.status);
				}
					
			}); 
		});  */
		
		$("#retireBtn").click(function() {
			$.ajax ({
				url : '${pageContext.request.contextPath}/admin/retireEmployee.do',
				method : 'POST',
				data : {
					empNo : $('#modifyEmpNo').val()
				},
				dateType : 'json',
				success : function(data) {
					$('#modRetireStatus').val(data.retireStatus);
					if($('#modRetireStatus').val() == 0) {
						$('#modRetireStatus').val('퇴사');
					}
					$('#modRetireDate').val(data.retireDate);
					employeePaging(1);
				},
				error : function(jqXHR) {
					alert("error : " + jqXHR.status);
				}				
			});
		});
		
		$('#closeBtn').click(function() {
			employeePaging(1);
		});
		
		$("#upload-image").on("change", handleImgFileSelect);
	
		$("#findpostcode").click(execDaumPostcode);
		
	});//$(document).ready End
	
	function execDaumPostcode() {
		
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('modpostcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('modAddress').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('moddetailAddress').focus();
                
                close();
            }
        		
        }).open();
    }
	
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#photo").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	function employeePaging(currentPageNo) {
		var totalCount =  0;		//총  수
		var countPerPage = 10;   //한 페이지당 보여주는 회원 수
		var pageSize = 5;		//페이지 리스트에 게시되는 페이지 수
		var startRow = (currentPageNo - 1) * countPerPage + 1;
		var endRow = currentPageNo * countPerPage;
		
		
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/listEmployeeAjax.do' 
			,
			data: {
				keyfield: eKeyfield ,
				keyword: eKeyword ,	
				startRow : startRow ,
				endRow : endRow
			}
			,
			type: 'POST' 
			,
			cache: false 
			,
			dataType: 'json' 
			,
			success: function (data, textStatus, jqXHR) {
				
				totalCount = data.totalCount;
				
				//datatable테이블 변경하기
				var text = "";
				if(totalCount == 0) {
					text += '<tr><td>조회된 검색결과가 없습니다<td></tr>';
				} else {
					for(var i=0;i<data.employees.length;i++) {
						text += "<tr>";
						text += "<input id='submitPhotoName' type='hidden' value='"+ data.employees[i].systemPhotoName +"'>";
						text += "<input id='submitSignName' type='hidden' value='"+ data.employees[i].systemSignName +"'>";
						text += "<td id='submitEmpNo'><a data-toggle='modal' data-target='#myModal'>"+ data.employees[i].empNo + "</a></td>";
						text += "<td id='submitEmpName'>"+ data.employees[i].empName 		+ "</td>";
						text += "<input id='submitEngName' type='hidden' value='"+ data.employees[i].engName +"'>";
						text += "<input id='submitDeptNo' type='hidden' value='"+ data.employees[i].deptNo +"'>";
						text += "<td id='submitDuty'>"+ data.employees[i].duty 			+ "</td>";
						text += "<input id='submitDutyNo' type='hidden' value='"+ data.employees[i].dutyNo +"'>";
						text += "<td id='submitDept'>"+ data.employees[i].department 	+ "</td>";
						text += "<td id='submitPhoneNumber'>"+ data.employees[i].phoneNumber	+ "</td>";
						text += "<input id='submitRegNumber' type='hidden' value='"+ data.employees[i].regNumber +"'>";
						text += "<td id='submitHireDate'>"+ data.employees[i].hireDate		+ "</td>";
						text += "<td id='submitEmail'>"+ data.employees[i].email			+ "</td>";
						if(data.employees[i].retireStatus == 0) {
							text += "<td id='submitRetireStatus'>퇴사</td>";
						} else {
							text += "<td id='submitRetireStatus'>재직</td>";
						}
						text += "<input id='submitRetireDate' type='hidden' value='"+ data.employees[i].retireDate +"'>";
						text += "<input id='submitpostcode' type='hidden' value='"+ data.employees[i].postcode +"'>";
						text += "<input id='submitAddress' type='hidden' value='"+ data.employees[i].address +"'>";
						text += "<input id='submitdetailAddress' type='hidden' value='"+ data.employees[i].detailAddress +"'>";
						text += "</tr>";
						
						
						$('#datatable').on('click','#submitEmpNo', function(){
							$('#modEmpName').attr('readonly', true);
							$('#modEngName').attr('readonly', true);
							$('#modPhoneNumber').attr('readonly', true);
							$('#modRegNumber').attr('readonly', true);
							$('#modEmail').attr('readonly', true);
							$('#moddetailAddress').attr('readonly', true);
							$('#modnull').attr('readonly', true);
																					
							$('#photo').attr('src','${pageContext.request.contextPath }/resources/upload/employeeFiles/photos/' + ($(this).parent().children('#submitPhotoName').val()));
							$('#sign').attr('src','${pageContext.request.contextPath }/resources/upload/employeeFiles/signs/' + ($(this).parent().children('#submitSignName').val()));
							$('#modifyEmpNo').val($(this).text());
							$('#modEmpName').val($(this).next('#submitEmpName').text());							
							$('#modEngName').val($(this).parent().children('#submitEngName').val());
							$('input[name=dutyCode]').val($(this).parent().children('#submitDutyNo').val());
							$('.preDuty').text($(this).nextAll('#submitDuty').text());
							$('input[name=deptCode]').val($(this).parent().children('#submitDeptNo').val());
							$('.preDept').text($(this).nextAll('#submitDept').text());
							$('#modPhoneNumber').val($(this).nextAll('#submitPhoneNumber').text());
							$('#modRegNumber').val($(this).nextAll('#submitRegNumber').val());
							$('#modEmail').val($(this).nextAll('#submitEmail').text());
							$('#modHireDate').val($(this).nextAll('#submitHireDate').text());
							if($(this).nextAll('#submitRetireStatus').text() == '퇴사') {
								$('#modRetireStatus').val('퇴사');
								$('#modRetireDate').val($(this).nextAll('#submitRetireDate').val());													
							} else {
								$('#modRetireStatus').val('재직');
								$('#modRetireDate').val("");
							}
							$('#modpostcode').val($(this).parent().children('#submitpostcode').val());
							$('#modAddress').val($(this).parent().children('#submitAddress').val());	
							$('#moddetailAddress').val($(this).parent().children('#submitdetailAddress').val());
						})
					}
				}
				$('#datatable').find('tbody').html(text);
				
				
				//페이징 처리
				jqueryPager({
					countPerPage : countPerPage,
					pageSize : pageSize,
					currentPageNo : currentPageNo,
					totalCount : totalCount
				});		
			} 
			,
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}	
		});
		
	} //end templatePaging function
	
	
	function jqueryPager(subOption) {
		
		var pageBlock = subOption.countPerPage;      
		var pageSize = subOption.pageSize;        
		var currentPage = subOption.currentPageNo;   
		var pageTotal = subOption.totalCount;       
		var pageTotalCnt = Math.ceil(pageTotal/pageBlock);
		var pageBlockCnt = Math.ceil(currentPage/pageSize);
		var sPage = (pageBlockCnt-1) * pageSize + 1;
		var ePage;
		
		var html ="<ul class='pagination'>";

		
		 if((pageBlockCnt * pageSize) >= pageTotalCnt) {
			ePage = pageTotalCnt;
		} else {
			ePage = pageBlockCnt * pageSize;
		} 
		
		if(sPage <= 1) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Previous">' 
		} else {
			html += '<li class="page-item ">';
			html += '<a class="page-link" aria-label="Previous" onclick = "employeePaging(' + (sPage - pageSize) + ')">'; 
		}
		html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
		
		for(var i=sPage; i<=ePage; i++) {
			if(currentPage == i) {
				html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
			} else {
				html += '<li class="page-item"><a class="page-link" onclick="employeePaging(' + i + ');">' + i + '</a></li>';
			}
		}				

		if (ePage >= pageTotalCnt) {
			html += '<li class="page-item disabled">';
			html += '<a class="page-link" aria-label="Next">';
		} else {
			html += '<li class="page-item">';
			html += '<a class="page-link" aria-label="Next" onclick = "employeePaging(' + (ePage+1) + ')">';
		}
		html += '<span aria-hidden="true">&raquo;</span> </a></li>';
		html += '</ul>';
		
		$('#employeePaging').html(html);
	
	}//end of jqueryPager
	
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>사원관리</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>사원명부</h2>
							</div>
							<%-- <c:url var=registerEmployee value="/admin/registerEmployee.do" scope="page" /> --%>
							<button id="regisBtn" type="button" class="btn btn-primary" data-toggle="modal">
								등록하기
							</button>
						</div>
						<div class="col-md-3 col-xs-offset-2">
							<div class="input-group">
								<div id="search-panel" class="input-group-btn search-panel">
									<button class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" type="button">
										<span class="keyfield">검색조건</span><span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a id="empNo" role="menuitem">사원번호</a>
										</li>
										<li>
											<a id="empName" role="menuitem">이름</a>
										</li>
										<li>
											<a id="duty" role="menuitem">직책</a>
										</li>
										<li>
											<a id="department" role="menuitem">부서</a>
										</li>
										<li>
											<a id="retireStatus" role="menuitem">퇴사여부</a>
										</li>
									</ul>
								</div>
								<input type="text" class="form-control keyword" placeholder="검색어">
								<span class="input-group-btn">
									<button class="btn btn-default" id="findEmployee" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
						<table id="datatable" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>직책</th>
									<th>부서</th>
									<th>연락처</th>
									<th>입사일자</th>
									<th>이메일</th>
									<th>퇴사여부</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation" id = 'employeePaging'>
				
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<form id="modalForm" action="${pageContext.request.contextPath }/admin/modifyEmployee.do"
				enctype="multipart/form-data" method="POST">
		<input type="hidden" name="dutyCode" value="">
		<input type="hidden" name="deptCode" value="">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">사원 상세정보 및 수정</h4>
				</div>
				<div class="modal-body">
					<div>
						<div class="col-md-5 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img id="photo" width="250px" height="250px" 
									src="" class="img-responsive center-block"/>
								</div>
							</div>
							<br> <input id="upload-image" name="upload"
								type="file" data-role="magic-overlay" data-target="#pictureBtn"
								data-edit="insertImage">
						</div>
						<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
							<div class="profile_img">
								<div id="crop-avatar">
									<!-- Current avatar -->
									<img id="sign" width="250px" height="250px" 
									src="" class="img-responsive center-block"/>
								</div>
							</div>
						</div>
						<br> <br> <br>
						<table id="datatable" class="table table-striped table-bordered" style="width:630px;">
							<tbody>
								<tr>
									<th colspan='1'>사번</th>
									<td colspan='5'><input id="modifyEmpNo" name="empNo" type="text" class="form-control"
										readonly readonly value=""></td>
								</tr>
								<tr>
									<th>이름</th>
									<td colspan='2'><input id="modEmpName" name="empName" type="text" class="form-control"
										required="required" value="" style="width:100px;"></td>
									<th>영문이름</th>
									<td colspan='2'><input id="modEngName" name="engName" type="text" class="form-control"
										value="" style="width:100px;"></td>
								</tr>
								<tr>
									<th>직책</th>
									<td colspan='2'><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div class="input-group">
													<div class="input-group-btn search-panel">
														<button id="dutyBtn" type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept" class="preDuty" >직책</span><span class="caret"></span>
														</button>
														<ul id="dutyBtnList" class="dropdown-menu" role="menu">
															<c:forEach var="dutyCode" items="${requestScope.dutyCodes }" varStatus="loop">
																<li role="presentation">
																	<a role="menuitem" tabindex="-1" href="#" value="${pageScope.dutyCode.cNo }">${pageScope.dutyCode.cName }</a>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
									<th>부서</th>
									<td colspan='2'><div>
											<div class="col-xs-2 col-xs-offset-2">
												<div id="inputDeptDiv" class="input-group">
													<div id="deptDiv" class="input-group-btn search-panel">
														<button id="deptBtn" type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span id="search_concept" class="preDept">부서</span> <span class="caret"></span>
														</button>
														<ul id="deptBtnList" class="dropdown-menu" role="menu">
															<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
																<li role="presentation">
																	<a role="menuitem" href="#" value="${pageScope.deptCode.cNo }">${pageScope.deptCode.cName }</a>
																</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
								<tr>
									<th colspan='1'>연락처</th>
									<td colspan='5' class="form-inline">
											<input type="hidden" id="phoneNumber" name="phoneNumber"
												 class="form-control col-md-7 col-xs-12">
											<div class="form-group">
												<select id="phoneNumber1" name="phoneNumber1" style="width:50px;height:30px;">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												</select>
											</div>
												 &nbsp;-&nbsp;
											<input type="text" id="phoneNumber2" name="phoneNumber2"
												 class="form-control" style="width:100px;">
												 &nbsp;-&nbsp;
											<input type="text" id="phoneNumber3" name="regNumber3"
												 class="form-control" style="width:100px;">
										</div>
									</td>
								</tr>
								<tr>
									<th colspan='1'>주민번호</th>
									<td colspan='5' class="form-inline">
										<input type="hidden" id="regNumber" name="regNumber"
											 class="form-control col-md-7 col-xs-12" value="">
										<input type="text" id="regNumber1" name="regNumber1"
											 class="form-control" style="width:200px;">
											&nbsp;-&nbsp;
										<input type="text" id="regNumber2" name="regNumber2"
											 class="form-control" style="width:200px;">
									</div></td>
								</tr>
								<tr>
									<th colspan='1'>이메일</th>
									<td colspan='5' class="form-inline">
										<input type="hidden" id="email" name="email" value="" >
										<input type='text' id="email1" name="email1" class="form-control" style="width:100px;">&nbsp;@&nbsp;
			            				<input type='text' id="email2" name="email2" class="form-control" style="width:150px;">
						              <select name="emailaddr" class="form-control" style="width:150px;">
						                 <option value="">직접입력</option>
						                 <option value="naver.com">naver.com</option>
						                 <option value="gmail.com">gmail.com</option>
						                 <option value="nate.com">nate.com</option>
						                 <option value="daum.net">daum.net</option>
						                 <option value="hanmail.net">hanmail.net</option>
						                 <option value="empal.com">empal.com</option>
						                 <option value="msn.com">msn.com</option>
						              </select>
									</td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><input id="modHireDate" name="hireDate" type="text" class="form-control"
										required="required" value="" readonly style="width:100px;"></td>
									<th>퇴사여부</th>
									<td><input id="modRetireStatus" name="retireStatus" type="text" class="form-control"
										required="required" readonly value="" style="width:60px;"></td>
									<th>퇴사일</th>
									<td><input id="modRetireDate" name="retireDate" type="text" class="form-control" value="" readonly style="width:100px;"></td>
								</tr>
								<tr>
									<th colspan='1'>주소</th>
									<td colspan="5">
									<div class="col-md-6 col-sm-6 col-xs-6">
										<input type="text" id="modpostcode" name="postcode" placeholder="우편번호" readonly
												required="required" class="form-control col-sm-6 col-xs-6">
									</div>
									<button type="button" id="findpostcode" class="btn btn-success">우편번호 찾기</button><br>
									<div class="col-md-12 col-sm-6 col-xs-12">
										<input type="text" id="modAddress" name="address" placeholder="주소" readonly
												required="required" class="form-control col-md-7 col-xs-12" style="width:500px;">
									</div><br>
									<div class="col-md-12 col-sm-6 col-xs-12">
										<input type="text" id="moddetailAddress" name="detailAddress" placeholder="상세주소"
												required="required" class="form-control col-md-7 col-xs-12" style="width:500px;">
									</div>
								</tr>
							</tbody>
						</table> 
						
						<br>
						<div class="text-center">
							<button id="modifyBtn" type="button" class="btn btn-primary">수정</button>
							<button id="retireBtn" type="button" class="btn btn-primary retire">퇴사</button>
							<button id="closeBtn2" type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
</html>