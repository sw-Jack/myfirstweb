<%@page import="kr.co.lee.user.model.UserDAO"%>
<%@page import="kr.co.lee.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 폼 데이터를 처리
	request.setCharacterEncoding("utf-8");
	
	//폼 데이터 처리 결과를 객체로 포장(UserVO)하여 메서드로 전달
	UserVO vo = new UserVO();	
	vo.setId((String)session.getAttribute("user_id"));
	vo.setName(request.getParameter("name"));
	vo.setEmail(request.getParameter("email"));
	vo.setAddress(request.getParameter("address"));
	
	// DAO 연동을 통해 updateUser라는 메서드 선언 후 호출하여 회원정보를 수정
	if(UserDAO.getInstance().updateUser(vo)) {
		
		//이름정보를 변경했으니 세션도 다시 제작
		session.setAttribute("user_name", request.getParameter("name"));
%>   
	<!-- 경우에 따라 수정 성공 혹은 수정 실패시  location.href를 통해 각 페이지로 이동하여 다시 처리-->
	<script>
		alert("회원 정보가 수정되었습니다.");
		location.href="user_mypage.jsp";
	</script>
	
	<% } else { %>
	
	<script>
		alert("회원 정보 수정에 실패했습니다.");
		location.href="user_mypage.jsp";
	</script>
	<% } %>























