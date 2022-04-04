package com.community.main;

import java.util.List;

import com.community.board.BoardDto;

public interface MainService {

	public List<MainDto> boardNameList();
	
	public List<BoardDto> boardList(int board_idx);
}
