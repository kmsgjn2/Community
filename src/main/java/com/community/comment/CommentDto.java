package com.community.comment;

public class CommentDto {

	private int board_comment_idx;
	private int board_comment_info_idx;
	private int board_comment_content_idx;
	private int board_comment_writer_idx;
	private String board_comment;
	private String board_comment_date;
	private String board_comment_writer_name;

	public int getBoard_comment_idx() {
		return board_comment_idx;
	}

	public void setBoard_comment_idx(int board_comment_idx) {
		this.board_comment_idx = board_comment_idx;
	}

	public int getBoard_comment_info_idx() {
		return board_comment_info_idx;
	}

	public void setBoard_comment_info_idx(int board_comment_info_idx) {
		this.board_comment_info_idx = board_comment_info_idx;
	}

	public int getBoard_comment_content_idx() {
		return board_comment_content_idx;
	}

	public void setBoard_comment_content_idx(int board_comment_content_idx) {
		this.board_comment_content_idx = board_comment_content_idx;
	}

	public int getBoard_comment_writer_idx() {
		return board_comment_writer_idx;
	}

	public void setBoard_comment_writer_idx(int board_comment_writer_idx) {
		this.board_comment_writer_idx = board_comment_writer_idx;
	}

	public String getBoard_comment() {
		return board_comment;
	}

	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}

	public String getBoard_comment_date() {
		return board_comment_date;
	}

	public void setBoard_comment_date(String board_comment_date) {
		this.board_comment_date = board_comment_date;
	}

	public String getBoard_comment_writer_name() {
		return board_comment_writer_name;
	}

	public void setBoard_comment_writer_name(String board_comment_writer_name) {
		this.board_comment_writer_name = board_comment_writer_name;
	}

}
