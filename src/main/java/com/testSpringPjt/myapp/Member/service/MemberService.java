package com.testSpringPjt.myapp.Member.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.testSpringPjt.myapp.Member.Member;
import com.testSpringPjt.myapp.Member.dao.MemberDao;

@Service
public class MemberService implements IMemberService{

	
	@Autowired 
	MemberDao dao;
	
	@Override
	public void insertMember(Member member) {
		int result = dao.insertMember(member);
		if(result==1) {
			System.out.println("Register Success");
		}else {
			System.out.println("Register Failed");
		}
	}

	
	@Override
	public String CheckId(String uid) {
		Member result = (Member)dao.selectMember(uid);
		if(result == null) return "usable";
		else return "unable";
	}
	@Override
	public Member loginCheck(String uid) {
		Member result = (Member)dao.selectMember(uid);
		return result;
	}

}
