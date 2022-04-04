package com.community.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDaoImple implements CommentDao {
	
	@Autowired private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CommentDto> commentList(int board_comment_content_idx) {
		return sqlSessionTemplate.selectList("comment.commentList", board_comment_content_idx);
	}
}
