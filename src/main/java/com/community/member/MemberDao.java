package com.community.member;

public interface MemberDao {

	public void joinAction(MemberDto dto);
	
	public MemberDto loginAction(MemberDto dto);
	
	public String idCheck(String member_id);
}
