<%@page import="kr.co.lee.user.model.UserVO"%>
<%@page import="kr.co.lee.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	// 폼 액션으로 날아온 폼 데이터들 (parameter)을 얻어옴
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");	
	String pw = request.getParameter("pw");	
	String name = request.getParameter("name");	
	String email = request.getParameter("email");	
	String address = request.getParameter("address");	

	
	// DAO객체를 공개된 메서드를 호출하여 주소값을 얻어옴
	UserDAO dao = UserDAO.getInstance();
	
	// 회원가입 승인 전에 이미 DB에 존재하는 아이디인지 검사(DAO에 메서드로 작성)
	if(dao.confirmId(id)) { %>
	
	<script>
		alert("아이디가 중복되었습니다.");
		history.back();
	</script>
	
	<% } else { //이미 가입한 회원이 아닐 경우
	// 가입된 회원이 아닌 경우 객체에 포장 후 회원가입 승인
		UserVO vo = new UserVO(id, pw, name, email, address);

	// 회원 가입 처리 메서드를 호출하여 DB에 데이터 삽입
		if(dao.insertMember(vo)) { %>
		
		<script>
			alert("회원가입을 축하합니다.");
			location.href="user_login.jsp";
		</script>
	<% } else { %>
	
		<script>
			alert("회원가입에 실패했습니다.");
			history.back();
		</script>	
	<% } 
	}%>
	















