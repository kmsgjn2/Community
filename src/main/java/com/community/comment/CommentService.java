package com.community.comment;

import java.util.List;

public interface CommentService {

	public List<CommentDto> commentList(int board_comment_content_idx);
}
