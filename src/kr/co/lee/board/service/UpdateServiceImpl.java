package kr.co.lee.board.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.lee.board.model.BoardDAO;

public class UpdateServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String bId = request.getParameter("bId");
		String title = request.getParameter("bTitle");
		String content = request.getParameter("bContent");
		
		BoardDAO.getInstance().updateBoard(bId, title, content);
	}
}
