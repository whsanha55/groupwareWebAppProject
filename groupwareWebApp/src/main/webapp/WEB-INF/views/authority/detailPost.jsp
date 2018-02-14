<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function() {
			
			listCmt();
				// ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
				$('#btnReply').on('click', function() {
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
							 	
								listCmt();
								
							}
						});
					});
			

			//댓글 삭제 
			$('#datatable').on('click','button:contains(삭제)', function () {
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
							listCmt();
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
		          $(this).parents("tr").find('.cmtContent').html("<input type='text' name='cmtContent'/>");   
		          $(this).parents("tr").find('.cmtContent').find(':text[name=cmtContent]').val(cmtContent);
		          
		          $(this).parents("tr").find('.selectBtn').html("<td class='align-center'><button type='button' class='btn btn-modify btn-xs' >완료</button><button type='button' class='btn btn-modify btn-xs' >취소</button></td>");
		          $('button:contains(수정)').prop("disabled", true);
		         
		      });
		      
		      //수정 완료
		       $('#datatable').on('click','button:contains(완료)', function () {
		          
		          var cmtNo = $(this).parents("tr").find('.cmtNo').text();      
		          var cmtContent = $(this).parents("tr").find('input[name=cmtContent]').val();	            
		          
		          var content = $(this).parents("tr").find('.cmtContent');
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
		                              $(content).html(data.cmt.cmtContent);		                             
		                              $(selectBtn).html("<button type='button' class='btn btn-modify btn-xs' >수정</button><button type='button'  value='"+data.cmt.cmtNo  +"' id='deleteBtn' class='btn btn-modify btn-xs' >삭제</button>");
		                          	  listCmt();	
		                        }
		                        ,
		                        error : function(jqXHR, textStatus, errorThrown){
		                           alert('error: ' + jqXHR.status);
		                        }
		                  
		                     });
		      		
		               }
		            });

		      });
		      
		      
		     //수정 취소
		       $('#datatable').on('click','button:contains(취소)', function () { 
		          var cmtContent = $(this).parents("tr").find('input[name=cmtContent]').val();		           
		          var cmtNo = $(this).parents("tr").find('.cmtNo').text();     
		         $(this).parents("tr").find('.cmtContent').html(cmtContent);		        
		         
		         $(this).parents("tr").find('.selectBtn').html("<button type='button' class='btn btn-modify btn-xs' >수정</button><button type='button'  value='"+cmtNo  +"' id='deleteBtn' class='btn btn-modify btn-xs' >삭제</button>");
		          $('button:contains(수정)').prop("disabled", false);
		       });  
			
		   });
	
	function listCmt() {
		var postNo = "${requestScope.post.postNo }";				
		var empName = '${param.empName}';
		$.ajax({
			url: '${pageContext.request.contextPath}/listCmt.do' 
			,
			data: {
				postNo : postNo
			},
			type: 'POST' ,
			cache: false ,
			dataType: 'json' ,
			success: function (data, textStatus, jqXHR) {
				var text = "";  
				 for(var i=0;i<data.posts.length;i++) {
						text += "<tr style='border-top: 1px  solid darkgray;'><td style='width:50px;'>"+data.posts[i].cmtWriter+"</td>";
						text += "<td style='width:200px;'>("+data.posts[i].cmtDate+ ")</td>";
						text += "<td></td>";
				
						text += "<tr><td class='cmtNo' style='display:none;'>"+ data.posts[i].cmtNo + "</td>";
						text += "<td colspan='2' class='cmtContent'>"+ data.posts[i].cmtContent + "</td>";
						if(data.posts[i].cmtWriter == empName) {
							text += "<td class='selectBtn'><button type='button' class='btn btn-modify btn-xs' >수정</button>";
							text +="<button type='button'  value='"+data.posts[i].cmtNo  +"' id='deleteBtn' class='btn btn-modify btn-xs' >삭제</button></td></tr>";
							}        
					
						text += "</tr>";
					} 
					$('#datatable').find('tbody').html(text);
				
			} ,
			error: function(jqXHR) {
				alert("에러: " + jqXHR.status);
			}
			
		});
		

	}
</script>
<style>
.btn-modify{
    background-color: white;
    border-color: white;
    color: #2196F3; }
.btn-modify:hover,
.btn-modify:focus {
    border-color: white;
    background-color: white;
    color: balck; }
.btn-modify:active,
.btn-modify:visited,
.btn-modify:active:focus,
.btn-modify:active:hover {
    border-color: white;
    background-color: white;
    color: balck; }

</style>
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

				<table id="datatable"  style="width:100%">
				  <tbody style='border-bottom: 1px  solid darkgray;'>
                  </tbody >

				</table>

			

			<br><br>
			<div class="form-group">
            <label class="control-label col-md-1 col-md-2 col-xs-1">${param.empName}</label>
            <div class="col-md-6 col-sm-9 col-xs-12">
               <textarea id="cmtContent" class="resizable_textarea form-control"
                  placeholder="댓글을 작성해주세요"></textarea>
            </div>
            <div class="col-md-2" >
             <button type="button" id="btnReply" class="btn btn-primary btn-sm" >댓글 작성</button>   
            </div>
         </div>

		</div>
	</div>
</body>
</html>
