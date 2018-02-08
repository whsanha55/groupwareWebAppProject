<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.groupware.domain.employee.CodeVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.css" rel="stylesheet">
<title>content</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.js"></script>
<style type="text/css">
    .fc-sun {color:#e31b23}
	.fc-sat {color:#007dc3}
</style>
<style>
	#calendar {
		margin:0px 20px;
		padding: 30px;
		border: 1px solid gray;
	}
</style>
<script>
$(document).ready(function(){ 
	
	var dataset =
		[
			<c:forEach var="plan" items="${plans}" varStatus="loop">
				{
					id : '${plan.pNo}'
					,
					<c:if test="${plan.pImpt == 3}" >
						color : "#FF0000"
						,
						textColor : "white"
					</c:if>
					<c:if test="${plan.pImpt == 2}" >
						color : "#0000FF"
						,
						textColor : "white"
					</c:if>
					<c:if test="${plan.pImpt == 1}" >
						color : "#008000"
						,
						textColor : "white"
					</c:if>
					,
					title : "${plan.pTitle}"
					,
					start : "${plan.startDate}"
					,
					end : "${plan.endDate}"
					,
					url : "${pageContext.request.contextPath}/detailPlan.do?pNo=${plan.pNo}"
				} <c:if test="${!loop.last}" >,</c:if>
			</c:forEach>
		]
	
	$('#calendar').fullCalendar ({
		header: {
			right: 'prev,next today',
			center: 'title',
			left: 'month,listWeek,listDay'
		},
		slotEventOverlap: false,
		allDaySlot: false,
		eventClick : function(calEvent,jsEvent,view) {
			if (event.url) {
				 return event.url;
			 }
		},
		defaultDate: new Date(),
		views: {
	        month: {
	            titleFormat: "YYYY년 MMMM",                  
	        },
	        week: {
	        	titleFormat: "YYYY년 MMM D일",
	        	columnFormat: "M/D ddd"
	        },
	        day: {
	            titleFormat: "YYYY년 MMMM D일",
	            columnFormat: "MMMM D일",           
	        }
	    },
	    timeFormat: 't[m] H:mm',
		navLinks: true,
		editable: false,
		eventLimit: true,
		height: 600,
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort: ["일","월","화","수","목","금","토"],
		buttonText: {
			   today : "오늘",
			   month : "월별",
			   week : "주별",
			   day : "일별",
		},
		events : dataset
		
			  
	});
});
    

</script>

          <!-- top tiles -->
          
		  <div class="col-md-12 col-sm-12 col-xs-12 dashboard_graph" style="margin-bottom:10px;">
		  <a><i class="glyphicon glyphicon-plus"></i></a>
          기능 모아보기
          </div>
		  <br>
          <!-- /top tiles -->

          <div class="row">
			<div class="col-md-2 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_200">
               <dl style="margin-top:40px;">
					<dt class="text-center"><a><i class="fa fa-file-text fa-5x" aria-hidden="true"></i></a></dt>
					<dd><h2 class="text-center"><a><strong>게시판</strong></a></h2></dd>
				</dl>
              </div>
            </div>
			<div class="col-md-2 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_200">
               <dl style="margin-top:40px;">
					<dt class="text-center"><a><i class="fa fa-comments-o fa-5x" aria-hidden="true"></i></dt>
					<dd><h2 class="text-center"><a><strong>쪽지함</strong></a></h2></dd>
				</dl>
              </div>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_200">
				<dl style="margin-top:40px;">
					<dt class="text-center"><a><i class="fa fa-briefcase fa-5x" aria-hidden="true"></i></dt>
					<dd><h2 class="text-center"><a><strong>문서작성</strong></a></h2></dd>
				</dl>
              </div>
            </div>

            <div class="col-md-2 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_200">
               <dl style="margin-top:40px;">
					<dt class="text-center"><a><i class="fa fa-chevron-circle-down fa-5x" aria-hidden="true"></i></dt>
					<dd><h2 class="text-center"><a><strong>결재대기함</strong></a></h2></dd>
				</dl>
              </div>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_200">
				<dl style="margin-top:40px;">
					<dt class="text-center"><a><i class="fa fa-picture-o fa-5x" aria-hidden="true"></i></a></dt>
					<dd><h2 class="text-center"><a><strong>마이페이지</strong></a></h2></dd>
				</dl>
			   
              </div>
            </div>
            			<div class="col-md-2 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_200">
               <dl style="margin-top:40px;">
					<dt class="text-center"><a><i class="fa fa-bell fa-5x" aria-hidden="true"></i></a></dt>
					<dd><h2 class="text-center"><a><strong>알림사항</strong></a></h2></dd>
				</dl>
              </div>
            </div>
          </div>
          <div class="row">
          	<!-- 캘린더  -->
            <div class="col-md-8 col-sm-4 col-xs-12">
				<div id='calendar'>중요도 - 하:초록 / 중:파랑 / 상:빨강</div>
            </div>
            <!-- 캘린더 end  -->
			<div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>주요 공지 <small>공지사항</small></h2>
                   <div class="pull-right"><a><i class="glyphicon glyphicon-plus"></i></a></div>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">

                    <ul class="list-unstyled timeline widget">
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                <a style="cursor:pointer">[인트라넷] 커피머신 필터 교체</a>
                            </h2>
                            
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                <a style="cursor:pointer">[인트라넷] 커피머신 필터 교체</a>
                            </h2>
                          </div>
                        </div>
                      </li>
                      <li>
						<div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                <a style="cursor:pointer">[인트라넷] 커피머신 필터 교체</a>
                            </h2>
                          </div>
                        </div>
                      </li>
						<div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                <a style="cursor:pointer">[인트라넷] 커피머신 필터 교체</a>
                            </h2>
                          </div>
                        </div>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                <a style="cursor:pointer">[인트라넷] 커피머신 필터 교체</a>
                            </h2>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

              </div>
              
                
               
                
</body>
</html>