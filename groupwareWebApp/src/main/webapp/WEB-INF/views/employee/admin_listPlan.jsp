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
var eKeyfield;
var eKeyword;
$(document).ready(function(){ 
	
	planPaging();
	
	
	
	//검색조건
	$('.search-panel .dropdown-menu').on('click','a',function(e) {
		e.preventDefault();
		$('.keyfield').text($(this).text());
		$('.keyfield').attr('id',$(this).attr('id'));
	});

	//검색조건 엔터키 눌렀을때 트리거 발동
	$('#keyword').on('keydown', function(e) {
		if(e.keyCode == 13){
			$('#findPlan').trigger('click');
        }
	});
	
	//일정 등록 페이지 이동
	$('#insert').click(function(){
    	location.href = "${pageContext.request.contextPath}/admin/registerPlan.do";
	});
	
	// 검색 실행
	$('#findPlan').on('click', function() {
		if($('.keyfield').attr('id') == undefined) {
			swal("검색조건을 선택해주세요!","", "error");
			return false;
		} else if($('#keyword').val() == "") {
			eKeyfield = $('.keyfield').attr('id');
			eKeyword = $('#keyword').val();
			
			console.log(eKeyfield);
			console.log(eKeyword);
			
			planPaging();
		}
		
		eKeyfield = $('.keyfield').attr('id');
		eKeyword = $('#keyword').val();
		
		console.log(eKeyfield);
		console.log(eKeyword);
		
		planPaging();
			
	});
	
	function planPaging() {
		
		$.ajax ({
			url: '${pageContext.request.contextPath}/admin/listPlanAjax.do'
			,
			data : {
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
				
				var dataset = "";
				if(data.totalCount == 0) {
					dataset += '[]'
				} else {
					for(var i=0; i<data.plans.length; i++) {
						dataset += "[";
						dataset += "{";
						dataset += "id : '" + data.plans[i].pNo + "',";
						if(data.plans[i].pImpt == 3) {
							dataset += "color : '" + "'#fb4b4b',";
							dataset += "textColor : '" + "'white',";
						} else if(data.plans[i].pImpt == 2) {
							dataset += "color : '" + "'#3a87ad',";
							dataset += "textColor : '" + "'white',";
						} else if(data.plans[i].pImpt == 1) {
							dataset += "color : '" + "'#47b747',";
							dataset += "textColor : '" + "'white',";
						} else {
							
						}
						if(data.plans[i].cName == '부서') {
							dataset += "title : '" + data.plans[i].pNo + " - 전체',";
						} else if(data.plans[i].cName != '부서') {
							dataset += "title : '" + data.plans[i].pNo + " - " + data.plans[i].cName + "',";
						} else {
							
						}
						dataset += "start : '" + data.plans[i].startDate + "',";
						dataset += "end : '" + data.plans[i].endDate + "',";
						dataset += "url : '${pageContext.request.contextPath}/admin/detailPlan.do?pNo=" + data.plans[i].pNo + "',";
						dataset += "}";
						dataset += "]";
					}
				}
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
			}
			,
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}
		});
	}
	
	
	/* var dataset =
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
					url : "${pageContext.request.contextPath}/admin/detailPlan.do?pNo=${plan.pNo}"
				} <c:if test="${!loop.last}" >,</c:if>
			</c:forEach>
		] */
	
	/* $('#calendar').fullCalendar ({
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
			  
	}); */
});
    

</script>
</body>
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title col-md-12">
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-6">
							<div class="col-md-2">
								<h2>일정목록</h2>
							</div>
							<button type="button" id="insert" class="btn btn-primary">등록</button>
						</div>
					</div>
					<div>
						<div class="col-md-4 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										<span class="keyfield">검색조건</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu" >
										<li><a id="pTitle">제목</a></li>
										<li><a id="cName">담당자</a></li>
									</ul>
								</div>
								<input type="hidden" name="search_param" value="all" id="search_param">
								<input type="text" class="form-control" id="keyword" name="x" placeholder="대문자, 소문자를 구분해주세요!">
								<span class="input-group-btn">
									<button id="findPlan" class="btn btn-default" type="button">
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