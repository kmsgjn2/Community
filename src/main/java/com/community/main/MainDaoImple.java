package com.community.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.board.BoardDto;

@Repository
public class MainDaoImple implements MainDao {
	
	@Autowired private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MainDto> boardNameList() {
		return sqlSessionTemplate.selectList("main.boardNameList");
	}

	@Override
	public List<BoardDto> boardList(int board_idx) {
		return sqlSessionTemplate.selectList("main.boardList", board_idx);
	}
}
