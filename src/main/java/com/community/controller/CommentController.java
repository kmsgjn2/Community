package com.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class CommentController {

	@GetMapping(value = "/comment_write")
	public ModelAndView comment_write() {
		
		ModelAndView mav = new ModelAndView("board/board_content");
		
		return mav;
	}
}
