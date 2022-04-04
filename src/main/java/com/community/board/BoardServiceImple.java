package com.community.board;

import java.io.File;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.community.paging.BoardPagingVo;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired private BoardDao boardDao;
	
	public static final String file_path = "C:/Project/Community/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Community/resources/upload/";
	
	@Override
	public String boardName(int board_idx) {
		return boardDao.boardName(board_idx);
	}
	
	@Override
	public int boardCount(int board_idx, String searchType, String searchWord) {
		BoardPagingVo vo = new BoardPagingVo(board_idx, searchType, searchWord);
		return boardDao.boardCount(vo);
	}
	
	@Override
	public List<BoardDto> boardList(BoardPagingVo vo) {
		return boardDao.boardList(vo);
	}
	
	@Override
	public void boardWrite(BoardDto dto, int board_content_writer_idx) {
		MultipartFile file = dto.getFile();
		
		if (file.getSize() > 0) {
			String file_name = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			try {
				file.transferTo(new File(file_path + file_name));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			dto.setBoard_content_file(file_name);

		}
		
		dto.setBoard_content_writer_idx(board_content_writer_idx);
		
		boardDao.boardWrite(dto);
	}
	
	@Override
	public BoardDto boardContent(int board_content_idx) {
		return boardDao.boardContent(board_content_idx);
	}
	
	@Override
	public void boardModify(BoardDto dto) {
		MultipartFile file = dto.getFile();
		
		if (file.getSize() > 0) {
			String file_name = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			try {
				file.transferTo(new File(file_path + file_name));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			dto.setBoard_content_file(file_name);

		}
		boardDao.boardModify(dto);
	}
	
	@Override
	public void boardDelete(int board_content_idx) {
		boardDao.boardDelete(board_content_idx);
	}
}
