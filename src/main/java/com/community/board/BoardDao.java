package com.community.board;

import java.util.List;

import com.community.paging.BoardPagingVo;

public interface BoardDao {

	public String boardName(int board_idx);
	
	public int boardCount(BoardPagingVo vo);
	
	public List<BoardDto> boardList(BoardPagingVo vo);
	
	public void boardWrite(BoardDto dto);
	
	public BoardDto boardContent(int board_content_idx);
	
	public void boardModify(BoardDto dto);
	
	public void boardDelete(int board_content_idx);
}
