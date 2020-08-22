<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<div align="center">
		<h3>현재 비밀번호를 입력하세요.</h3>
		<hr>
		
		<!--  form 태그의 aciton 기능을 통해 해당 페이지로 이동, 방식은 post 방식 -->
		<form action="user_delete_con.jsp" method="post">
		
			<!--  비밀번호 입력 후 확인을 누르면 form의 action을 통해 user_delete_con.jsp 
			페이지로 넘어가 삭제 처리 -->
			비밀번호: <input type="password" name="check_pw">
			<input type="submit" value="확인" class="btn btn-primary">
		</form>
	
	</div>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>























