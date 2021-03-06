<%--header.jsp --%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>header</title>
<script
	src = "${pageContext.request.contextPath}/resources/vendors/jquery/dist/jquery.min.js">
</script>

<script>

	$(document).ready(function(){	//잠시 끕시다.. 콘솔에 깜빡깜빡
		
		newMsg();
		var msg = setInterval(newMsg, 5000);
		
		//최초이벤트(5개씩)
		$('#alerts').find('a').on('click', newAlarm);
		
		//드롭다운 메뉴 클릭시 사라지지않게 하는 이벤트
		
		$('.dropdown-menu').click(function(e) {
		    e.stopPropagation();
		});
		
		//삭제 이벤트
		$('#menu1').on('click','#deleteAll',deleteAll);
		
		
		//see All alerts 누르면 전체 알림 목록 뜨고 무한 스크롤 되도록 만듬
		$('#menu1').on('click','#after',function() {

			
			$.ajax({
				
				url: '${pageContext.request.contextPath}/selectAllNotificationList.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				success: function(data) {
					
					
					$('#menu1').find('li').remove();
					
					var htmlStr = "";
					
					htmlStr += '<div style="overflow-y:scroll; overflow-x:hidden; width:300px; height:530px;">';
					htmlStr += '<li>';
					htmlStr += '<a  id="deleteAll" style="font-weight: bold;">' + '전체삭제' + '</a>';
					htmlStr += '</li>';
					for(var i=0;i<data.length;i++) {   
						
						
						htmlStr += '<li id="' + data[i].noteNo+ '" class= "direct' + data[i].redirectPath + '">' ;
						htmlStr += '<a>';
						htmlStr += '<span>';
						htmlStr += '<span>'+data[i].noteNo+'</span>';
						htmlStr += '<span class="time">'+data[i].noteDate+'</span>';
						htmlStr += '</span>';
						htmlStr += '<span class="message">';
						htmlStr += data[i].message;
						htmlStr += '</span>';
						htmlStr += '</a>';
						htmlStr += '</li>';
						
						
						  
					}
					
					
					$('#menu1').html(htmlStr);
					htmlStr += '</div>';
					htmlStr = "";
								 
				},
				
				error: function(jqXHR, textStatus, errorThrown){
					alert('error: ' + jqXHR.status);
				}
						
					
			});
			
			//setTimeout(newAlarm, 10000);
		});
		
		//관련 문서함으로 이동하는 이벤트 (해당 컨트롤러에서 읽자마자 삭제도 해야함)
		
		
		
		//알림 전체삭제
		function deleteAll(){
			$.ajax({
				url: '${pageContext.request.contextPath}/removeAllNotifications.do'
				,
				method: 'GET'
				,
				dataType: 'json'
				,
				success: function(data){
					$('#menu1').html("<li>알림이 없습니다.</li>");  
					newMsg();
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert('error: ' + jqXHR.status);
				}
			});	
		}
		
		//처음 조회?
	   function newAlarm() {
		   
		$.ajax({
			
			url: '${pageContext.request.contextPath}/retrieveNotifications.do'
			,
			method : 'GET'
			,
			dataType: 'json'
			,
			success: function(data) {
					
				$('#menu1').find('li').remove();
				
				var htmlStr = "";
				
				
				
				if(data.length>0){
					htmlStr += '<li>';
					htmlStr += '<a id="deleteAll" style="font-weight: bold;">' + '전체삭제' + '</a>';
					htmlStr += '</li>';
					for(var i=0;i<data.length;i++) {
						
						htmlStr += '<li id="' + data[i].noteNo+ '" class= "direct' + data[i].redirectPath + '">' ;
						htmlStr += '<a>';
						htmlStr += '<span>';
						htmlStr += '<span>'+data[i].noteNo+'</span>';
						htmlStr += '<span class="time">'+data[i].noteDate+'</span>';
						htmlStr += '</span>';
						htmlStr += '<span class="message">';
						htmlStr += data[i].message;
						htmlStr += '</span>';
						htmlStr += '</a>';
						htmlStr += '</li>';
						
						
						}
					htmlStr += '<li id="after">';
					htmlStr += '<div class = "text-center">';
					htmlStr += '<a href="#">';
					htmlStr += '<strong>See All Alerts</strong>';
					htmlStr += ' <i class="fa fa-angle-right"></i>';
					htmlStr += '</a>';
					htmlStr += '</div>';
					htmlStr += '</li>';
				}else{
					htmlStr += '<li>알림이 없습니다.</li>';
				}			
				
				
				
				
				
				$('#menu1').html(htmlStr);
				//$(htmlStr).appendTo('#menu1');
			},
			
			error: function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
			
			});
			//end of ajax
			
		
		//setTimeout(newAlarm, 10000);
	}
	   //end of newAlarm
	   
	   	//관련 문서함으로 이동하는 이벤트
		$('#menu1').on('click','li:has(span)',function() {
			
			var noteNo = $(this).attr('id');
			var path = $(this).attr('class');
			
			location.href = '${pageContext.request.contextPath}/moveToRelevantApproval.do?noteNo='+noteNo+'&path='+path;
						
		});
	   
	
	function newMsg() {
		$.ajax({
			url: '${pageContext.request.contextPath}/newMsg.do'
			,
			method: 'GET'
			,
			dataType: 'json'
			,
			success: function(data){
				if(data != 0) $('#msgNum').text(data.msgCount);
				if(data != 0) $('#noteNum').text(data.noteCount); 
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert('error: ' + jqXHR.status);
			}
		});	
	}//end of newMsg	
	
	

	});
</script>

</head>
<body>
 <div class="nav_menu">
            <nav>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="${pageContext.request.contextPath }/resources/upload/employeeFiles/photos/${sessionScope.employee.photoName}" alt="">${sessionScope.employee.empName }
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href='<c:url value="/detailEmployee.do"/>'><i class="fa fa-sign-out pull-right"></i>내 정보</a></li>
                    <li><a href='<c:url value="/logout.do"/>'><i class="fa fa-sign-out pull-right"></i>로그 아웃</a></li>
                  </ul>
                </li>
				<!-- 알림 -->
                <li role="presentation" class="dropdown  pull-left" id="alerts">
                  <a href= "#" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-bell-o"></i>
                    <span class="badge bg-green" id="noteNum"></span>
                  </a>
                  
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                    </li>                   
                  </ul>
                  
                </li>
                
                <!-- 쪽지함 -->
                  <li role="presentation" class="dropdown  pull-left">
                 <a href= '<c:url value= "/retrieveMessageList.do"/>' class="dropdown-toggle info-number">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green" id="msgNum"></span>
                  </a>
                  </li>
                         
              </ul>
            </nav>
          </div>
</body>
</html>