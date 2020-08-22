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
	<h3>게시판 글 작성 페이지</h3>
	<hr>
	
	<!-- 작성완료, 즉 글을 등록하면 regist.board로 넘어가 처리 -->
	<form action="regist.board" method="post">
		<!--  각 칸에 해당 정보를 입력하면 입력 값들이 해당 변수에 저장되어 처리 -->
		<table border="1" width="500">
			<tr>
				<td>&nbsp작성자</td>
				<td>
					<input type="text" name="bWriter" size="10">
				</td>
			</tr>
			
			<tr>
				<td>&nbsp글 제목</td>
				<td>
					<input type="text" name="bTitle" >
				</td>
			</tr>
			
			<tr>
				<td>&nbsp글 내용</td>
				<td>
					<textarea rows="10" style="width: 95%;" name="bContent"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				
					<!-- 작성완료 버튼을 생성하고, 게시판 작성 후 버튼을 누르게 되면 onclick기능을 통해 등록여부확인 후 처리-->
					<input type="submit" value="작성 완료" onclick="return confirm('등록하시겠습니까?')">
					&nbsp;&nbsp;
					
					<!-- 목록 버튼을 누르면 list.board 즉 게시판 목록 페이지로 넘어감 -->
					<a href="list.board"><input type="button" value="목록"></a>         
				</td>
			</tr>
		</table>
	</form>
	<!-- include의  footer를 가져와 첨부 -->
	<jsp:include page="../include/footer.jsp"/>
</div>
</body>
</html>



