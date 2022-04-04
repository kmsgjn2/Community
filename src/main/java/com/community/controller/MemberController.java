package com.community.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.member.MemberDto;
import com.community.member.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memService;
	@Autowired private BCryptPasswordEncoder pwdEncoder;

	@GetMapping(value = "/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping(value = "/login")
	public ModelAndView loginAction(MemberDto dto, HttpSession session, 
									@RequestParam(value = "saveId", defaultValue = "off") String saveId, 
									HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("msg/msg");
		
		MemberDto loginDto = memService.loginAction(dto);
		boolean pwdMatch = pwdEncoder.matches(dto.getMember_pw(), loginDto.getMember_pw());

		 if (loginDto != null && pwdMatch == true) {
			session.setAttribute("memberIdx", loginDto.getMember_idx());
			session.setAttribute("memberId", loginDto.getMember_id());
			session.setAttribute("memberName", loginDto.getMember_name());		
			if (saveId.equals("off")) {
				Cookie cookie = new Cookie("saveId", null);
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);		
			} else {
				Cookie cookie = new Cookie("saveId", loginDto.getMember_id());
				
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);				
			}
			 mav.addObject("msg", "로그인 성공!");
			 mav.addObject("url", "/main");
		 } else {
			 mav.addObject("msg", "로그인 실패!");
			 mav.addObject("url", "/member/login");
		 }
		
		return mav;
	}
	
	@GetMapping(value = "/join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping(value = "/join")
	public ModelAndView joinAction(MemberDto dto) {
		ModelAndView mav = new ModelAndView("msg/msg");

		dto.setMember_pw(pwdEncoder.encode(dto.getMember_pw()));
		
		memService.joinAction(dto);
		
		mav.addObject("msg", "회원 가입 성공!");
		mav.addObject("url", "/main");
		
		return mav;
	}
	
	@GetMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("msg/msg");
		
		session.invalidate();
		
		mav.addObject("msg", "로그아웃 성공!");
		mav.addObject("url", "/main");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value = "/idCheck")
	public boolean idCheck(@RequestParam String member_id) {
		return memService.idCheck(member_id);
	}
}
