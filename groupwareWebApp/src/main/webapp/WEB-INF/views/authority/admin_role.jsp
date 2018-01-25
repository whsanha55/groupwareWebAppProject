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
	<!-- 역할 등록 -->
	<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>역할 등록</h2>
                    
                    <div class="clearfix"></div>
                  </div>
              <div class="x_content">
               <div class="col-md-12" style="margin:40px 0;">
                   <label class="control-label col-md-2" for="first-name">롤 명
                  </label>
                  <div class="col-md-8">
                    <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                  </div>
               </div>
               <div class="col-md-12" style="margin-bottom:40px;">
                  <label class="control-label col-md-2" for="first-name">롤 설명
                  </label>
                  <div class="col-md-8">
                    <input type="text" id="first-name2" required="required" class="form-control col-md-7 col-xs-12">
                  </div>
               </div>
               <div class="col-md-12" style="margin-bottom:40px;">
                  <label class="control-label col-md-2" for="first-name">롤 타입
                  </label>
                  <div class="col-md-8">
                    <label class="radio-inline"> <input
										type="radio" name="inlineRadioOptions" id="inlineRadio1"
										value="option1"> url
								</label> <label class="radio-inline"> <input type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
									   method
								</label>
                  </div>
               </div>   
                  </div>
              <div class="text-center">
                   <a class="btn btn-primary" href='<c:url value="/admin/designRole.do"/>'>등록</a>
                  <button class="btn btn-default">취소</button>
               </div>
                </div>
              </div>
</body>
</html>