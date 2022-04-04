package com.community.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImple implements CommentService {

	@Autowired private CommentDao commentDao;
	
	@Override
	public List<CommentDto> commentList(int board_comment_content_idx) {
		return commentDao.commentList(board_comment_content_idx);
	}
}
