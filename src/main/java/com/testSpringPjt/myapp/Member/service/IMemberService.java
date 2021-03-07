package com.testSpringPjt.myapp.Member.service;

import com.testSpringPjt.myapp.Member.Member;

public interface IMemberService {
	void insertMember(Member member);
	String CheckId(String uid);
	Member loginCheck(String uid);
}
