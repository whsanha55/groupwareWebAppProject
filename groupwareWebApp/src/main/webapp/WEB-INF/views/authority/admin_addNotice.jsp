<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/admin/addNotice.do" method="post"
 	 	enctype="multipart/form-data">
 		제    목 : <input type="text" name="noticeTitle" size="20"><br>
 		내    용 : <textarea name="noticeContents" rows="5" cols="20"></textarea><br>
 		파    일 : <input type="file" name="upload"><br>
 		파    일 : <input type="file" name="upload"><br>
 		파    일 : <input type="file" name="upload"><br> 		
 		<button type="submit">게시글 쓰기</button>&nbsp;
 		<button type="reset">취소</button>	
  	</form>	
</body>
</html>