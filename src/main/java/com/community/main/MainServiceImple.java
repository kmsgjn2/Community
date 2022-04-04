package com.community.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.board.BoardDto;

@Service
public class MainServiceImple implements MainService {

	@Autowired private MainDao mainDao;
	
	@Override
	public List<MainDto> boardNameList() {
		return mainDao.boardNameList();
	}

	@Override
	public List<BoardDto> boardList(int board_idx) {
		return mainDao.boardList(board_idx);
	}
}
