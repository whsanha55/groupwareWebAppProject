<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 보관함</title>
<style>
</style>
	
	<script src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$('table').find('a').click(function() {				
				var msgNo = $(this).attr("id");
				var url = '${pageContext.request.contextPath}/retrieveMessage.do?msgNo='+msgNo;
				window.open(url,"쪽지상세정보","width=700, height=600");
				
			});
			
			
		 	$('#sendMsg').click(function() {
				
				var url = "${pageContext.request.contextPath}/writeMessage.do";
				window.open(url, "쪽지보내기", "width=700, height=600");
				
			});
			 
		});
	
	</script> 
	
	

</head>
<body>
        
		  <!-- 등록된 관리자 리스트 -->
          <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title" >
                    <h2>받은 쪽지함</h2>
                    <a class="btn btn-primary pull-right" href="/retrieveMessage.do">받은 쪽지함</a>
				   <a class="btn btn-primary pull-right" href="/retrieveMessage.do">보낸 쪽지함</a>
                    <div class="clearfix"></div>
                  </div>
				  <div >
				   <div class="btn-group">
                   
				   </div>
				   <div>
                   <a class="btn btn-primary pull-right" href="/removeMessage.do">선택삭제</a>
				   <a class="btn btn-primary pull-right" id="sendMsg">쪽지보내기</a>
					</div>
					</div>
									  
				  
                  <div class="x_content">
					
                
                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">제목</th>
                            <th class="column-title">발신자</th>
                            <th class="column-title">발신일시</th>

                            
                          </tr>
                        </thead>

                        <tbody>
                        
                        <c:forEach var="message" items="${requestScope.messages }" varStatus="loop">
                           
                          
                          <tr class="even pointer">            
                            <td class="a-center">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>                       
                            <td><a id="${pageScope.message.msgNo }">${pageScope.message.msgTitle }</a></td>
                            <td>${pageScope.message.senderEmployee.empName }</td>
                            <td>${pageScope.message.msgDate }</td>
                               
                          </tr>
                         </c:forEach>
                       
                        </tbody>
                      </table>
					  <div>
					  <div class="text-center">
						<ul class="pagination ">
							<li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
						</ul>
						</div>
					  </div>
                    </div>
							
						
                  </div>
                </div>
              </div>
                </div>
                <!-- end of weather widget -->
              </div>
		<!-- /page content -->
		



</body>
</html>