<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>

<div align="center">

	<h3>로그인 페이지</h3>
	<br>
	
	<!-- form 태그의 action을 통해 user_login_con.jsp로 이동 후 처리 -->
	<form action="user_login_con.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"> <br><br>
		<input type="password" name="pw" placeholder="비밀번호"> <br><br>
		
		<!--  로그인을 누르면 form action 처리  -->
		<input type="submit" value="로그인 " class="btn btn-primary">
		
		<!--  회원가입을 누르면  user_join.jsp 으로 이동하여 처리 -->
		<input type ="button" value="회원가입" class="btn btn-default" onclick="location.href='user_join.jsp'">
	</form>

</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>




























