package com.community.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.community.main.MainDto;
import com.community.main.MainService;

public class HeaderInterceptor implements HandlerInterceptor {

	@Autowired private MainService mainService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		List<MainDto> boardNameList = mainService.boardNameList();
		
		request.setAttribute("boardNameList", boardNameList);
		
		return true;
	}
}
