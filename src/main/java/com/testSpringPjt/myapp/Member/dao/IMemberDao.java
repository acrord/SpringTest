package com.testSpringPjt.myapp.Member.dao;

import com.testSpringPjt.myapp.Member.Member;

public interface IMemberDao {
	int insertMember(Member member);
	Member selectMember(String uid);
}