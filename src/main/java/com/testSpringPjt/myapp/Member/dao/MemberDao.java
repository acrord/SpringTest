package com.testSpringPjt.myapp.Member.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.testSpringPjt.myapp.Member.Member;

@Repository
public class MemberDao implements IMemberDao{
	
	@Autowired
	private SqlSessionFactory sqlSession;
	
	
	@Override
	public int insertMember(Member member) {
		int result = 0;
		SqlSession session = sqlSession.openSession();
		try {
			result = session.insert("insertMember", member);
		}
		finally{
			session.close();
		}
		return result;
	}

	@Override
	public Member selectMember(String uid) {
		SqlSession session = sqlSession.openSession();
		try {
			return (Member)session.selectOne("selectMember", uid);
		}
		finally {
			session.close();
		}
	}

}
