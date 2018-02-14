<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(document).ready(
			function() {
				// ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
				$("#btnReply").click(
					function() {
						var cmtContent = $("#cmtContent").val();
						var empName = '${param.empName}';
						var postNo = "${requestScope.post.postNo }";						
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/insert.do",
							data: {
								postNo : postNo,
								cmtContent : cmtContent,
								empName: empName 
							},
							success : function() {
								alert("댓글이 등록되었습니다.");
								location.reload();
							}
						});
					});

			//댓글 삭제 
			$('#deleteBtn').on('click', function() {	
				var cmtNo = $(this).val();
				swal({
					title: "댓글 삭제" ,
					text: "댓글을 삭제합니다. 계속 진행하시겠습니까?",
					icon: "info",
					buttons : true 
				}).then((e) => {
					if(e) {
						deleteCmt(cmtNo);							
					}
				});		
							
			//alert($(this).val());
			function deleteCmt(cmtNo) {	
				$.ajax({
					url: '${pageContext.request.contextPath}/deleteCmt.do'
					,
					method: 'GET'
					,
					data: {cmtNo}
					, 
					async: true
					,
					cache: false
					,
					success: function(data) {
						swal({
							title: "삭제 완료",
							text: "선택하신 댓글이 삭제되었습니다.",
							icon: "info",
							buttons : "확인" 
						}).then((e) => {
							if(e) {
							location.reload();		
							}
						});		
					}
					, 
					error: function(jqXHR) {
						alert('Error : ' + jqXHR.status);
					}	 			
									
				});	
			}
		});	
			
			
			
			
			
			// 수정
		      $('#datatable').on('click','button:contains(수정)', function () {
		         var cmtContent = $(this).parents("tr").find('.cmtContent').text();
		          $(this).parents("tr").find('.cmtContent').html("<input type='text' name='cmtContent' value="+cmtContent +" />");   
		          $(this).parents("tr").find('.cmtContent').find(':text[name=cmtContent]').val(cmtContent);
		          
		          $(this).parents("tr").find('.selectBtn').html("<td class='align-center'><button type='button' >완료</button><button type='button'>취소</button></td>");
		          $('button:contains(수정)').prop("disabled", true);
		         
		      });
		      
		      //수정 완료
		       $('#datatable').on('click','button:contains(완료)', function () {
		          
		          var cmtNo = $(this).parents("tr").find('.cmtNo').text();      
		          var cmtContent = $(this).parents("tr").find('input[name=cmtContent]').val();	            
		          
		          var name = $(this).parents("tr").find('.cmtContent');
		          var selectBtn = $(this).parents("tr").find('.selectBtn');
		          
		          var a = $(this).parents("tr").find('input[name=rName]');
		          
		         swal({
		              title: "댓글을 수정하시겠습니까?",
		              icon: "info",
		              buttons : true 
		            }).then((e) => {
		               if(e) {
		                  $.ajax({
		                     url : '${pageContext.request.contextPath}/modifyCmt.do?' 
		                        ,
		                        method : 'POST'
		                        ,
		                        data : {
		                           cmtNo : cmtNo,
		                           cmtContent : cmtContent		                           
		                        }
		                        ,
		                        dataType: 'json'
		                        ,
		                        async : true 
		                        ,
		                        cache : true
		                        ,
		                        success : function(data, textStatus, jqXHR){   		                           
		                              swal("수정 완료!","");
		                              $(name).html(data.cmt.cmtContent);		                             
		                              $(selectBtn).html("<button type='button'  class='modifyBtn btn btn-primary'>수정</button>");
		                              	
		                        }
		                        ,
		                        error : function(jqXHR, textStatus, errorThrown){
		                           alert('error: ' + jqXHR.status);
		                        }
		                  
		                     });
		                  location.reload();
		               }
		            });

		      });
		      
		      
		     //수정 취소
		       $('#datatable').on('click','button:contains(취소)', function () { 
		          var cmtContent = $(this).parents("tr").find('input[name=cmtContent]').val();		           
		         
		         $(this).parents("tr").find('.cmtContent').html(cmtContent);		        
		         
		         $(this).parents("tr").find('.selectBtn').html("<button type='button'>수정</button>");
		          $('button:contains(수정)').prop("disabled", false);
		       });  
			
		
						
	
						
});
</script>
</head>
<body>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>${param.boardName}</h2>
				<div class="text-right">					
						<c:url var="modifyUrl" value="/modifyPost.do" scope="page">
							<c:param name="postNo" value="${requestScope.post.postNo }" />
							<c:param name="boardNo" value="${param.boardNo }" />
							<c:param name="boardName" value="${param.boardName }" />
							<c:param name="empName" value="${param.empName }" />
						</c:url>
						<c:url var="removeUrl" value="/removePost.do" scope="page">
							<c:param name="postNo" value="${requestScope.post.postNo }" />
							<c:param name="boardNo" value="${param.boardNo }" />
							<c:param name="boardName" value="${param.boardName }" />
							<c:param name="empName" value="${param.empName }" />						
						</c:url>
					<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
					<c:if test="${requestScope.post.writer == param.empName}">
						<a class="btn btn-primary" href="${modifyUrl}">수정</a> 
						<a class="btn btn-danger" href="${removeUrl}">삭제</a>
					</c:if> 
					<a class="btn btn-primary" href='<c:url value="postList.do?boardNo=${requestScope.post.boardNo } &boardName=${param.boardName} &empName=${param.empName} "/>'>목록</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div>
				<table class="table table-striped jambo_table bulk_action">
					<tr>
						<td width=200 style="word-break: break-all">제목</td>
						<td>${requestScope.post.postTitle}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${requestScope.post.writer}</td>
					</tr>
					<tr>
						<td>문서종류</td>
						<td>${requestScope.post.documentNo}</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td colspan="2"><c:forEach var="file" items="${requestScope.post.postFiles }" varStatus="loop">
								<c:url var="downloadUrl" value="/downloadFile.do">
									<c:param name="originalFileName"
										value="${pageScope.file.originalFileName }" />
									<c:param name="systemFileName"
										value="${pageScope.file.systemFileName }" />
								</c:url>
								<a href="${pageScope.downloadUrl }">${pageScope.file.originalFileName}</a>
								<br>
							</c:forEach></td>
					</tr>
					<tr height="150">
						<td>내용</td>
						<td colspan="2">${requestScope.post.postContent}<br></td>
					</tr>
				</table>
			</div>
			<div class="ln_solid"></div>


			<!--------------------- 댓글 ----------------------->
			<!-- 댓글 조회 -->			
			<c:if test="${fn: length(sessionScope.post.cmts ) > 0 }">
				<table id="datatable" style="margin-left:10px;">
					<c:forEach var="cmt" items="${sessionScope.post.cmts }"
						varStatus="loop">
						<tr>							
							<td style="font-weight:bold;" colspan="3">${pageScope.cmt.cmtWriter }</td>
							<td>(${pageScope.cmt.cmtDate })</td>		
							<td></td>
							<td></td>
							<td></td>													
						</tr>
						<tr >
							<td class='cmtNo' style="display:none;">${pageScope.cmt.cmtNo }</td>
							<td colspan="4" class='cmtContent'>${pageScope.cmt.cmtContent }</td>
							 <!-- 본인이 쓴 댓글만 수정, 삭제가 가능하도록 처리 -->
        					<c:if test="${pageScope.cmt.cmtWriter ==  param.empName}">	
							<td class='selectBtn'>
								<button type='button' class="btn btn-primary pull-right">수정</button>
							</td>						
							<td>
								<button class="btn btn-primary pull-right" type="button"  value="${pageScope.cmt.cmtNo }"  id="deleteBtn"  >삭제</button>								
							</td>
							</c:if>
						</tr>
						
						
					</c:forEach>
				</table>
			</c:if>
			
			

			<%-- <!-- 댓글 입력 -->
			<div style="width: 200px; text-align: center;">
				<br>
				<div style="text-align: left;">${param.empName}</div>				
				<textarea style="width: 300px;"  id="cmtContent"
					placeholder="댓글을 작성해주세요"></textarea>
				<button type="button" id="btnReply">댓글 작성</button>
				
			</div> --%>
			<br><br>
			<div class="form-group">
            <label class="control-label col-md-1 col-md-2 col-xs-1">${param.empName}</label>
            <div class="col-md-6 col-sm-9 col-xs-12">
               <textarea id="cmtContent" class="resizable_textarea form-control"
                  placeholder="댓글을 작성해주세요"></textarea>
            </div>
            <div class="col-md-2">
             <button type="button" id="btnReply" class="btn btn-primary pull-right" >댓글 작성</button>
            </div>
         </div>
			


		</div>
	</div>
</body>
</html>
