<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>	
	<%--외부 자바 스크립트 파일을 import --%>
	<script src="/SonFanPage/js/member.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>	
	<div align="center">
		<h3>회원가입 페이지</h3>
		<hr>
		<!--  form 태그에 action 기능을 통해 해당 페이지로 이동, post 방식에 이름은 reg_form으로 지정 -->
		<form action="user_join_con.jsp" method="post" name="reg_form">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인 &nbsp;</td>
					<td><input type="password" name="pw_check"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"></td>
				</tr>
			</table>
			<br>
			<%--버튼 타입은 클릭했을 때 자바스크립트를 사용하는 형태로 onclick 속성을 주고 사용 --%>
			<%--onclick 속성안에는 자바스크립트 함수들이 들어가고, location.href='경로' 는 자바
			 스크립트의 페이지 이동기능--%>
			<!--  취소시  /SonFanPage 페이지로 이동, 회원가입 누르면 user_join_con.jsp로 넘어가 
			처리 -->
			<input type="button" value="회원가입" class="btn btn-primary" 
			onclick="joinConfirm()">
			<input type="button" value="취소" class="btn btn-danger" 
			onclick="location.href='/SonFanPage'">
		</form>
	</div>	
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>






