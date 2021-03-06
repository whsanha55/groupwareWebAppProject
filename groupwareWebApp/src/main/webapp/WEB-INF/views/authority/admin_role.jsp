<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>content</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	
	//등록
	$('#addRole').on('click',function(){
		event.preventDefault();
		checkUnload = false;   
		    
		if($($('input:text[name=rName]')).val() == "" ){
			swal("롤명을 입력하세요.");
			$('#rName').focus();
			return;
		} 
		
		if($($('input:text[name=rExplan]')).val() == "" ){
			swal("롤 설명을 입력하세요.");
			$('#rExplan').focus();
			return;
		} 
	
		if($("#sort").val() == ""){
			swal("롤 Sort를 입력해주세요.");
			$('#sort').focus;
			return;
	   }
		if($("#sort").val() >= 100) {
			swal("롤 Sort는 1~100사이로 입력해주세요.");
			$('#sort').focus;
			return;
		}
		
		swal({
			title: "역할 등록",   
			text: "역할을 등록합니다. 계속 진행하시겠습니까?",
			icon: "info",
			buttons : true 
		}).then((e) => {
			if(e) {
				$.ajax({
					
					url: '${pageContext.request.contextPath}/admin/role.do'
					,
					method: 'POST'
					,
					dataType: 'json'
					,
					data: $('#form').serialize()
					,
					success: function(data){
						
						//성공시 sweetAlert
						if(data.isSuccess == "true"){
							swal({
							title: "역할 등록 완료",
							text: "역할을 등록하였습니다.",
							icon: "success"
							}).then((e)=>{
								location.href = '${pageContext.request.contextPath}/admin/roleList.do';
	
							});
						}else if(data.isFail == "false"){
                            swal("이미 등록된 롤입니다.");
                        } 
						
					}
					,
					
					error: function(jqXHR) {
						alert("error : " + jqXHR.status);
					}
				});
			} 
		});		
	});
});
</script>
</head>
<body>
	<!-- 역할 등록 -->
	<%-- <form id="add" action="<%=request.getContextPath()%>/admin/role.do" method="post" enctype="multipart/form-data"> --%>
	<form id="form">
	<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>역할 추가</h2>
                    
                    <div class="clearfix"></div>
                  </div>
              <div class="x_content">
               <div class="col-md-12" style="margin:40px 0;">
                   <label class="control-label col-md-2" for="first-name" >롤 명
                  </label>
                  <div class="col-md-8">
                    <input type="text" id="first-name2" name="rName" required="required" class="form-control col-md-7 col-xs-12">
                  </div>
               </div>
               <div class="col-md-12" style="margin-bottom:40px;">
                  <label class="control-label col-md-2" for="first-name" >롤 설명
                  </label>
                  <div class="col-md-8">
                    <input type="text" id="first-name2" name="rExplan" required="required" class="form-control col-md-7 col-xs-12" >
                  </div>
               </div>
               <div class="col-md-12" style="margin-bottom:40px;">
                  <label class="control-label col-md-2" for="first-name" >롤 Sort
                  </label>
                  <div class="col-md-8">
                    <input type="number"  min = "1" max = "100" step = "1"  id="sort" name="sortOrder" class="form-control col-md-7 col-xs-12">
                  </div>
               </div>
               <div class="col-md-12" style="margin-bottom:40px;">
                  <label class="control-label col-md-2" for="first-name" >롤 타입</label>
                  <div class="col-md-8">
                    <label class="radio-inline"> <input type="radio" name="rType" id="inlineRadio1" value="url" checked="checked"> url
								</label> <label class="radio-inline"> <input type="radio"
										name="rType" id="inlineRadio2" value="method">
									   method
								</label>
                  </div>
               </div>   
                  </div>
              <div class="text-center">
               	  <button type="button" class="btn btn-primary" id='addRole'>등록</button>&nbsp;
                  <button type="reset" class="btn btn-default">취소</button>
                  <a class="btn btn-default" href='<c:url value="/admin/roleList.do"/>'>뒤로가기</a>
               </div>
                </div>
              </div>
              </form>
</body>
</html>