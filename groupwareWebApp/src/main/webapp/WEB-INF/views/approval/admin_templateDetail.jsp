<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>양식 상세보기</title>
</head>
<body>


	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>양식 상세보기</h2>
				<div class="clearfix"></div>
			</div>

			<div class="table-responsive" id="datas">
	            <h2><strong>양식 정보</strong></h2>
			    <table class="table table-striped jambo_table bulk_action">
					<tr class="even pointer">
	                	<td class=" " style="background-color:#3f5367; color:#ECF0F1;">양식명</td> 	           
	                    <td class=" ">${requestScope.template.tmpName }</td>       
						<td class=" " style="background-color:#3f5367; color:#ECF0F1;">구분</td>
	                    <td class=" ">${requestScope.template.templateCategory.categoryName }</td>		
					</tr>
					<tr class="even pointer">
						<td class=" " style="background-color:#3f5367; color:#ECF0F1;">등록일</td>
						<td class=" ">${requestScope.template.tmpDate }</td>
	                    <td class=" " style="background-color:#3f5367; color:#ECF0F1;">사용여부</td>
						<td class=" "><c:choose>
										<c:when test="${requestScope.template.tmpUsing == 0 }">
											미사용
										</c:when>
										<c:when test="${requestScope.template.tmpUsing == 1 }">
											사용
										</c:when>
									 </c:choose></td>	
	                </tr>
	            	<tr class="even pointer">
	                	<td class="column-title" style="background-color:#3f5367; color:#ECF0F1;">양식 설명</td>
	                    <td colspan="3">${requestScope.template.tmpSummary }</td>                     
	                </tr>
					<tr>
						<td colspan="4">${requestScope.template.tmpContent }</td>
					</tr>
	             </table>
			</div>

		</div>
	</div>	
	

</body>
</html>