package com.community.member;

public interface MemberService {

	public void joinAction(MemberDto dto);
	
	public MemberDto loginAction(MemberDto dto);
	
	public boolean idCheck(String member_id);
}
