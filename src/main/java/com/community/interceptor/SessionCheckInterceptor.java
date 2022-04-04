package com.community.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.community.board.BoardDto;
import com.community.board.BoardService;

public class SessionCheckInterceptor implements HandlerInterceptor {

	@Autowired BoardService boardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		BoardDto dto = boardService.boardContent(Integer.parseInt(request.getParameter("board_content_idx")));
		
		if (session.getAttribute("memberIdx") == null || (int) session.getAttribute("memberIdx") != dto.getBoard_content_writer_idx()) {
			response.sendRedirect(request.getContextPath() + "/msg/error");
			return false;
		}
		
		return true;
	}
}
