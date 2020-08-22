package kr.co.lee.board.controller;
import java.util.*;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.lee.board.model.BoardDAO;
import kr.co.lee.board.model.BoardVO;
import kr.co.lee.board.service.ContentServiceImpl;
import kr.co.lee.board.service.DeleteServiceImpl;
import kr.co.lee.board.service.GetListServiceImpl;
import kr.co.lee.board.service.IBoardService;
import kr.co.lee.board.service.ModifyServiceImpl;
import kr.co.lee.board.service.RegisterServiceImpl;
import kr.co.lee.board.service.SearchServiceImpl;
import kr.co.lee.board.service.UpdateServiceImpl;

@WebServlet("*.board") //확장자 패턴
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		IBoardService sv = null;
		
		//리스트 목록 요청
		if(com.equals("/board/list.board")) {
			
			sv = new GetListServiceImpl();
			sv.execute(request, response);
			
			//request객체를 다음 화면까지 운반하기 위한 forward 이동
			RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
			dp.forward(request, response);
		
		//글쓰기 화면 이동 요청
		} else if(com.equals("/board/writer.board")) {
			response.sendRedirect("board_write.jsp");
		
		// 작성글 등록 요청
		} else if(com.equals("/board/regist.board")) {
			
			sv = new RegisterServiceImpl();
			sv.execute(request, response);
			
			response.sendRedirect("list.board");
		
		//상세 글 보기 요청
		} else if(com.equals("/board/content.board")) {
			
			sv = new ContentServiceImpl();
			sv.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_content.jsp");
			dp.forward(request, response);
			
		//게시글 수정 페이지 이동 요청	
		} else if(com.equals("/board/modify.board")) {
			
			sv = new ModifyServiceImpl();
			sv.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_modify.jsp");
			dp.forward(request, response);
			
		// 수정 요청
		} else if(com.equals("/board/update.board")) {
			
			/*
			 1. UpdateServiceImpl() 만들고 execute() 메서드 실행
			 2. 서비스 클래스에는 bId, title, content를 받아서 
			    dao의 updateBoard()메서드 실행
			 3. updateBoard()는 update구문으로 데이터 수정
			 4. 페이지 이동을 목록으로 이동하도록 명령
			 */                      
			sv = new UpdateServiceImpl();
			sv.execute(request, response);
			
			response.sendRedirect("list.board");
		
		// 삭제 요청
		} else if(com.equals("/board/delete.board")) {
			sv = new DeleteServiceImpl();
			sv.execute(request, response);
			
			response.sendRedirect("list.board");
		
		//검색 요청
		} else if(com.equals("/board/search.board")) {			
			sv = new SearchServiceImpl();
			sv.execute(request, response);
			
			RequestDispatcher dp = request.getRequestDispatcher("board_list.jsp");
			dp.forward(request, response);
		}		
	}

}














