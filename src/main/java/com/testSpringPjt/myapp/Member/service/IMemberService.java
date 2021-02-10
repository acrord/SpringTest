package com.testSpringPjt.myapp.Member.service;

import com.testSpringPjt.myapp.Member.Member;

public interface IMemberService {
	void insertMember(Member member);
	Member searchMember(Member member);
//	Member memberModify(Member member);
//	int memberRemove(Member member);
}
