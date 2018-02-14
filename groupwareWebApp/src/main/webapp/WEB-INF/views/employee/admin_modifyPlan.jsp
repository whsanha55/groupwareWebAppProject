<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일정수정</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=ad3a3657ebba1b7547bc9c0a370b50dc&libraries=services"></script>
<style>
.modal-dialog.modal-cSize {
	width:600px;
	height:auto;
}
</style>
<!-- <script type="text/javascript">
	function msg() {
		if(swal({
			  title: "일정 등록",
			  text: "일정을 등록합니다. 계속 진행하시겠습니까????",
			  icon: "info",
			  buttons : true 
		}) == true) {
			swal({
				  title: "일정 등록",
				  text: "일정이 등록되었습니다.",
				  icon: "info",
				  buttons : true 
			})
			return true;
		} else {
			return false;
		}
	}
</script> -->
<script>
var eKeyfield;
var eKeyword;

$(document).ready(function () {		
	
	//페이지 이동 방지
    var checkUnload = true;
    $(window).on("beforeunload", function(){
    	if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
    });

	//파일 삭제 
	$('.deleteBtn').on('click', function() {	
		var fileNo = $(this).val();
		
		swal({
			  title: "파일 삭제",
			  text: "파일을 삭제합니다. 계속 진행하시겠습니까?",
			  icon: "info",
			  buttons : true 
		}).then((e) => {
		     if(e) {
		    	 deletePlanFile(fileNo);		
			 }
		});		
		
		function deletePlanFile(fileNo) {	
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/removePlanFile.do'
				,
				method: 'GET'
				,
				data: {fileNo}
				, 
				async: true
				,
				cache: false
				,
				success: function(data) {
					swal({
						  title: "삭제 완료",
						  text: "선택하신 파일이 삭제되었습니다.",
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
	
	$('#modifyBtn').on('click', function() {
		event.preventDefault();
		checkUnload = false;
		if($('input[name=pTitle]').val().trim() == '') {
			swal("제목을 입력해주세요.","");
			return;
		}
		if($('input[name=startDate]').val().trim() == '') {
			swal("시작일을 입력해주세요.","");
			return;
		}
		if($('input[name=endDate]').val().trim() == '') {
			swal("종료일을 입력해주세요.","");
			return;
		}
		if($('input[name=startDate]').val() >= $('input[name=endDate]').val()) {
			swal("시작일이 종료일보다 클 수 없습니다.","");
			return;
		}
		if($('input[name=destination]').val().trim() == '') {
			swal("장소정보를 입력해주세요.","");
			return;
		}
		if($('input[name=pContent]').val() == '') {
			swal("내용을 입력해주세요.","");
			return;
		}
		if($('input[name=empName]').val().trim() == '') {
			swal("담당자를 지정해주세요.","");
			return;
		}
		swal({
			title: "일정 수정",
			text: "일정을 수정합니다. 계속 진행하시겠습니까?",
			icon: "info",
			buttons : true 
		}).then((e) => {
			if(e) {
				$('#modify').submit();
			} else if(!e) {
				checkUnload = true;
				return;
			}
		});			

	});
	
	
	
	
	$('#searchEmp').click(function() {
		$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
		$('#layerpop').modal({
			backdrop: 'static', 
			keyboard: false
		});
	});
	
	$('#modalChooseBtn').on('click',function() {
		
		//일정관리 - 담당자설정
		$('input[name=rspbNo]').val(selectedEmpNo);
		$('input[name=empName]').val(selectedNameAndDuty);
	
		$('#chartBody').html("");
		 
	});
	
	$('#modalCloseBtn').on('click',function() {
		$('#chartBody').html("");
		 
	});
	
	$('#searchMap').click(function() {
		$('#mapBody').load('${pageContext.request.contextPath}/admin/map.do');
		$('#layerpop2').modal({
			backdrop : 'static',
			keyboard : false
		});
	});
	
	$('#modalChooseBtn2').on('click',function() {	
		console.log(selectedDest);
		$('input[name=destination]').val(selectedDest);
		$('input[name=latitude]').val(selectedLat);
		$('input[name=longitude]').val(selectedLng);
	
		$('#mapBody').html("");
	});
	
	$('#modalCloseBtn2').on('click',function() {
		$('#mapBody').html("");
	});
	

});//end of jqueryPager
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
					<h2>일정수정</h2>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<br>
					<form id="modify" data-parsley-validate="" class="form-horizontal form-label-left"
							action="${pageContext.request.contextPath }/admin/modifyPlan.do" method="post"
							enctype="multipart/form-data">
						<input type="hidden" id="pNo" name="pNo" value="${requestScope.plan.pNo }">
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >일정구분 *</label>&nbsp;&nbsp;
							<select id="pClass" name="pClass" style="width:100px;height:30px;" value="${requestScope.plan.pClass }" >
							<option value="1" <c:if test="${requestScope.plan.pClass == 1}">selected</c:if>>회의</option>
							<option value="2" <c:if test="${requestScope.plan.pClass == 2}">selected</c:if>>교육</option>
							<option value="3" <c:if test="${requestScope.plan.pClass == 3}">selected</c:if>>기타</option>
							</select>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >부서 *</label>&nbsp;&nbsp;
							<select id="deptNo" name="deptNo" style="width:100px;height:30px;" value="${requestScope.plan.deptNo }">
							<option value="A">전체</option>
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.key }" <c:if test="${requestScope.plan.deptNo  == pageScope.deptCode.key}">
								selected</c:if>>${pageScope.deptCode.title }</option>
							</c:forEach>
							</select>
						</div>

						<br>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >제목 *</label>&nbsp;&nbsp;
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" id="pTitle" name="pTitle" class="form-control" placeholder="제목을 입력해주세요."
										style="width:600px;" value="${requestScope.plan.pTitle }" required="required">
							</div>
						</div>
												
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >기간 *</label>&nbsp;&nbsp;
							</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<fieldset>
									<div class="btn-group">
										<div class="controls">
											<div class="input-prepend input-group col-md-6 col-sm-6 col-xs-12">
												<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
												<%-- <fmt:parseDate var="parsedDate" value="${requestScope.plan.startDate }" pattern="YYYY/MM/DD HH24:mm:ss" />
												<fmt:formatDate var="newFormattedStartDate" value="${parsedDate }" pattern="YYYY-MM-DD'T'HH24:mi:ss" /> --%>
												<input type="datetime-local" name="startDate" id="startDate"
													class="form-control" required="required"
													style="width:262px;" value="${requestScope.plan.startDate }">
												<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
												<input type="datetime-local" name="endDate" id="endDate" 
														class="form-control" required="required"
														style="width:262px;" value="${requestScope.plan.endDate }" >
											</div>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >장소 *</label>&nbsp;&nbsp;
							<div class=" col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="destination" name="destination"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:515px;" value="${requestScope.plan.destination }">
								<input type="hidden" id="latitude" name="latitude"
									 value="${requestScope.plan.latitude }">
								<input type="hidden" id="longitude" name="longitude"
									 value="${requestScope.plan.longitude }">
								<button id="searchMap" type="button" class="btn btn-success">주소찾기</button>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >내용</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								<textarea name="pContent" class="resizable_textarea form-control" rows="3" style="width: 100%">${requestScope.plan.pContent }</textarea>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">첨부파일</label>&nbsp;&nbsp;
								
								<c:if test="${fn:length(requestScope.plan.files) != 0 }">
									<c:forEach var="file" items="${requestScope.plan.files }" varStatus="loop">
										<c:url var="deleteUrl" value="/admin/removePlanFile.do" scope="page" >
											<c:param name="fileNo" value="${pageScope.file.fileNo }" />
										</c:url>
										${pageScope.file.fileName }
										<button type="button" value="${pageScope.file.fileNo }" class="btn btn-primary deleteBtn" >삭제</button>
									</c:forEach>
								</c:if>
								<c:if test="${fn:length(requestScope.plan.files) == 0 }" >
									<div class="btn-group">
										<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
										<i class="fa fa-picture-o"></i></a>
										<input name="upload" type="file" data-role="magic-overlay" data-target="#fileBtn"
												data-edit="insertImage" >
									</div>
								</c:if>
								
						</div>


						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">중요도 *</label>
								<div class="form-group">
									&nbsp;&nbsp;
									하: <input type="radio" name="pImpt" value="1" <c:if test="${requestScope.plan.pImpt == 1}">checked=""</c:if>>
									&nbsp;&nbsp;
									중: <input type="radio" name="pImpt" value="2" <c:if test="${requestScope.plan.pImpt == 2}">checked=""</c:if>>
									&nbsp;&nbsp;
									상: <input type="radio" name="pImpt" value="3" <c:if test="${requestScope.plan.pImpt == 3}">checked=""</c:if>>
								</div>
							</div>

						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" for="empName">담당자 지정 *</label>
							<div class="input-group col-md-6 col-sm-6 col-xs-12">
								<input type="hidden" id="rspbNo" name="rspbNo" value="${requestScope.plan.rspbNo }">
								<input type="text" id="empName" name="empName" class="form-control"
									readonly value="${requestScope.plan.empName }" >
									<span class="input-group-btn">
										<button id="searchEmp" type="button" class="btn btn-primary" data-toggle="modal">검색</button>
							</div>
						</div>


						<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<c:url var="detailURL" value="/admin/detailPlan.do" scope="page" >
										<c:param name="pNo" value="${requestScope.plan.pNo }" />
									</c:url>
									<a id="modify" href="${pageScope.detailURL }"  ><button class="btn btn-primary" type="button">뒤로가기</button></a>
									<button id="modifyBtn" type="submit"  class="btn btn-success ">수정</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- 모달 팝업 -->
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
							
				<div class="modal-body" id="chartBody"></div>
							
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="modalChooseBtn"
							data-dismiss="modal">선택</button>
					<button type="button" class="btn btn-default" id="modalCloseBtn"
							data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달 팝업 -->
	<div class="modal fade" id="layerpop2">
		<div class="modal-dialog modal-cSize">
			<div class="modal-content modal-cSize">
							
				<div class="modal-body" id="mapBody"></div>
							
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="modalChooseBtn2"
							data-dismiss="modal">선택</button>
					<button type="button" class="btn btn-default" id="modalCloseBtn2"
							data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
</form>
</body>
</html>