package com.testSpringPjt.myapp.Member.dao;

import com.testSpringPjt.myapp.Member.Member;

public interface IMemberDao {//CRUD
	int insertMember(Member member);
	Member selectMember(String uid);
//	int memberUpdate(Member member);
//	int memberDelete(Member member);
}