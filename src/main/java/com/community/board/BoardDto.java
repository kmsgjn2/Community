package com.community.board;

import org.springframework.web.multipart.MultipartFile;

public class BoardDto {

	private int board_content_idx;
	private String board_content_title;
	private String board_content;
	private String board_content_file;
	private int board_content_writer_idx;
	private int board_content_info_idx;
	private String board_content_date;
	private String board_content_writer_name;
	// 멀티파트 파일을 저장
	private MultipartFile file;

	public int getBoard_content_idx() {
		return board_content_idx;
	}

	public void setBoard_content_idx(int board_content_idx) {
		this.board_content_idx = board_content_idx;
	}

	public String getBoard_content_title() {
		return board_content_title;
	}

	public void setBoard_content_title(String board_content_title) {
		this.board_content_title = board_content_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_content_writer_idx() {
		return board_content_writer_idx;
	}

	public void setBoard_content_writer_idx(int board_content_writer_idx) {
		this.board_content_writer_idx = board_content_writer_idx;
	}

	public int getBoard_content_info_idx() {
		return board_content_info_idx;
	}

	public void setBoard_content_info_idx(int board_idx) {
		this.board_content_info_idx = board_idx;
	}

	public String getBoard_content_writer_name() {
		return board_content_writer_name;
	}

	public void setBoard_content_writer_name(String board_content_writer_name) {
		this.board_content_writer_name = board_content_writer_name;
	}

	public String getBoard_content_date() {
		return board_content_date;
	}

	public void setBoard_content_date(String board_content_date) {
		this.board_content_date = board_content_date;
	}

	public String getBoard_content_file() {
		return board_content_file;
	}

	public void setBoard_content_file(String board_content_file) {
		this.board_content_file = board_content_file;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
