package kr.co.lee.board.service;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.lee.board.model.BoardDAO;
import kr.co.lee.board.model.BoardVO;

public class ContentServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bId = request.getParameter("boardId");
		
		// 조회수 중복 방지를 위한 쿠키를 하나 생성
		Cookie hitCoo = new Cookie("hitNum", bId);
		hitCoo.setMaxAge(15);
		response.addCookie(hitCoo);
		
		//중복 방지용 로직 쿠키 얻기
		Cookie[] cookies = request.getCookies();
		String bNum = "";
		
		for(Cookie c : cookies) {
			if(c.getName().equals("hitNum")) {
				bNum = c.getValue();
			}
		}
		
		//조회수 올려주는 메서드 호출.
		if(!bNum.equals(bId)) {
			BoardDAO.getInstance().upHit(bId);
		}

		BoardVO vo = BoardDAO.getInstance().contentBoard(bId);
		request.setAttribute("content_board", vo);
	}
}
