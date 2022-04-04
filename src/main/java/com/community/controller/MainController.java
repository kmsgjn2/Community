package com.community.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.board.BoardDto;
import com.community.main.MainDto;
import com.community.main.MainService;

@Controller
public class MainController {
	
	@Autowired private MainService mainService;

	@GetMapping("/main")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("main");
	
		ArrayList<List<BoardDto>> list = new ArrayList<List<BoardDto>>();
		
		List<MainDto> board = mainService.boardNameList();
		
		for (int i = 1; i <= board.size(); i++) {
			List<BoardDto> boardList = mainService.boardList(i);
			list.add(boardList);
		}

		mav.addObject("list", list);
		mav.addObject("board", board);

		return mav;
	}
}
