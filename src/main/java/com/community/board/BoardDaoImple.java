package com.community.board;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.community.paging.BoardPagingVo;

@Repository
public class BoardDaoImple implements BoardDao {

	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public String boardName(int board_idx) {
		return sqlSessionTemplate.selectOne("board.boardName", board_idx);
	}
	
	@Override
	public int boardCount(BoardPagingVo vo) {
		return sqlSessionTemplate.selectOne("board.boardCount", vo);
	}
	
	@Override
	public List<BoardDto> boardList(BoardPagingVo vo) {
		return sqlSessionTemplate.selectList("board.boardList", vo);
	}
	
	@Override
	public void boardWrite(BoardDto dto) {
		sqlSessionTemplate.insert("board.boardWrite", dto);	
	}
	
	@Override
	public BoardDto boardContent(int board_content_idx) {
		return sqlSessionTemplate.selectOne("board.boardContent", board_content_idx);
	}
	
	@Override
	public void boardModify(BoardDto dto) {
		sqlSessionTemplate.update("board.boardModify", dto);
	}
	
	@Override
	public void boardDelete(int board_content_idx) {
		sqlSessionTemplate.delete("board.boardDelete", board_content_idx);
	}
}
