<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div align="center">
	<h3> 비밀번호 변경 페이지</h3>
	<hr>
	
	<!-- form 태그로 확인을 누르면  user_change_pw_con.jsp, 즉 패스워드 바꾸기 처리 페이지로 이동, 
	형식은 기본 get 방식이 아닌 post 방식-->
	<form action="user_change_pw_con.jsp" method="post">
		현재 비밀번호: <input type="password" name="old_pw"> <br>
		변경 비밀번호: <input type="password" name="new_pw"> <br>
		
		<!--  확인 누르면 form 태그의 action 기능의 페이지로 넘어감 -->
		<input type="submit" value="확인" class="btn btn-primary">
		
		<!--  취소 누르면 history.back() 기능을 통해 전 페이지로 돌아감 -->
		<input type="button" value="취소" class="btn btn-default" 
		onclick="history.back()">

	</form>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>














