package com.testSpringPjt.myapp.Member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.testSpringPjt.myapp.Member.Member;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	@RequestMapping(value="/register")
	public String RegisterForm(Member member) {
		return "/register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String memRegister(Member member) {
		System.out.println(member.getUid());
		System.out.println(member.getUpw());
		System.out.println(member.getGender());
		System.out.println(member.getUphone1());
		System.out.println(member.getUphone2());
		System.out.println(member.getUphone3());
		 
		
		return "/login";
	}
	
	@RequestMapping(value="/login")
	public String LoginForm(Member member) {
		return "/login";
	}
	
	@RequestMapping(value="/login", method= RequestMethod.POST)
	public String Login(Member member) {
		System.out.println(member.getUid());
		return "/";
	}
}
