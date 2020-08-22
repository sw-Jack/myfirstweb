

package kr.co.lee.board.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	DataSource ds;
	
	// 싱글톤 패턴 클래스 생성.
	// 스스로의 객체를 생성.
	private static BoardDAO boardDAO = new BoardDAO();
	
	// 생성자에 private을 붙여서 외부에서 객체 생성을 막음.
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/mariadb");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 외부에서 주소값 요구 시 공개된 메서드를 통해 DAO 주소값을 반환.
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
		
	//모든 게시글 정보를 가지고 오는 메서드.
	public List<BoardVO> listBoard() {
		
		List<BoardVO> articles = new ArrayList<>();
		
		String sql = "SELECT * FROM my_board ORDER BY board_id DESC";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO article = new BoardVO(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getTimestamp("date"),
						rs.getInt("hit"));
				
				articles.add(article);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	//DB에 작성글을 등록하는 메서드
	public void regist(String writer, String title, String content) {
		String sql = "INSERT INTO my_board(writer,title,content)"
					+ " VALUES(?,?,?)";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	//글 상세보기 메서드
	public BoardVO contentBoard(String bId) {
		
		BoardVO vo = null;
		String sql = "SELECT * FROM my_board WHERE board_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, bId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new BoardVO(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getTimestamp("date"),
						rs.getInt("hit"));		
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//조회수를 증가시키는 메서드.
	public void upHit(String bId) {
		
		String sql = "UPDATE my_board SET hit = hit + 1 WHERE board_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, bId);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	//게시글을 수정하는 메서드.
	public void updateBoard(String bId, String title, String content) {
		
		String sql = "UPDATE my_board SET title=?, content=? WHERE board_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, bId);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//게시글 삭제 
	public void deleteBoard(String bId) {
		
		String sql = "DELETE FROM my_board WHERE board_id=?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, bId);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글 검색
	public List<BoardVO> searchList(String search) {
		
		List<BoardVO> articles = new ArrayList<>();
		
		String sql = "SELECT * FROM my_board WHERE title LIKE ?";
		
		try(Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, "%" + search + "%");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO article = new BoardVO(
						rs.getLong("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getTimestamp("date"),
						rs.getInt("hit"));
				
				articles.add(article);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return articles;
	}
}


















