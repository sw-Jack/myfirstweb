<%@page import="kr.co.lee.user.model.UserVO"%>
<%@page import="kr.co.lee.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 주소를 치고 강제로 들어오려는 접근을 막는 방법.
	if(session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}

	// 세션에 저장된 사용자 아이디와 이름을 불러와 새 변수에 저장
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
	

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	
	<div align="center">
	<h3> My Page </h3>
	<hr>
	<!--  표현식 사용 -->
	<%=name %>(<%=id %>) 님의 정보를 관리합니다.
	<br>
	<br>
	
	<!--  각 링크를 누르면 각 페이지로 이동하여 처리  -->
	<a href="user_change_pw.jsp">비밀번호 변경</a> &nbsp;&nbsp;
	<a href="user_update.jsp">회원정보 변경</a> &nbsp;&nbsp;
	<a href="user_delete.jsp">회원 탈퇴</a>
		
	</div>

	<jsp:include page="../include/footer.jsp"/>
</body>
</html>
















