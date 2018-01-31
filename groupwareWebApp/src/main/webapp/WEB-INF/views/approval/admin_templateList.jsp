<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>관리자 양식 관리</title>
	
	
	<script>
		$(document).ready(function(){
			
			//양식 삭제
			$('#delete').on('click', function(evnet){
				event.preventDefault();
				if(!confirm("정말로 삭제하시겠습니까? 삭제를 원하시면 '확인'을 눌러주세요.")){
					return;
				}
						
				var checkData = [];
				$("input[name='tmpNo']:checked").each(function(){
					alert($(this).val());
					checkData.push($(this).val());
				});
				
				var tmpNos = {"tmpNo": checkData.join()};
				
				
				$.ajax({
					url: '${pageContext.request.contextPath}/admin/removeTemplate.do'
					,
					method: 'POST'
					,
					dataType: 'json'
					,
					data: tmpNos
					,
					async: true
					,
					cache: false
					,
					success: function(data, textStatus, jqXHR) {
		  				alert("선택한 양식이 삭제되었습니다.");
		  				a href="${pageContext.request.contextPath}/admin/template.do";	//=새로고침
		  			}
					,
					error: function(jqXHR, textStatus, errorThrown) {
		  				alert('error: ' + jqXHR.status);
		  			}					
				});				
			});	
			
			
			//양식 추가
			$('#add').on('click', function(){
				window.open("/approval/admin_addTemplate.jsp", "_blank", "width=400, height=600" );
			});
			
			
			
		});

	
	
	
	</script>
	
	
	
	</head>
	<body>
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>결재관리</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>양식관리</h2>
									<a class="btn btn-primary pull-right" id="add">양식추가</a>
									 <a class="btn btn-primary pull-right" id="delete">선택삭제</a>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-3 col-sm-3 col-xs-12 profile_left"></div>
									<div class="col-md-12 col-sm-9 col-xs-12">

										<div>
											<div class="col-md-6">
												<div class="col-md-4">
													
												</div>
											</div>
											<div>
												<div class="col-xs-4 col-xs-offset-2">
													<div class="input-group">
														<div class="input-group-btn search-panel">
															<button type="button"
																class="btn btn-default dropdown-toggle"
																data-toggle="dropdown">
																<span id="search_concept">검색</span> <span class="caret"></span>
															</button>
															<ul class="dropdown-menu" role="menu">
																<li><a href="#">양식명</a></li>
																<li><a href="#">카테고리</a></li>
													
															</ul>
														</div>
														<input type="hidden" name="search_param" value="all"
															id="search_param"> <input type="text"
															class="form-control" name="x"
															placeholder="Search term..."> <span
															class="input-group-btn">
															<button class="btn btn-default" type="button">
																<span class="glyphicon glyphicon-search"></span>
															</button>
														</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6"></div>
									</div>
									<table id="datatable"
										class="table table-striped table-bordered">
										<thead>
											<tr>

												<th></th>
												<th>번호</th>
												<th>양식명</th>
												<th>카테고리</th>

											</tr>
										</thead>


										<tbody>
											<c:forEach var="template" items="${requestScope.templates }" varStatus="loop">
												<tr>
													<td><input type="checkbox" id="tmpNo" value="${pageScope.template.tmpNo}"/></td>
													<td>${fn:length(requestScope.templates) - loop.index} </td>
													<td><a data-toggle="modal" data-target="#myModal">${pageScope.template.tmpName }</a></td>
													<td>${pageScope.template.templateCategory.categoryName }</td>
												</tr>
											</c:forEach>										
										</tbody>
									</table>
								</div>
								<nav aria-label="Page navigation" id = 'templatePaging'>
				
								</nav>

							</div>
						</div>
					</div>
				</div>
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
	<!-- 모달 끝 -->

	





	</body>
</html>