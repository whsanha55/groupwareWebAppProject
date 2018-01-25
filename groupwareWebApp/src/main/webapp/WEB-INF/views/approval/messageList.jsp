<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메시지 보관함</title>
</head>
<body>
        <!-- page content -->
        <div class="right_col" role="main" >
          <!-- top tiles -->
          
		  <!-- 등록된 관리자 리스트 -->
          <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title" >
                    <h2>받은 쪽지함</h2>
                    <a class="btn btn-primary pull-right" href="approval-message.html">받은 쪽지함</a>
				   <a class="btn btn-primary pull-right" href="approval-message.html">보낸 쪽지함</a>
                    <div class="clearfix"></div>
                  </div>
				  <div >
				   <div class="btn-group">
                   
				   </div>
				   <div>
                   <a class="btn btn-primary pull-right" href="a_index_authority.html">선택삭제</a>
				   <a class="btn btn-primary pull-right" href="a_index_authority.html">쪽지보내기</a>
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
                          <tr class="even pointer">
                            
                           <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
							
                             <td class=" ">안녕하세요</td>
                            <td class=" ">이지희</td>
                            <td class=" ">2018.01.04</td>
                          
							
                            
                            
                          </tr>
                         <tr class="even pointer">
                           
							<td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
							
                              <td class=" ">안녕하세요</td>
                            <td class=" ">이지희</td>
                            <td class=" ">2018.01.04</td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                           
							<td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
							
                             <td class=" ">안녕하세요</td>
                            <td class=" ">이지희</td>
                            <td class=" ">2018.01.04</td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                            
							<td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
							
                              <td class=" ">안녕하세요</td>
                            <td class=" ">이지희</td>
                            <td class=" ">2018.01.04</td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                            
							<td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
							
                              <td class=" ">안녕하세요</td>
                            <td class=" ">이지희</td>
                            <td class=" ">2018.01.04</td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                           
							<td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
							
                             <td class=" ">안녕하세요</td>
                            <td class=" ">이지희</td>
                            <td class=" ">2018.01.04</td>
                            
                            
                          </tr>
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
            </div>
          
        
        <!-- /page content -->
		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width:700px;">
		      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">Modal title</h4>
		      </div>
		      <div class="modal-body">
			<table class="table table-striped jambo_table bulk_action">
	                        <thead>
	                          <tr class="headings">
	                            
	                            <th class="column-title">순번</th>
	                            <th class="column-title">결재자</th>
	                            <th class="column-title">결재유형</th>
								<th class="column-title">배정일시</th>
	                            <th class="column-title">확인일시</th>
	                            <th class="column-title">결재일시</th>      
	                            
	                          </tr>
	                        </thead>
	
	                        <tbody>
	                          <tr class="even pointer">
	                            
	                            <td><a data-toggle="modal" data-target="#myModal">1</a><a></a></td>
								
	                            <td class=" ">이지희 대리 영업부</td>
								<td class=" ">결재</td>
	                            <td class=" ">2018-01-03 10:30</td>
	                            <td class=" ">2018-01-03 13:10</td>
	                            <td class=" ">2018-01-04 18:30</td>
	                            
	                            
								
	                          </tr>
							  <tr class="even pointer">
	                            
	                            <td><a data-toggle="modal" data-target="#myModal">2</a><a></a></td>
								
	                            <td class=" ">이지희 대리 영업부</td>
								<td class=" ">진행중</td>
	                            <td class=" ">2018-01-03 10:30</td>
	                            <td class=" ">2018-01-03 13:10</td>
	                            <td class=" "></td>
	                            
	                            
	                            
								
	                          </tr>
					</tbody>
	                      </table>
		      </div>
		      <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
			
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 모달팝업 끝 -->



</body>
</html>