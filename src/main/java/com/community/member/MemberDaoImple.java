package com.community.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImple implements MemberDao {

	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void joinAction(MemberDto dto) {
		sqlSessionTemplate.insert("member.joinAction", dto);
	}

	@Override
	public MemberDto loginAction(MemberDto dto) {
		return sqlSessionTemplate.selectOne("member.loginAction", dto);
	}
	
	@Override
	public String idCheck(String member_id) {
		return sqlSessionTemplate.selectOne("member.idCheck", member_id);
	}
}
