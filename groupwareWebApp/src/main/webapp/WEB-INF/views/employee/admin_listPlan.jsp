<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.css" rel="stylesheet">
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.js"></script>
<script>

$(document).ready(function() {

    $('#calendar').fullCalendar({
	
	})
    
    $('#insert').click(function(){
    	location.href = "${pageContext.request.contextPath}/admin/registerPlan.do";
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
							<button type="button" id="insert" class="btn btn-primary">등록</button>
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
		
		<div id='calendar'></div>

</html>