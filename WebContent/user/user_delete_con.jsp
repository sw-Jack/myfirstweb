<%@page import="kr.co.lee.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
	1. 폼데이터 처리
	2. 로그인 유효성 검사 
	3. deleteUser()메서드 선언해서 실행
	4. 탈퇴에 성공하면 세션을 삭제 후 user_login으로 이동
	5. 탈퇴 실패 시 user_mypage로 이동.
	*/
	
	request.setCharacterEncoding("utf-8");
	
	// 폼 데이터 불러오기, 처리
	String id = (String) session.getAttribute("user_id");
	String pw = request.getParameter("check_pw");
	
	int result = UserDAO.getInstance().userCheck(id, pw);
	
	if(result == 0) { %>
	 
	<!--  해당 if 문 조건에 만족하는 경우 location.href을 통해 각 페이지로 이동 -->
	<script>
		alert("비밀번호가 틀렸습니다.");
		location.href="user_mypage.jsp";
	</script>
	<% } else { 
		// 유효 세션일 경우(로그인 유효성 검사)
		if(UserDAO.getInstance().deleteUser(id)) {
			session.invalidate(); %>
			
			<script>
				alert("회원 탈퇴가 정상 처리되었습니다.");
				location.href="user_login.jsp";
			</script>
			
		<% } else { %>
			<script>
				alert("회원 탈퇴에 실패했습니다.");
				location.href="user_mypage.jsp";
			</script>
		<% }
		}%>
	
		
	
	
    
	
	
	
	
	
	
	
	
	
	
	
	
	


   
    
    
