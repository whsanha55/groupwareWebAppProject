<%--login.jsp --%>
<%@ 
page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<title>login</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
	  $('#idn').focus(); 
      var checkedRole = $('input[name=role]:checked').val();
      
      $('#login').click(function(){
         if($('input:text[name=id]').val() == ""){
            swal("사번을 입력해주세요");
            $('input:text[name=id]').focus;
            return false;
         }
         
         if($('input:password[name=pwd]').val() == ""){
        	 swal("비밀번호를 입력해주세요");
            $('input:text[name=pwd]').focus;
            return false;
         }
         
         if(!($('input:radio[name=role]').is(':checked'))){
        	 swal("옵션을 선택해주세요");
            $('input:radio[name=role]').focus;
            return false;
         }
      });

   }); 
</script> 
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="${pageContext.request.contextPath}/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/resources/css/custom.min.css" rel="stylesheet">

</head>

<body class="login">
   <div>
      <a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
         id="signin"></a>

      <div class="login_wrapper">
         <div class="animate form login_form">
            <section class="login_content">
               <form
                  action="${pageContext.request.contextPath}/j_spring_security_check"
                  method="POST">
                  
                  <img src="${pageContext.request.contextPath }/resources/images/loginLogo.png">
               
                  
                  <div style="margin-top:50px">
                     <h2 class="text-left">사원 번호</h2>
                     <input type="text" name="id" class="form-control" id="idn"
                        placeholder="아이디를 입력해주세요." required="" />
                  </div>
                  <div>
                     <h2 class="text-left">비밀번호</h2>
                     <input type="password" name="pwd" class="form-control"
                        placeholder="비밀번호를 입력해주세요" required="" />
                  </div>
            
                  <c:if test="${not empty param.fail}">
                     <div style="color: red; font-weigt:bold;">아이디 또는 비밀번호가 틀렸습니다.</div>
                     <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION" />
                  </c:if>
                  <c:if test="${not empty param.authFail}">
                     <div style="color: red; font-weigt:bold;">관리자 권한이 없습니다.</div>
                     <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION" />
                  </c:if>
                  
                  <div class="clearfix">
                  <label class="radio-inline"> <input type = "radio" name = "role" value = "user" >사용자</label>
                  <label class="radio-inline"> <input type = "radio" name = "role" value = "admin">관리자</label><br>
                  </div>

                  <div class="separator">
                     <p class="change_link">
                        <%--   <a class="btn btn-default submit" href='<c:url value="/admin/index.do"/>'>로그인</a> --%>

                        <button class="btn btn-default submit" type="submit" id="login">로그인</button>
                        <button class="btn btn-default default" type="reset">취소</button>
                     </p>  

                     <div class="clearfix"></div>
                     <br />


                  </div>
               </form>
            </section>
         </div>

         <!-- <div id="register" class="animate form registration_form">
            <section class="login_content">
               <form>
                  <h1>Create Account</h1>
                  <div>
                     <input type="text" class="form-control" placeholder="Username"
                        required="" />
                  </div>
                  <div>
                     <input type="email" class="form-control" placeholder="Email"
                        required="" />
                  </div>
                  <div>
                     <input type="password" class="form-control"
                        placeholder="Password" required="" />
                  </div>
                  <div>
                     <a class="btn btn-default submit" href="index.html">Submit</a>
                  </div>

                  <div class="clearfix"></div>

                  <div class="separator">
                     <p class="change_link">
                        <a href="#signin" class="to_register">로그인</a>
                     </p>

                     <div class="clearfix"></div>
                     <br />

                     <div>
                        <h1>
                           <i class="fa fa-paw"></i> Gentelella Alela!
                        </h1>
                        <p>©2016 All Rights Reserved. Gentelella Alela! is a
                           Bootstrap 3 template. Privacy and Terms</p>
                     </div>
                  </div>
               </form>
            </section>
         </div> -->
      </div>
   </div>
</body>
</html>