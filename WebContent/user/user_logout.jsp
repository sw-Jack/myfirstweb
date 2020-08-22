<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	// 로그아웃은 단지 세션을 만료시키면 됨
	session.invalidate();
%>

<script>
	alert("로그아웃 처리되었습니다.");
	// 로그아웃 처리 메세지 출력 후 홈으로 전환
	location.href="/SonFanPage";
</script>




