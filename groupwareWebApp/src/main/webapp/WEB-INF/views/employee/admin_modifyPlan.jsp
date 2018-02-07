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
<script>
var eKeyfield;
var eKeyword;

$(document).ready(function () {		

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
		
		alert($(this).val());
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
	
	
	$('#searchEmp').click(function() {
		$('#chartBody').load('${pageContext.request.contextPath}/organizationChart.do');
		$('#layerpop').modal({
			backdrop: 'static', 
			keyboard: false
		});
	});
	
	$('#modalCloseBtn').on('click',function() {
		$('#chartBody').html("");
		 
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
					<form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left"
							action="${pageContext.request.contextPath }/admin/modifyPlan.do" method="post"
							enctype="multipart/form-data">
						<input type="hidden" name="pNo" value="${requestScope.plan.pNo }">
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >일정구분</label>&nbsp;&nbsp;
							<select id="p_Class" name="pClass" style="width:100px;height:30px;" value="${requestScope.plan.pClass }" >
							<option value="1" <c:if test="${requestScope.plan.pClass == 1}">selected</c:if>>회의</option>
							<option value="2" <c:if test="${requestScope.plan.pClass == 2}">selected</c:if>>교육</option>
							<option value="3" <c:if test="${requestScope.plan.pClass == 3}">selected</c:if>>기타</option>
							</select>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >부서</label>&nbsp;&nbsp;
							<select id="deptNo" name="deptNo" style="width:100px;height:30px;" value="${requestScope.plan.deptNo }">
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.key }" <c:if test="${requestScope.plan.deptNo  == pageScope.deptCode.key}">
								selected</c:if>>${pageScope.deptCode.title }</option>
							</c:forEach>
							</select>
						</div>
						
						
						<br>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >제목</label>&nbsp;&nbsp;
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" name="pTitle" class="form-control" placeholder="제목을 입력해주세요."
										style="width:1000px;" value="${requestScope.plan.pTitle }" required="required">
							</div>
						</div>
						
						<div class="form-group">
							<!-- <label class="control-label col-md-1 col-sm-3 col-xs-12" >반복구분</label>
							<div class="form-group">
								&nbsp;&nbsp;
								당일:<input type="radio" class="flat" name="gender" id="genderM" value="M" checked="" required="">
								&nbsp;&nbsp;
								반복: <input type="radio" class="flat" name="gender" id="genderF" value="F">
							</div> -->
						</div>

						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >기간</label>&nbsp;&nbsp;
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
													class="form-control" required="required" value="${requestScope.plan.startDate }">
												<span class="add-on input-group-addon">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
												<input type="datetime-local" name="endDate" id="endDate" 
														class="form-control" required="required" value="${requestScope.plan.endDate }" >
											</div>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >장소</label>&nbsp;&nbsp;
							<div class=" col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="latitude" name="latitude"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:100px;" value="${requestScope.plan.latitude }">
								<input type="text" id="longitude" name="longitude"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:100px;" value="${requestScope.plan.longitude }">
								<button type="button" class="btn btn-success">주소찾기</button>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >내용</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="pContent" name="pContent"
									required="required" class="form-control col-md-10 col-xs-12" 
									style="width:1000px;height:100px;" value="${requestScope.plan.pContent }">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">첨부파일</label>&nbsp;&nbsp;
								<c:if test="${fn:length(requestScope.plan.files) > 0 }">
									<c:forEach var="file" items="${requestScope.plan.files }" varStatus="loop">
										<c:url var="deleteUrl" value="/admin/removePlanFile.do" scope="page" >
											<c:param name="fileNo" value="${pageScope.file.fileNo }" />
										</c:url>
										${pageScope.file.fileName }
										<button type="button" value="${pageScope.file.fileNo }" class="btn btn-primary deleteBtn" >삭제</button>
									</c:forEach>
									<div class="btn-group">
										<input name="upload" type="hidden" data-role="magic-overlay" data-target="#fileBtn"
												data-edit="insertImage">
									</div>
								</c:if>
								<c:if test="${fn:length(requestScope.plan.files) == 0 }" >
									<div class="btn-group">
										<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
										<i class="fa fa-picture-o"></i></a>
										<input name="upload" type="file" data-role="magic-overlay" data-target="#fileBtn"
												data-edit="insertImage" required="required">
									</div>
								</c:if>
							
						</div>
						<!-- <div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12"></label>
							<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
								<i class="fa fa-picture-o"></i></a>
								<input name="upload" type="file" data-role="magic-overlay" data-target="#fileBtn"
										data-edit="insertImage">
							</div>
						</div> -->
						



						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">중요도</label>
								<div class="form-group">
									&nbsp;&nbsp;
									하: <input type="radio" name="pImpt" id="pImpt" value="1" <c:if test="${requestScope.plan.pImpt == 1}">checked=""</c:if>>
									&nbsp;&nbsp;
									중: <input type="radio" name="pImpt" id="pImpt" value="2" <c:if test="${requestScope.plan.pImpt == 2}">checked=""</c:if>>
									&nbsp;&nbsp;
									상: <input type="radio" name="pImpt" id="pImpt" value="3" <c:if test="${requestScope.plan.pImpt == 3}">checked=""</c:if>>
								</div>
							</div>

						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" for="empName">담당자 지정</label>
							<div class="input-group col-md-6 col-sm-6 col-xs-12">
								<input type="hidden" id="rspbNo" name="rspbNo" value="${requestScope.plan.rspbNo }">
								<input type="text" id="empName" name="empName" class="form-control" readonly value="${requestScope.plan.empName }">
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
									<button type="submit" class="btn btn-success">수정</button>
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
					<button type="button" class="btn btn-default" id="modalCloseBtn"
							data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>