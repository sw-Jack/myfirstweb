package kr.co.lee.board.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.lee.board.model.BoardDAO;

public class DeleteServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String bId = request.getParameter("bId");
		BoardDAO.getInstance().deleteBoard(bId);		
	}
}
