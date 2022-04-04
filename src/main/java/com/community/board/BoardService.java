package com.community.board;

import java.util.List;


import javax.servlet.http.HttpSession;

import com.community.paging.BoardPagingVo;

public interface BoardService {

	public String boardName(int board_idx);
	
	public int boardCount(int board_idx, String searchType, String searchWord);
	
	public List<BoardDto> boardList(BoardPagingVo vo);
	
	public void boardWrite(BoardDto dto, int board_content_writer_idx);
	
	public BoardDto boardContent(int board_content_idx);
	
	public void boardModify(BoardDto dto);
	
	public void boardDelete(int board_content_idx);
}
