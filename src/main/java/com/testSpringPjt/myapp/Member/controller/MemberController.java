package com.testSpringPjt.myapp.Member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.testSpringPjt.myapp.Member.Member;
import com.testSpringPjt.myapp.Member.dao.MemberDao;
import com.testSpringPjt.myapp.Member.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	@RequestMapping(value="/register")
	public String RegisterForm(Member member) {
		return "/register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public ModelAndView memRegister(Member member) {
		service.insertMember(member);
		ModelAndView mav = new ModelAndView();
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/myapp/member/login");
		redirectView.setExposeModelAttributes(false);
		mav.setView(redirectView);
		return mav;
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
