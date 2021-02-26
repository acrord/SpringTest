package com.testSpringPjt.myapp.Member.dao;

import org.apache.ibatis.session.SqlSession;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.testSpringPjt.myapp.Member.Member;

@Repository
public class MemberDao implements IMemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMember(Member member) {
		int result = 0;
		member.setUpw(BCrypt.hashpw(member.getUpw(), BCrypt.gensalt()));
		result = sqlSession.insert("insertMember", member);
		
		return result;
	}

	@Override
	public Member selectMember(String uid) {
		Member result = (Member)sqlSession.selectOne("selectMember", uid);
		return result;
	}
}
