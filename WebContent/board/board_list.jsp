

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<!-- include의  header를 가져와 첨부 -->
	<jsp:include page="../include/header.jsp"/>

	<div class="container">
		<!-- 게시판 제목 -->
		<h3>자유 게시판</h3>
		
		<!-- 게시판 테이블 생성 -->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<!-- IBoardService 인터페이스를 통해 GetListServiceImpl의 execute 메서드 실행을 통해 db의 리스트 가져옴 -->
			<c:forEach var="article" items="${boardList}">
			<tbody>
				<tr>
				<!--  각 행에 db로부터 글 번호, 작성자, 제목, 날짜, 조회수 불러와서 테이블에 리스트 나열, VO클래스에서 처리 -->
					<td>${article.boardId}</td>
					<td>${article.writer }</td>
					<!--  제목을 링크로 걸어 제목을 클릭하면 해당 제목의 db에 저장된 번호를 불러와 그에 해당하는 정보 출력, 즉 게시판 내용보기(content)-->
					<td><a href="content.board?boardId=${article.boardId}">${article.title }</a></td>
					<td>
						<!-- 글 등록시 현재 시간을 자동으로 불러와 시간 표시 -->
						<fmt:formatDate value="${article.date }" pattern="yyyy년 MM월 dd일 E요일   hh시 mm분 ss초"/>
					</td>
					<td>${article.hit }</td>
				</tr>
			</tbody>
			
			</c:forEach>			
			<tbody>
				<tr>
					<!-- 행을 모두 병합하여 각 기능을 가진 각각의 input 태그 생성 -->
					<td colspan="5" align="right">
						<form action="search.board" class="form-inline" >
						  <div class="form-group">
						    <input type="button" value="전체 목록" class="btn btn-default" onclick="location.href='list.board'">
						    <input type="text" name="search" placeholder="제목검색" class="form-control" >
						  	<input type="submit" value="검색" class="btn btn-default">
							<input type="button" value="글 작성" class="btn btn-default" onclick="location.href='writer.board'">
						  </div>
						</form> 
					</td>
				</tr>
			</tbody>
		
		</table>
	</div>	
	<!-- include의  footer를 가져와 첨부 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>







