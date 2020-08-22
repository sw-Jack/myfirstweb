

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- include의  header를 가져와 첨부 -->
<jsp:include page="../include/header.jsp"/>

<div align="center" class="div_center">
	<h3>게시판 글 수정 페이지</h3>
	<hr>
	<!-- form 태그로 update.board로 폼 데이터 처리 이동 -->
	<form action="update.board" method="post">		
		<!-- input태그의 hidden속성은 화면에서 보여줄 필요가 없는 값을 처리할 때 숨겨서 넣어놓는 방법 -->
		<input type="hidden" name="bId" value="${modify_board.boardId }">
		
		<!-- 글 수정 테이블을 나열하는데, db에 저장되어 있는 각 정보를 일단 불러옴 -->
		<table border="1" width="500">
			<tr>
				<td>&nbsp글 번호</td>
				<td>&nbsp ${modify_board.boardId }</td>
			</tr>
			
			<tr>
				<td>&nbsp작성자</td>
				<td>&nbsp ${modify_board.writer }</td>
			</tr>
			
			<tr> 
				<td>&nbsp글 제목</td>
				<td>
					<input type="text" name="bTitle" value="&nbsp ${modify_board.title }">
				</td>
			</tr>
			
			<tr>
				<td>&nbsp글 내용</td>
				<td>
					<textarea rows="10" style="width: 95%;" name="bContent">${modify_board.content }
					</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				
					<!--  수정하기를 누르면 onclick 기능으로 수정여부를 확인하고 처리 -->
					<!--  처리과정에서는 IBoardServiceImpl 인터페이스의 execute 메서드를 통해 해당 클래스로 넘어가 새 정보 저장-->
					<input type="submit" value="수정 하기" onclick="return confirm('수정하시겠습니까?')">&nbsp;&nbsp;
					<a href="list.board"><input type="button" value="목록"></a>         
				</td>
			</tr>			
		</table>
	</form>
	
</div>
<!-- include의  footer를 가져와 첨부 -->
<jsp:include page="../include/header.jsp"/>
</body>
</html>

