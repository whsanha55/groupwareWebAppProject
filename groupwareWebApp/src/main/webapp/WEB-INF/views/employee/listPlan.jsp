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
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.js"></script>
<style type="text/css">
    .fc-sun {color:#e31b23}
	.fc-sat {color:#007dc3}
</style>
<script>
$(document).ready(function(){ 
	
	$('#allPlanList').click(function(){
    	location.href = "${pageContext.request.contextPath}/listPlanAll.do";
	});
	
	var dataset =
		[
			<c:forEach var="plan" items="${plans}" varStatus="loop">
				{
					id : '${plan.pNo}'
					,
					<c:if test="${plan.pImpt == 3}" >
						color : "#fb4b4b"
						,
						textColor : "white"
					</c:if>
					<c:if test="${plan.pImpt == 2}" >
						color : "#3a87ad"
						,
						textColor : "white"
					</c:if>
					<c:if test="${plan.pImpt == 1}" >
						color : "#47b747"
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
</body>
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title col-md-12">
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>일정목록</h2>
							</div>
							<button type="button" id="allPlanList" class="btn btn-primary">모든 일정 보기</button>
						</div>
					</div>
					<div>
						<div class="col-md-3 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<span id="search_concept">검색</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#contains">제목</a></li>
										<li><a href="#its_equal">담당자</a></li>
									</ul>
								</div>
								<input type="hidden" name="search_param" value="all"
									id="search_param"> <input type="text"
									class="form-control" name="x" placeholder="Search term...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
		
		<div id='calendar'>※중요도 - 하:초록 / 중:파랑 / 상:빨강</div>

</html>