package com.testSpringPjt.myapp.Member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String RegisterForm() {
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
	
	@ResponseBody
	@RequestMapping(value="/userCheck", method = RequestMethod.POST)
	public String DuplicateCheck(String uid) {
		String checked = service.CheckId(uid);
		return checked;
	}
	
	@ResponseBody
	@RequestMapping(value="/loginCheck", method = RequestMethod.POST)
	public String LoginCheck(String uid, String upw) {
		Member member = service.loginCheck(uid, upw);
		if(BCrypt.checkpw(upw, member.getUpw())) {
			return "success";
		}
		else {
			return "false";
		}
	}
	
	@RequestMapping(value="/login")
	public String LoginForm() {
		
		return "/login";
	}
	
}
