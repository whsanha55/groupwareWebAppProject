<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	.btn {
		width: 120px !important
	}
	
	.col-md-4 {
		width: 20% !important
	}
	
	.col-md-6 {
		width: 80% !important
	}
</style>
<script>
	$(document).ready(function() {
		
		$('.category').on('click',function() {
			alert($(this).attr('id'));
			var categoryNo = $(this).attr('id').split('_')[1];
			
			$.ajax({
				url : '${pageContext.request.contextPath}/templateCategoryAjax.do' ,
				data : {
					categoryNo : categoryNo,
					startRow : 0,
					endRow : 10
				} ,
				type : 'POST' ,
				cache : false ,
				dataType : 'json' ,
				success : function(data) {
					var text = "";
					for(var i=0;i<data.length;i++) {
						if(data[i].templateBookmarks.length == 0) {
							text += "<tr> <td> <i class='fa fa-star-o fa-lg' aria-hidden='true' cursor = 'pointer'/> </td>";
						} else {
							text += "<tr> <td> <i class='fa fa-star fa-lg' aria-hidden='true' cursor = 'pointer'/> </td>";
							
						}
						text += "<td>"+ data[i].tmpNo + "</td>";
						text += "<td>"+ data[i].templateCategory.categoryName + "</td>";
						text += "<td>"+ data[i].tmpDate + "</td>";
						text += "<td>"+ data[i].tmpName + "</td>";
						text += "<td>"+ data[i].tmpSummary + "</td>";
						text += "</tr>";
					}
						$('#datatable').find('tbody').html(text);
					
				} ,
				error : function(jqXHR) {
					alert(jqXHR.status);
					console.log(jqXHR);
				}
			});
		});
		
		
		
		
	});
</script>
</head>
<body>

	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>문서작성</h2>
				<div class="clearfix" width="1200px"></div>
			</div>

			<!-- 양식서 카테고리 -->
			<div class="col-md-4" width="20%">

				<table id="datatable-keytable"
					class="table table-striped jambo_table bulk_action ">
					<thead>
						<tr class="headings" />
					</thead>
				</table>

				<div class="text-center" width="80px" align="center">
					<button id ='category_-1' class="btn btn-primary category">양식서 즐겨찾기</button>
				</div>	
				<!-- 
			<div class="text-center" width="80px" align="center">
				<button class="btn btn-primary">기안서</button>
			</div>
			 -->
				<c:forEach items="${requestScope.categoryList}" var="category">
					<div class="text-center" width="80px" align="center">
						<button id="category_${pageScope.category.categoryNo}"
							class="btn btn-primary category">
							${pageScope.category.categoryName}</button>
					</div>
				</c:forEach>
				<div class="text-center" width="80px" align="center">
					<button class="btn btn-primary">직접 작성</button>
				</div>
			</div>

			<!-- 양식서 -->
			<div class="col-md-6" width="900px">
				<div class="x_panel">

					총 ?개의 즐겨찾기
					<table id="datatable-keytable" class="table table-striped col-8">
						<tbody>
							<tr />
						</tbody>
					</table>

					<table id="datatable" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th></th>
								<th>서류번호</th>
								<th>카테고리</th>
								<th>등록일자</th>
								<th>양식서명</th>
								<th>양식서 설명</th>
							</tr>
						</thead>
						<tbody>
							<%-- 
							<tr>
								<td>즐겨찾기아이콘입니다</td>
								<td>서류번호</td>
								<td>카테고리구분</td>
								<td>등록일자</td>
								<td>양식서명(정기휴가서)</td>
								<td>양식서설명(정기휴가서입니다!!)</td>
							</tr>

							--%>

							<c:forEach var="template" items="${requestScope.templateList}">
								<tr>
									<td>
										<i class="fa fa-star fa-lg" aria-hidden="true" cursor = 'pointer'/>
									</td>
									<%-- <td><i class="fa fa-star-o" aria-hidden="true"></i></td>--%>
									<td>${pageScope.template.tmpNo }</td>
									<td>${pageScope.template.templateCategory.categoryName }</td>
									<td>${pageScope.template.tmpDate }</td>
									<td>${pageScope.template.tmpName }</td>
									<td>${pageScope.template.tmpSummary }</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>


	<!-- /page content -->



</body>
</html>