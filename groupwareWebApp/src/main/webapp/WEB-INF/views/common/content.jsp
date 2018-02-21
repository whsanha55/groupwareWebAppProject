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
<link
	href="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.css"
	rel="stylesheet">
<style>
.fc-sun {
	color: #e31b23
}

.fc-sat {
	color: #007dc3
}
#calendar {
	margin: 0px 20px;
	padding: 30px;
	border: 1px solid gray;
}
</style>
</head>
<body>
	<script
		src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.js"></script>

	<script>
$(document).ready(function(){ 
	NoticeList();
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
					<c:if test="${plan.cName == '부서'}" >
						title : "${plan.pTitle} - 전체"
					</c:if>
					<c:if test="${plan.cName != '부서'}" >
						title : "${plan.pTitle} - ${plan.cName}"
					</c:if>
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
	
	
	//공지사항
	function NoticeList() {	
		
		$.ajax({
			url: '${pageContext.request.contextPath}/MainPagingAjax.do' 
			,
			type: 'POST' ,
			cache: false ,
			dataType: 'json' ,
			success: function (data, textStatus, jqXHR) {
				//datatable테이블 변경하기
				var text = "";
				for(var i=0;i<data.notices.length;i++) {
					text += "<li>";
					text += "<div class='block'>";
					text += "<div class='block_content'>";
					text += "<h2 class='title'>";
					text += "<a href='${pageContext.request.contextPath}/detailNotice.do?noticeNo=" 
							+data.notices[i].noticeNo +" '>"+ data.notices[i].noticeTitle + "</a>";
					text += "</h2>";
					text += "</div>";
					text += "</div>";
					text += "</li>";
				}
				$('#noticeList').html(text);
		
				
			} ,
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}
			
		});
		

	} //공지사항 끝
	
	
	
});
    

</script>

	
	<br>
	<!-- /top tiles -->

	<div class="row">
		<a href='<c:url value="/postList.do?boardNo=235"/>'>
			<div class="col-md-2 col-sm-4 col-xs-12">
				<div class="x_panel tile fixed_height_200">
					<dl style="margin-top: 40px;">
						<dt class="text-center">
								<img alt="게시판" src="${pageContext.request.contextPath}/resources/images/icon4.png">
						</dt>
						<dd>
							<h2 class="text-center">
									<strong>게시판</strong>
							</h2>
						</dd>
					</dl>
				</div>
			</div>
		</a>
		<a href='<c:url value="/approvalMyRequest.do"/>'>
			<div class="col-md-2 col-sm-4 col-xs-12">
				<div class="x_panel tile fixed_height_200">
					<dl style="margin-top: 40px;">
						<dt class="text-center">
								<img alt="결재요청" src="${pageContext.request.contextPath}/resources/images/icon3.png">
						</dt>
						<dd>
							<h2 class="text-center">
								<strong>결재요청</strong>
							</h2>
						</dd>
					</dl>
				</div>
			</div>
		</a>
		
		<a href='<c:url value="/selectTemplate.do"/>'>
			<div class="col-md-2 col-sm-4 col-xs-12">
				<div class="x_panel tile fixed_height_200">
					<dl style="margin-top: 40px;">
						<dt class="text-center">
							<img alt="문서작성" src="${pageContext.request.contextPath}/resources/images/icon5.png">
						</dt>
						<dd>
							<h2 class="text-center">
								<strong>문서작성</strong>
							</h2>
						</dd>
					</dl>
				</div>
			</div>
	    </a>
	    
	    <a href='<c:url value="/approvalTodo.do"/>'>
			<div class="col-md-2 col-sm-4 col-xs-12">
				<div class="x_panel tile fixed_height_200">
					<dl style="margin-top: 40px;">
						<dt class="text-center">
							<img alt="결재대기함" src="${pageContext.request.contextPath}/resources/images/icon2.png">
						</dt>
						<dd>
							<h2 class="text-center">
								<strong>결재대기함</strong>
							</h2>
						</dd>
					</dl>
				</div>
			</div>
		</a>
		
		<a href='<c:url value="/detailEmployee.do"/>'>
			<div class="col-md-2 col-sm-4 col-xs-12">
				<div class="x_panel tile fixed_height_200">
					<dl style="margin-top: 40px;">
						<dt class="text-center">
							<img alt="결재요청" src="${pageContext.request.contextPath}/resources/images/icon7.png">
						</dt>
						<dd>
							<h2 class="text-center">
								<strong>마이페이지</strong>
							</h2>
						</dd>
					</dl>
	
				</div>
			</div>
		</a>
		<a href='<c:url value="/approvalFinish.do"/>'>
		<div class="col-md-2 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_200">
				<dl style="margin-top: 40px;">
					<dt class="text-center">
						<img alt="승인문서함" src="${pageContext.request.contextPath}/resources/images/icon6.png">
					</dt>
					<dd>
						<h2 class="text-center">
							<strong>승인문서함</strong>
						</h2>
					</dd>
				</dl>
			</div>
		</div>
		</a>
	</div>
	<div class="row">
		<!-- 캘린더  -->
		<div class="col-md-8 col-sm-4 col-xs-12">
			<div id='calendar'>※중요도 - 하:초록 / 중:파랑 / 상:빨강</div>
		</div>
		<!-- 캘린더 end  -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel">
				<div class="x_title">
					<h2>
						주요 공지 <small>공지사항</small>
					</h2>
					<div class="pull-right">
						<a href='<c:url value="/noticeList.do"/>'><i
							class="glyphicon glyphicon-plus"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="dashboard-widget-content">
						<ul id="noticeList" class="list-unstyled timeline widget">

							
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>




</body>
</html>