<%@page import="kr.co.lee.user.model.UserVO"%>
<%@page import="kr.co.lee.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");

	//form 데이터 받아 변수에 저장
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DAO 주소값 얻어오기
	UserDAO dao = UserDAO.getInstance();
	
	// 로그인 유효성 검증 메서드 호출
	int result = dao.userCheck(id, pw);
	
	/*
	 1. 아이디가 없으면 스크립트로 경고창 출력 후 뒤로가기 진행.
	 2. 비밀번호가 틀린 경우 비밀번호가 틀렸다고 경고창 출력 후 뒤로가기
	 3. 로그인 성공인 경우 user_mypage.jsp로 이동
	 4. 모든 회원정보를 DB에서 얻어와서, 세션에 user_name이란 이름으로 name을 저장
	 5. user_id라는 이름으로 id 세션을 저장
	*/
	
	if(result == -1) {
%>   
    <script>
    	alert("아이디가 존재하지 않습니다.");
    	history.back();
    </script>
    <% } else if(result == 0) { %>
    <script>
    	alert("비밀번호가 틀렸습니다.");
    	history.back();
    </script>
    <% } else { 
    
    	// 모든 회원정보를 DB에서 얻어와서, 세션에 user_name이란 이름으로 name을 저장
    	// user_id라는 이름으로 id를 저장
    	UserVO vo = dao.getMemberInfo(id);
    	
    	//vo에서 이름을 얻음
    	String name = vo.getName(); 
    	
    	session.setAttribute("user_name", name);
    	session.setAttribute("user_id", id);
    	
    	// 로그인하면(성공하면) user_mypage.jsp로 바로 이동
    	response.sendRedirect("user_mypage.jsp");
    }%>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    