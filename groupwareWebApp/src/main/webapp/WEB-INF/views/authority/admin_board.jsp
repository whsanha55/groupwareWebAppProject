<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$('#display1').click(function(){
			$('#display').css('display','block');
		});
		
		var checkedValue = $('input:radio[name=food]:checked').val();
		console.log(checkedValue);
		
	});
	
	$(document).keydown(function(e) {
	    key = (e) ? e.keyCode : event.keyCode;
	     
	    var t = document.activeElement;
	     
	    if (key == 8 || key == 116 || key == 17 || key == 82) {
	        if (key == 8) {
	            if (t.tagName != "INPUT") {
	                if (e) {
	                    e.preventDefault();
	                } else {
	                    event.keyCode = 0;
	                    event.returnValue = false;
	                }
	            }
	        } else {
	            if (e) {
	                e.preventDefault();
	            } else {
	                event.keyCode = 0;
	                event.returnValue = false;
	            }
	        }
	    }
	});
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>게시판 관리</h2>

				<div class="clearfix"></div>
			</div>
			<div class="col-md-4">
				<table id="datatable-keytable"
					class="table table-striped jambo_table bulk_action ">
					<thead>
						<tr class="headings">
							<th class="column-title">문서관리 리스트</th>

						</tr>
					</thead>


					<tbody>
						<tr>
							<td>문서 관리</td>

						</tr>
						<tr>
							<td>&nbsp;&nbsp;공용 문서관리</td>

						</tr>
						<tr>
							<td>문서보관함</td>

						</tr>
						<tr>
							<td>기타 문서관리</td>

						</tr>
						<tr>
							<td>&nbsp;&nbsp;경영부</td>

						</tr>

					</tbody>
				</table>
				<div class="text-right">
					<button class="btn btn-primary" id="display1">추가</button>
				</div>
			</div>
			
			<form action="<c:url value="/admin/board.do" />" method="post">
			<div class="col-md-6" id="display" style="display:none">
				<div class="x_panel">

					<table id="datatable-keytable" class="table table-striped col-8">
						<tr>
							<td class="col-md-4 "
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">문서관리
								리스트</td>
							<td>&nbsp;</td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">게시판
								이름</td>
							<td><input type="text" name="boardName"
								id="autocomplete-custom-append" class="form-control col-md-2"></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">사용
								유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isUse" value="Y"> 사용함</label>
									<label> <input type="radio" name="isUse" value="N">사용안함</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">문서관리
								리스트</td>
							<td>문서관리</td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">업로드
								파일 사용 개수</td>
							<td><select class="select2_group form-control" name="fileCount">

									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
							</select></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">공지사항
								사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isNotice" value="Y"> 사용함</label>
									<label> <input type="radio" name="isNotice" value="N">사용안함</label>
									
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">코멘트
								사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isComment" value="Y"> 사용함</label>
									<label> <input type="radio" name="isComment" value="N">사용안함</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">부서
								구분 사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isDeptDivide" value="Y"> 사용함</label>
									<label> <input type="radio" name="isDeptDivide" value="N">사용안함</label>
								</div></td>

						</tr>
						<tr>
							<td class="col-md-4"
								style="background: rgba(52, 73, 94, .94); color: #ecf0f1; font-weight: bold;">문서종류
								카테고리 사용 유무</td>
							<td><div class="radio">
									<label> <input type="radio" name="isDocuType" value="Y"> 사용함</label>
									<label> <input type="radio" name="isDocuType" value="N">사용안함</label>
								</div></td>

						</tr>



					</table>
					<div class="text-right">
						<button class="btn btn-primary" type="submit">등록</button>
					</div>
					
				</div>
			</div>
			</form>
		</div>
	</div>
	
</body>
</html>