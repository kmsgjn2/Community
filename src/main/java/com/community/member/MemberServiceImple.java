package com.community.member;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired private MemberDao memDao;

	@Override
	public void joinAction(MemberDto dto) {
		memDao.joinAction(dto);
	}

	@Override
	public MemberDto loginAction(MemberDto dto) {
		MemberDto loginDto = memDao.loginAction(dto);
		return loginDto;
	}
	
	@Override
	public boolean idCheck(String member_id) {
		
		if (memDao.idCheck(member_id) == null) {
			return true;
		}
		
		return false;
	}
}
