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
                    <h2>공지사항</h2>
                    <div class="text-right">
                  <a class="btn btn-primary" href='<c:url value="/admin/addNotice.do"/>'>등록</a>
               </div>
                    <div class="clearfix"></div>
                  </div>

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                             <th>
                              <input type="checkbox" id="ex_chk"> 
                            </th>
                            <th class="column-title">NO </th>
                            <th class="column-title">제목 </th>
                            <th class="column-title">조회수</th>
                            <th class="column-title">등록일</th>
                            
                          </tr>
                        </thead>

                        <tbody>
                        <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" id="ex_chk"> 
                            </td>
                            <td class=" ">1</td>
                            <td class=" "><a href='<c:url value="/admin/detailNotice.do"/>'>사이트 이전 안내입니다.</a></td>
                            <td class=" ">31</td>
                            <td class=" ">2017.12.31</td>
                            
                            </td>
                          </tr>
                         <tr class="even pointer">
                             <td class="a-center ">
                              <input type="checkbox" id="ex_chk"> 
                            </td>
                            <td class=" ">2</td>
                            <td class=" ">공지입니다.</td>
                            <td class=" ">8</td>
                            <td class=" ">2017.12.11</td>
                            
                            </td>
                          </tr>
                    <tr class="even pointer">
                        <td class="a-center ">
                              <input type="checkbox" id="ex_chk"> 
                            </td>
                            <td class=" ">3</td>
                            <td class=" ">공지입니다.</td>
                            <td class=" ">150</td>
                            <td class=" ">2017.12.01</td>
                            
                            </td>
                          </tr>
                        </tbody>
                      </table>
                      <button class="btn btn-primary pull-right">삭제</button>
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
</body>
</html>