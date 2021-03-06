<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=ad3a3657ebba1b7547bc9c0a370b50dc&libraries=services"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.js"></script>
<style>
.modal-dialog.modal-cSize {
	width:600px;
	height:auto;
}
input[type=file]:before {
  width: 80px;
  height: 30px;
  font-size: 14px;
  line-height: 30px;
  color:#fff;
  content: '파일선택';
  display: inline-block;
  background: #26B99A;
    border: 1px solid #169F85;
       border-radius: 3px;
  padding: 0 10px;
  text-align: center;
  font-family: Helvetica, Arial, sans-serif;
}

	input[type=file] {
  cursor: pointer;
  width: 80px;
  height: 30px;
  overflow: hidden;
}
</style>
<script>


$(document).ready(function() {
	
	$('input[name=startDate]').focus(function() {	
		$('input[name=endDate]').next('span').text("");
	});
	
	$('input[name=endDate]').focus(function() {	
		$(this).next('span').text("");
	});
	
	$('input[name=endDate]').blur(function() {	
		if($('input[name=startDate]').val() >= $(this).val()) {
			console.log($(this).next());
			$(this).next().text("시작일이 종료일보다 클 수 없습니다.");
		}
	});	
	
	$('input[name=startDate]').blur(function() {	
		if($(this).val() >= $('input[name=endDate]').val()) {
			console.log($(this).next());
			$('input[name=endDate]').next().text("시작일이 종료일보다 클 수 없습니다.");
		}
	});	
	
	$('#startDate1').datetimepicker({
		format : "YYYY/MM/DD HH:mm",		
		defaultDate : new Date()
	});
	
	$('#endDate1').datetimepicker({
		format : "YYYY/MM/DD HH:mm",	 
		defaultDate : new Date()
	});
	
	$('#registerBtn').on('click', function() {
		event.preventDefault();
		checkUnload = false;
		if($('input[name=pTitle]').val().trim() == '') {
			swal("제목을 입력해주세요.","");
			return;
		}
		if($('input[name=pTitle]').val().length > 20) {
			swal("제목은 20자 이하로 작성해주세요.","");
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
		if($('textarea[name=pContent]').val().trim() == '') {
			swal("내용을 입력해주세요.","");
			return;
		}
		if($('textarea[name=pContent]').val().length > 200) {
			swal("내용은 200자 이하로 작성해주세요.","");
			return;
		}
		if($('input[name=empName]').val().trim() == '') {
			swal("담당자를 지정해주세요.","");
			return;
		}
		swal({
			title: "일정 등록",
			text: "일정을 등록합니다. 계속 진행하시겠습니까?",
			icon: "info",
			buttons : true 
		}).then((e) => {
			if(e) {
				$('#register').submit();
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
	
	
	$('#return').click(function(){
		location.reload();
	});
	
	/* $('#return').click(function() {
		$('#plan').load("${pageContext.request.contextPath}/admin/registerPlan.do" + "#plan");
	}); */
	
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
	
});
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
					<h2>일정등록</h2>
					<div class="clearfix"></div>
				</div>
				<div id="plan" class="x_content">
					<br>
					<form id="register" data-parsley-validate="" class="form-horizontal form-label-left"
							action="${pageContext.request.contextPath }/admin/registerPlan.do" method="post"
							enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >일정구분 *</label>&nbsp;&nbsp;
							<select id="p_Class" name="pClass" style="width:100px;height:30px;">
							<option value="1">회의</option>
							<option value="2">교육</option>
							<option value="3">기타</option>
							</select>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >부서 *</label>&nbsp;&nbsp;
							<select id="deptNo" name="deptNo" style="width:100px;height:30px;">
							<option value="A">전체</option>
							<c:forEach var="deptCode" items="${requestScope.deptCodes }" varStatus="loop">
								<option value="${pageScope.deptCode.key }">${pageScope.deptCode.title }</option>
							</c:forEach>
							</select>
						</div>
						
						
						<br>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >제목 *</label>&nbsp;&nbsp;
							<div class="col-md-10 col-sm-6 col-xs-12">
								<input type="text" name="pTitle" class="form-control" placeholder="제목을 입력해주세요."
										style="width:600px;" required="required">
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
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >기간 *</label>&nbsp;&nbsp;
							</label>
							<div class="form-inline col-md-9 col-sm-6 col-xs-12">
								<input type="text" id="startDate1" class="form-control" name="startDate"
										required="required" style="width:200px;">&nbsp;&nbsp;&nbsp;
										~&nbsp;&nbsp;&nbsp;
								<input type="text" id="endDate1"	class="form-control" name="endDate"
										required="required" style="width:200px;">
								<span></span>
							</div>
						</div>
						
		
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >장소 *</label>&nbsp;&nbsp;
							<div class=" col-md-6 col-sm-6 col-xs-12">
								<input type="text" id="destination" name="destination"
									required="required" class="form-control col-md-10 col-xs-12"
									style="width:435px;" value='비트캠프'>
								<input type="hidden" id="latitude" name="latitude" value="37.49952673450098">
								<input type="hidden" id="longitude" name="longitude" value="127.0292843723033">
								<button id="searchMap" type="button" class="btn btn-success" style="margin-left:5px;">주소찾기</button>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" >내용 *</label>&nbsp;&nbsp;
							<div class="col-md-6 col-sm-6 col-xs-12">
								 <textarea id="pContent" name="pContent" class="resizable_textarea form-control" rows="3" style="width:100%;resize:none;" ></textarea>
							</div>

						</div>
						
						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">첨부파일</label>
							<div class="btn-group">
								<a class="btn" title="Insert picture (or just drag &amp; drop)" id="fileBtn">
								<i class="fa fa-picture-o"></i></a>
								<input name="upload" type="file" data-role="magic-overlay" data-target="#fileBtn"
										data-edit="insertImage" >
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12">중요도 *</label>
								<div class="form-group">
									&nbsp;&nbsp;
									하: <input type="radio" name="pImpt" id="pImpt" value="1" checked="">
									&nbsp;&nbsp;
									중: <input type="radio" name="pImpt" id="pImpt" value="2">
									&nbsp;&nbsp;
									상: <input type="radio" name="pImpt" id="pImpt" value="3">
								</div>
							</div>


						<div class="form-group">
							<label class="control-label col-md-1 col-sm-3 col-xs-12" for="empName">담당자 지정 *</label>
							<div class="input-group col-md-6 col-sm-6 col-xs-12">
								<input type="hidden" id="rspbNo" name="rspbNo" value="" >
								<input type="text" id="empName" name="empName" class="form-control" style="width:435px;" readonly>
									<span class="input-group-btn">
									<button id="searchEmp" type="button" class="btn btn-primary" data-toggle="modal" style="margin-right:129px;">검색</button>
							</div>
						</div>


						<div class="ln_solid"></div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
									<c:url var="listPlanURL" value="/admin/listPlan.do" scope="page" ></c:url>
									<a id="list" href="${pageScope.listPlanURL }"  ><button class="btn btn-primary" type="button">뒤로가기</button></a>
									<button id="registerBtn" type="submit" class="btn btn-success">등록</button>
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