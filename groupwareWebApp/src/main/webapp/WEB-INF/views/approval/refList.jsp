<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>참조 문서함</title>
</head>
<body>
         
		  <!-- 등록된 관리자 리스트 -->
          <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>참조 문서함</h2>
                    
                    <div class="clearfix"></div>
                  </div>
				  <div>
				   <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" aria-expanded="false">제목 <span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu">
                       <li><a href="#">기안자</a>
                      </li>
                      <li><a href="#">기안부서</a>
                      </li>
                       <li><a href="#">양식명</a>
                      </li>
                      <li><a href="#">기간</a>
                      </li>
                    </ul>
					<div class="col-sm-3">
						<div id="imaginary_container"> 
							<div class="input-group stylish-input-group">
							<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon" style="padding:3px 10px">
						<button type="submit">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>  
						</span>
							</div>
						</div>
					</div>
					
                    </div>
				  
				  </div>
                  <div class="x_content">
					
                 

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            
                            <th class="column-title">번호 </th>
                            <th class="column-title">양식명</th>
                            <th class="column-title">문서 제목</th>
                            <th class="column-title">기안자</th>
                            <th class="column-title">기안부서</th>
							<th class="column-title">기안날짜</th>
							<th class="column-title">승인날짜</th>
                            <th class="column-title">현황</th>
                            
                          </tr>
                        </thead>

                        <tbody>
                          <tr class="even pointer">
                            
                            <td>1</td>
							
                             <td class=" ">지출결의서</td>
                            <td class=" ">비품 구매 건</td>
                            <td class=" ">이지희</td>
                            <td class=" ">영업부</td>
							<td class=" ">2018.01.03</td>
							<td class=" ">2018.01.07</td>
                            <td class=" "><a data-toggle="modal" data-target="#myModal">현황</a><a></a></td>
                            
                            
                          </tr>
                         <tr class="even pointer">
                           
							<td>2</td>
                             <td class=" ">지출결의서</td>
                            <td class=" ">비품 구매 건</td>
                            <td class=" ">이지희</td>
                            <td class=" ">영업부</td>
							<td class=" ">2018.01.03</td>
							<td class=" ">2018.01.07</td>
                            <td class=" "><a data-toggle="modal" data-target="#myModal">현황</a><a></a></td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                           
							<td>3</td>
                             <td class=" ">지출결의서</td>
                            <td class=" ">비품 구매 건</td>
                            <td class=" ">이지희</td>
                            <td class=" ">영업부</td>
							<td class=" ">2018.01.03</td>
							<td class=" ">2018.01.07</td>
                            <td class=" "><a data-toggle="modal" data-target="#myModal">현황</a><a></a></td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                            
							<td>4</td>
                             <td class=" ">지출결의서</td>
                            <td class=" ">비품 구매 건</td>
                            <td class=" ">이지희</td>
                            <td class=" ">영업부</td>
							<td class=" ">2018.01.03</td>
							<td class=" ">2018.01.07</td>
                            <td class=" "><a data-toggle="modal" data-target="#myModal">현황</a><a></a></td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                            
							<td>5</td>
                            <td class=" ">지출결의서</td>
                            <td class=" ">비품 구매 건</td>
                            <td class=" ">이지희</td>
                            <td class=" ">영업부</td>
							<td class=" ">2018.01.03</td>
							<td class=" ">2018.01.07</td>
                            <td class=" "><a data-toggle="modal" data-target="#myModal">현황</a><a></a></td>
                            
                            
                          </tr>
						  <tr class="even pointer">
                           
							<td>6</td>
                             <td class=" ">지출결의서</td>
                            <td class=" ">비품 구매 건</td>
                            <td class=" ">이지희</td>
                            <td class=" ">영업부</td>
							<td class=" ">2018.01.03</td>
							<td class=" ">2018.01.07</td>
                            <td class=" "><a data-toggle="modal" data-target="#myModal">현황</a><a></a></td>
                            
                            
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
								<td class=" ">결재</td>
	                            <td class=" ">2018-01-03 10:30</td>
	                            <td class=" ">2018-01-03 13:10</td>
	                            <td class=" ">2018-01-03 14:10</td>
	                            
	                            
	                            
								
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