<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel='stylesheet' type='text/css' href='/js/fullcalendar/fullcalendar.css' />
<!-- <script type='text/javascript' src='/js/jquery/jquery-1.4.3.min.js'></script> -->

<link type="text/css" href="/js/jquery/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
<script type="text/javascript" src='/js/jquery/jquery-1.6.2.js'></script>
<script type="text/javascript" src="/js/jquery/ui/jquery-ui-1.8.16.custom.js"></script>

<script type='text/javascript' src='/js/jquery/jquery-ui-1.8.5.custom.min.js'></script>
<script type='text/javascript' src='/js/fullcalendar/fullcalendar.js'></script>

<script type='text/javascript'>

	$(document).ready(function() {
		
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		var calendar = $('#calendar').fullCalendar({
			
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				
				var title = prompt('일정을 입력하세요.');
				if (title) {
				
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
				
			},
			editable: true,
			events: [
				{
					title: '01 All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: '02 Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: '03 Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: '04 Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: '05 Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: '06 Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: '07 Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false // 주간의 나타남, true 나타나지않음
				},
				{
					title: '08 Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]
		});
		
		
	});
</script>

<style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>
