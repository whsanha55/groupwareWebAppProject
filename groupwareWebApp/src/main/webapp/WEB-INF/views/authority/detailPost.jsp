<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>게시글</h2>
                    <div class="text-right">
                  <a class="btn btn-primary" href='<c:url value="postList.do"/>'>목록</a>
               </div>
                    <div class="clearfix"></div>
                  </div>
             <div>
                      <table class="table table-striped jambo_table bulk_action">
                        <tr>
                      <td>제목</td>
                      <td>1월 공지사항입니다.</td>
          
                   </tr>
                     <tr>
                      <td>문서종류</td>
                      <td>공지사항</td>
          
                   </tr>
                     <tr>
                      <td>부서구분</td>
                      <td>개발팀</td>
          
                   </tr>
                   <tr>
                      <td>첨부파일</td>
                      <td colspan="2"></td>
                   </tr>
                   <tr height="100">
                      <td>내용</td>       
                      <td colspan="2" >
                     아래와 같이 공고 하오니 협조 부탁드립니다.<br><br>
                     1. 신청기간: 2018-01-01 ~ 2018-01-18<br>
                     2. 대상: 일반 사원<br><br>
                     문의는 인사과(010-1111-2222)로 연락 바랍니다.
                     </td>          
                   </tr>
                      </table>
            </div>
            <div class="ln_solid"></div>
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">홍길동
					</label>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<textarea class="resizable_textarea form-control"
						placeholder="댓글작성"></textarea>
				</div>
			</div>
          </div>
       </div>
</body>
</html>