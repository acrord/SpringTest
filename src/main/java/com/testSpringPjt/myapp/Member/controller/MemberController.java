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
		redirectView.setUrl("/myapp");
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
	
	@RequestMapping(value="/login")
	public String LoginForm() {
		
		return "/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginCheck", method = RequestMethod.POST)
	public ModelAndView LoginCheck(String uid, String upw, HttpServletRequest req) {
		Member member = service.loginCheck(uid);
		ModelAndView mav = new ModelAndView();
		RedirectView redirectView = new RedirectView();
		HttpSession session = req.getSession();
		if(member != null && BCrypt.checkpw(upw, member.getUpw())) {
			session.setAttribute("loginCheck",true);
            session.setAttribute("uid", member.getUid());
    		redirectView.setExposeModelAttributes(false);
    		redirectView.setUrl("/myapp");
            mav.setView(redirectView);
			return mav;
		}
		else {
			redirectView.setExposeModelAttributes(false);
			redirectView.setUrl("/myapp/member/login");
			return mav;
		}
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView test(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("loginCheck",false);
		session.setAttribute("uid",null);
		ModelAndView mav = new ModelAndView();
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/myapp");
		redirectView.setExposeModelAttributes(false);
		mav.setView(redirectView);
		return mav;
	}
	
}
