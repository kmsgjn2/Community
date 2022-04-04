package com.community.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.community.board.BoardDto;
import com.community.board.BoardService;
import com.community.comment.CommentDto;
import com.community.comment.CommentService;
import com.community.main.MainService;
import com.community.paging.BoardPagingVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired private BoardService boardService;
	@Autowired private MainService mainService;
	@Autowired private CommentService commentService;
	
	@GetMapping(value = "/board")
	public ModelAndView board(@RequestParam int board_idx,
							  @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
							  @RequestParam(value = "pageListCnt", defaultValue = "5") int pageListCnt,
							  @RequestParam(required = false) String searchType,
							  @RequestParam(required = false) String searchWord) {
		ModelAndView mav = new ModelAndView("board/board");
		
		int boardCount = boardService.boardCount(board_idx, searchType, searchWord);
		
		BoardPagingVo vo = new BoardPagingVo(currentPage, boardCount, board_idx, pageListCnt, searchType, searchWord);
		
		mav.addObject("board_idx", board_idx);
		mav.addObject("boardName" , boardService.boardName(board_idx));
		mav.addObject("page", vo);
		mav.addObject("boardList", boardService.boardList(vo));
		
		return mav;
	}
	
	@GetMapping(value = "/board_write")
	public ModelAndView board_write(@RequestParam int board_idx) {
		ModelAndView mav = new ModelAndView("board/board_write");
		
		mav.addObject("board_idx", board_idx);
		mav.addObject("boardNameList", mainService.boardNameList());
		
		return mav;
	}
	
	@PostMapping(value = "/board_write")
	public ModelAndView board_writeAction(BoardDto dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("msg/msg");
				
		boardService.boardWrite(dto, (int) session.getAttribute("memberIdx"));
		
		mav.addObject("msg", "게시글 작성 성공!");
		mav.addObject("url", "/board/board_content?board_idx=" + dto.getBoard_content_info_idx() + "&board_content_idx=" + dto.getBoard_content_idx());
		
		return mav;
	}
	
	@GetMapping(value = "/board_content")
	public ModelAndView board_content(@RequestParam int board_idx,
									  @RequestParam int board_content_idx) {
		ModelAndView mav = new ModelAndView("board/board_content");
		
		mav.addObject("dto", boardService.boardContent(board_content_idx));
		mav.addObject("board_idx", board_idx);
		mav.addObject("boardName", boardService.boardName(board_idx));
		mav.addObject("commentList", commentService.commentList(board_content_idx));
		
		return mav;
	}
	
	@GetMapping(value = "/board_modify")
	public ModelAndView board_modify(@RequestParam int board_idx,
									 @RequestParam int board_content_idx) {
		ModelAndView mav = new ModelAndView("board/board_modify");
		
		mav.addObject("dto", boardService.boardContent(board_content_idx));
		mav.addObject("board_idx", board_idx);
		mav.addObject("boardName", boardService.boardName(board_idx));
		
		return mav;
	}
	
	@PostMapping(value = "/board_modify")
	public ModelAndView board_modifyAction(BoardDto dto) {
		ModelAndView mav = new ModelAndView("msg/msg");
		
		boardService.boardModify(dto);
		
		mav.addObject("msg", "게시글 수정 성공!");
		mav.addObject("url", "/board/board_content?board_idx=" + dto.getBoard_content_info_idx() + "&board_content_idx=" + dto.getBoard_content_idx());
		
		return mav;
	}
	
	@GetMapping(value = "/board_delete")
	public ModelAndView board_delete(@RequestParam int board_idx,
									 @RequestParam int board_content_idx) {
		ModelAndView mav = new ModelAndView("msg/msg");
		
		boardService.boardDelete(board_content_idx);
		
		mav.addObject("msg", "게시글 삭제 성공!");
		mav.addObject("url", "/board/board?board_idx=" + board_idx);
		
		return mav;
	}
}
