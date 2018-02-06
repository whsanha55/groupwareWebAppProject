<%--header.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>header</title>

<script>

	$(document).ready(function(){	//잠시 끕시다.. 콘솔에 깜빡깜빡
		//var msg = setInterval(newMsg, 2000);
		//var note = setInterval(newNote, 2000);
				
		//알림 조회 컨트롤러로 이동
		
		//var alarm = setInterval(newAlarm, 3000);
		
		
		
		
	});
	
	function newAlarm() {
		
		$.ajax({
			
			url: '${pageContext.request.contextPath}/retrieveNotifications.do'
			,
			method : 'GET'
			,
			dataType: 'json'
			,
			success: function(data) {
				
				$('#menu1').empty();
				
				var htmlStr = "";
				
				htmlStr += '<ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">';
				htmlStr += '<li>';
				htmlStr += '<a>';
				htmlStr += '<span>';
				htmlStr += '<span>${pageScope.notification.noteNo }</span>';
				htmlStr += '<span class="time">${pageScope.notification.noteDate }</span>';
				htmlStr += '</span>';
				htmlStr += '<span class="message">';
				htmlStr += '${pageScope.notification.message }';
				htmlStr += '</span>';
				htmlStr += '</a>';
				htmlStr += '</li>';
				
								
			},
			
			error: function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
						
		});
	}

	
	function newMsg() {
		$.ajax({
			url: '${pageContext.request.contextPath}/newMsg.do'
			,
			method: 'GET'
			,
			dataType: 'json'
			,
			success: function(data){
				$('#msgNum').empty();
				if(data != 0) {
					$('#msgNum').text(data);
				} 
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
		});	
	}//end of newMsg	
	
	
	function newNote() {
		$.ajax({
			url: '${pageContext.request.contextPath}/newNote.do'
			,
			method: 'GET'
			,
			dataType: 'json'
			,
			success: function(data){
				$('#noteNum').empty();
				if(data != 0) {
					$('#noteNum').text(data);
				} 
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
		});		
	}//end of newNote

</script>

</head>
<body>
 <div class="nav_menu">
            <nav>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/resources/images/img.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;">내 정보</a></li>
                    <li><a href='<c:url value="/login.do"/>'><i class="fa fa-sign-out pull-right"></i>로그 아웃</a></li>
                  </ul>
                </li>
				<!-- 알림 -->
                <li role="presentation" class="dropdown  pull-left">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-bell-o"></i>
                    <span class="badge bg-green" id="noteNum"></span>
                  </a>
                  <c:forEach var="notification" items="${requestScope.notifications }" varStatus="loop" >
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                      
                          <span>${pageScope.notification.noteNo }</span>
                          <span class="time">${pageScope.notification.noteDate }</span>
                        </span> 
                        <span class="message">
                          ${pageScope.notification.message }
                        </span>
                      </a>
                    </li>
                   
                  </ul>
                  </c:forEach>
                </li>
                
                <!-- 쪽지함 -->
                  <li role="presentation" class="dropdown  pull-left">
                 <a href='<c:url value= "/retrieveMessageList.do"/>' class="dropdown-toggle info-number">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green" id="msgNum"></span>
                  </a>
                  </li>
                         
              </ul>
            </nav>
          </div>
</body>
</html>