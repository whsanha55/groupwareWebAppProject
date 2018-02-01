<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/fancytree/skin-win8/ui.fancytree.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/jquery-ui/jquery-ui.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/fancytree/jquery.fancytree.js"></script>
<style>
#apprTypeDiv {
	margin-top: 10%;
	text-align: center;
}
ul.fancytree-container {
   height: 500px;
   overflow : auto; 
}
</style>
<script>
	$(document).ready(function() {


		 $("#tree").fancytree({
			source : {
				url : '${pageContext.request.contextPath}/receiverDeptListAjax.do' ,
				cache : false ,
				type : 'GET'
			},
			lazyload : function(event,data) {
				var node = data.node;
				data.result = {
					url : '${pageContext.request.contextPath}/receiverEmpListAjax.do' ,
					cache : false ,
					type : 'GET' ,
					data : {
						cNo : node.key
					}
				}
			}
			 
		}); 
		
	});
</script>
</head>

<body>

	<div class="container-fluid">
		<div class="row content">

			<div class="col-sm-3 sidenav">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search Blog..">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
						<button class="btn btn-default" type="button">전체</button>
					</span>
				</div>

				<div id="tree">
					
				</div>

			</div>

			<div class="col-sm-2 " id='apprTypeDiv'>
				<div class="btns">
					<h2>
						<input type="radio" value="0" name="apprType" checked="checked">결재
					</h2>
					<h2>
						<input type="radio" value="1" name="apprType">참조
					</h2>
					<br>
					<div>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target=".bs-example-modal-lg">&lt;</button>

					</div>
					<div>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target=".bs-example-modal-lg">&gt;</button>
					</div>
				</div>

			</div>

			<div class="col-sm-7">

				<div class="btn-group">
					<button class="btn btn-default" type="button">내 결재선</button>


					<button data-toggle="dropdown"
						class="btn btn-default dropdown-toggle" type="button"
						aria-expanded="false">
						선택<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">Dropdown link 1</a></li>
						<li><a href="#">Dropdown link 2</a></li>
						<li><a href="#">Dropdown link 3</a></li>
					</ul>
				</div>

				<div class="table border border-secondary">
					<table class="table table-bordered">

						<tbody>
							<tr>
								<th scope="row" style="text-align: center">결재</th>
								<td style="text-align: center">인사 1팀</td>
								<td style="text-align: center">강호동 부장</td>

								<th style="text-align: center">취소</th>

								<th style="text-align: center">변경</th>


							</tr>
							<tr>
								<th scope="row" style="text-align: center">결재</th>
								<td style="text-align: center">인사 1팀</td>
								<td style="text-align: center">강호동 부장</td>

								<th style="text-align: center">취소</th>

								<th style="text-align: center">변경</th>


							</tr>
							<tr>
								<th scope="row" style="text-align: center">결재</th>
								<td style="text-align: center">인사 1팀</td>
								<td style="text-align: center">강호동 부장</td>

								<th style="text-align: center">취소</th>

								<th style="text-align: center">변경</th>


							</tr>
							<tr>
								<th scope="row" style="text-align: center">결재</th>
								<td style="text-align: center">인사 1팀</td>
								<td style="text-align: center">강호동 부장</td>

								<th style="text-align: center">취소</th>

								<th style="text-align: center">변경</th>


							</tr>
						</tbody>
					</table>

					<table class="table table-bordered">

						<tbody>
							<tr>
								<th scope="row" style="text-align: center">참조</th>
								<td style="text-align: center">인사 1팀</td>
								<td style="text-align: center">강호동 부장</td>

								<th style="text-align: center">취소</th>

								<th style="text-align: center">변경</th>


							</tr>
						</tbody>


					</table>
					<div class="form-group">
						<label>결재선 이름:</label> <input type="text" class="form-control"
							name="receiverName" placeholder="결재선 이름을 입력해주세요">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>

					<br>

				</div>

			</div>
		</div>
	</div>



</body>
</html>