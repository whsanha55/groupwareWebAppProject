<%--content.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
   var pKeyfield='role';
   var pKeyword;
   $(document).ready(function() {
      
      Paging(1); 
      
      //   검색조건
      $('.search-panel .dropdown-menu').on('click','a',function(e) {
            e.preventDefault();
            $('.keyfield').text($(this).text());
            $('.keyfield').attr('id',$(this).attr('id'));
            
      });
      
      
      //검색조건 엔터키 눌렀을때 트리거 발동
      $('.keyword').on('keydown', function(e) {
         if(e.keyCode == 13){
            $('.find').trigger('click');
           }
      });
      
      
      // 검색 실행
      $('.find').on('click', function() {
         if($('.keyfield').attr('id') == null) {
            swal("검색조건를 선택해주세요","", "error");
            return;
         }

         pKeyfield = $('.keyfield').attr('id');
         pKeyword = $('.keyword').val();
         
         Paging(1);
         
      });
      
      // 수정
      $('#datatable').on('click','button:contains(수정)', function () {
         var rName = $(this).parents("tr").find('.rName').text();      
         var rType = $(this).parents("tr").find('.rType').text();
         var rExplan = $(this).parents("tr").find('.rExplan').text();
      
          $(this).parents("tr").find('.rName').html("<input type='text' name='rName' value="+rName +" />");   
          if(rType =='url') {
             $(this).parents("tr").find('.rType').html("<select id='selBox'><option name='rType' value='url' selected='selected'>url</option><option value='method'>method</option></select>");   
          }else {
              $(this).parents("tr").find('.rType').html("<select id='selBox'><option name='rType' value='url' >url</option><option value='method' selected='selected'>method</option></select>");   
          }
          $(this).parents("tr").find('.rExplan').html("<input type='text' name='rExplan' value="+rExplan +" />");   
          
          $(this).parents("tr").find('.selectBtn').html("<td class='align-center'><button type='button' class='btn btn-primary'>완료</button><button type='button' class='btn btn-default'>취소</button></td>");
          $('button:contains(수정)').prop("disabled", true);
         
      });
      
      //수정 완료
       $('#datatable').on('click','button:contains(완료)', function () {
          
          var rId = $(this).parents("tr").find('.rId').text();      
          var rName = $(this).parents("tr").find('input[name=rName]').val();
          var target = document.getElementById("selBox");
          var rType = target.options[target.selectedIndex].text;
          var rExplan = $(this).parents("tr").find('input[name=rExplan]').val();      
          
          var name = $(this).parents("tr").find('.rName');
          var type = $(this).parents("tr").find('.rType');
          var explan = $(this).parents("tr").find('.rExplan');
          var selectBtn = $(this).parents("tr").find('.selectBtn');
          
          var a = $(this).parents("tr").find('input[name=rName]');
          
         swal({
              title: "역할을 수정하시겠습니까?",
              icon: "info",
              buttons : true 
            }).then((e) => {
               if(e) {
                  $.ajax({
                     url : '${pageContext.request.contextPath}/modifyRoleAjax.do?' 
                        ,
                        method : 'POST'
                        ,
                        data : {
                           rId : rId,
                           rName : rName,
                           rType : rType,
                           rExplan : rExplan
                        }
                        ,
                        dataType: 'json'
                        ,
                        async : true 
                        ,
                        cache : true
                        ,
                        success : function(data, textStatus, jqXHR){   
                           if(data.isSuccess == "true"){
                              swal("수정 완료!","");
                              $(name).html(data.role.rName);
                              $(type).html(data.role.rType);
                              $(explan).html(data.role.rExplan);
                              $(selectBtn).html("<button type='button'  class='modifyBtn btn btn-primary'>수정</button>");
                              Paging(1);   
                           }else if(data.isSuccess == "false"){
                              swal("이미 역할이 존재합니다.");
                           } 
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
          var rName = $(this).parents("tr").find('input[name=rName]').val();
          var target = document.getElementById("selBox");
          var rType = target.options[target.selectedIndex].text;
          var rExplan = $(this).parents("tr").find('input[name=rExplan]').val();      
         
         $(this).parents("tr").find('.rName').html(rName);
         $(this).parents("tr").find('.rType').html(rType);
         $(this).parents("tr").find('.rExplan').html(rExplan);
         
         $(this).parents("tr").find('.selectBtn').html("<button type='button'  class='modifyBtn btn btn-primary'>수정</button>");
          $('button:contains(수정)').prop("disabled", false);
       });  
      
      //삭제 
      $('#deleteBtn').on('click', function() {         
         var arr =[];
         if($("input[name=selected]").is(':checked') == false) {
            swal("삭제할 항목을 체크해주세요.", "선택된 항목이 없습니다.");
         } else {
            $(':checkbox[name=selected]').each(function() {
               if($(this).is(':checked')) {
                  arr.push($(this).val());
                  console.log(arr.join());
               }
            });
            swal({
                 title: "역할 삭제",
                 text: "역할을 삭제합니다. 계속 진행하시겠습니까?",
                 icon: "info",
                 buttons : true 
            }).then((e) => {
                 if(e) {
                  $.ajax({
                     url: '${pageContext.request.contextPath}/admin/deleteRole.do'  
                     ,
                     method: 'GET'
                     ,
                     data: { rId : arr.join()}
                     , 
                     success: function(data) {
                    	if(data.isSuccess == "true"){
	                        swal("삭제 완료", "선택하신 항목이 삭제되었습니다.", "success");
	                         Paging(1); 
                    	}else if(data.isSuccess == "false"){
							swal("삭제 불가", "권한이 부여되어있어 삭제가 불가능합니다.", "error");
						} 
                     }
                     , 
                     error: function(jqXHR) {
                        alert('Error : ' + jqXHR.status);
                     }    
                  });   
                              
                }
            });      
            
         }
      });   
      
   });
   
   function Paging(currentPageNo) {
      var totalCount =  0;      //총 양식서 수
      var countPerPage = 10;   //한 페이지당 보여주는 양식서 수
      var pageSize = 5;      //페이지 리스트에 게시되는 페이지 수
      var startRow = (currentPageNo - 1) * countPerPage + 1;
      var endRow = currentPageNo * countPerPage;
      var num = 0;   //현재 페이지번호에 속한 게시글의 시작번호
      
      
      $.ajax({
         url: '${pageContext.request.contextPath}/admin/RolePagingAjax.do' 
         ,
         data: {
            keyfield: pKeyfield ,
            keyword: pKeyword ,   
            startRow : startRow ,
            endRow : endRow
         },
         type: 'POST' ,
         cache: false ,
         dataType: 'json' ,
         success: function (data, textStatus, jqXHR) {
            
            totalCount = data.totalCount;
            num = totalCount - (currentPageNo - 1) * countPerPage;
            
            //datatable테이블 변경하기
            var text = "";
            for(var i=0;i<data.roles.length;i++) {
               text += "<tr class='even pointer'><td class='a-center '><input type='checkbox' name='selected' id='ex_chk' value="+data.roles[i].rId+"></td>";
               text += "<td class='rId'>"+ data.roles[i].rId + "</td>";
               text += "<td class='rName'>"+ data.roles[i].rName + "</td>";
               text += "<td class='rType'>"+ data.roles[i].rType + "</td>";
               text += "<td class='rExplan'>"+ data.roles[i].rExplan + "</td>";
               text += "<td>"+ data.roles[i].rDate + "</td>"; 
               text += "<td class='selectBtn'><button type='button'  class='modifyBtn btn btn-primary'>수정</button></td>";
               text += "</tr>";
            }
               $('#datatable').find('tbody').html(text);
            
               //페이징 처리
               jqueryPager({
                  countPerPage : countPerPage,
                  pageSize : pageSize,
                  currentPageNo : currentPageNo,
                  totalCount : totalCount
               });
               
            
         } ,
         error: function(jqXHR) {
            alert("에러: " + jqXHR.status);
         }
         
      });
      

   } //end Paging function
   
   
   //페이징 처리
   function jqueryPager(subOption) {
   
      var pageBlock = subOption.countPerPage;   
      var pageSize = subOption.pageSize;        
      var currentPage = subOption.currentPageNo;  
      var pageTotal = subOption.totalCount;       
       var pageTotalCnt = Math.ceil(pageTotal/pageBlock);    
      var pageBlockCnt = Math.ceil(currentPage/pageSize);
      var sPage = (pageBlockCnt-1) * pageSize + 1;
      var ePage;
      
      
      var html ="<ul class='pagination'>";
   
      
       if((pageBlockCnt * pageSize) >= pageTotalCnt) {
         ePage = pageTotalCnt;
      } else {
         ePage = pageBlockCnt * pageSize;
      } 
      
      if(sPage <= 1) {
         html += '<li class="page-item disabled">';
         html += '<a class="page-link" aria-label="Previous">' 
      } else {
         html += '<li class="page-item ">';
         html += '<a class="page-link" aria-label="Previous" onclick = "Paging(' + (sPage - pageSize) + ')">'; 
      }
      html += '<span aria-hidden="true">&laquo;</span> </a> </li>';
      
      for(var i=sPage; i<=ePage; i++) {
         if(currentPage == i) {
            html += '<li class="page-item active"><a class="page-link" ">' + i + '</a></li>';
         } else {
            html += '<li class="page-item"><a class="page-link" onclick="Paging(' + i + ');">' + i + '</a></li>';
         }
      }            
   
      if (ePage >= pageTotalCnt) {
         html += '<li class="page-item disabled">';
         html += '<a class="page-link" aria-label="Next">';
      } else {
         html += '<li class="page-item">';
         html += '<a class="page-link" aria-label="Next" onclick = "Paging(' + (ePage+1) + ')">';
      }
      html += '<span aria-hidden="true">&raquo;</span> </a></li>';
      html += '</ul>';
      
      $('#Paging').html(html);
   
   }
   
</script>
<title>content</title>
</head>
<body>
   <!-- 역할 리스트 -->
   <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>역할 리스트</h2>
                    
                    <div class="clearfix"></div>
                  </div>
     
         <div class="container">
             <div class="row">    
                 <div class="col-xs-6 col-xs-offset-6">
                   <div class="input-group">
                         <div class="input-group-btn search-panel">
                             <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="keyfield">검색조건</span> <span class="caret"></span>
                             </button>
                             <ul class="dropdown-menu" role="menu">
                               <li><a id='rName'>롤명</a></li>
                                <li><a id='rExplan'>롤 설명</a></li>
                             </ul>
                         </div>
                         <input type="text" class="form-control keyword" placeholder="검색어를 입력하세요">
                         <span class="input-group-btn">
                             <button class="btn btn-default find" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                             </button>
                         </span>
                     </div>
                 </div>
            </div>
         </div>
                   
                  <div class="x_content">
                    <div class="table-responsive">
                      <table id="datatable"  class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="ex_chk"> 
                            </th>
                            <th class="column-title">롤 ID </th>
                            <th class="column-title">롤 명 </th>
                            <th class="column-title">롤 타입</th>
                            <th class="column-title">롤 설명</th>
                            <th class="column-title">등록일자</th>
                            <th class="column-title">수정</th>
                            
                          </tr>
                        </thead>

                        <tbody>
                        
                        </tbody>
                      </table>
                    </div>
               <div>
                 <div class="text-center">
                  <nav aria-label="Page navigation" id = 'Paging'></nav> 
                </div>
                 <a class="btn btn-primary pull-right" href='<c:url value="/admin/role.do"/>'>등록</a>   
                  <button type="button"  id="deleteBtn" class="btn btn-danger pull-right">삭제</button>
               </div>
                  
                  </div>
                </div>
              </div>
</body>
</html>