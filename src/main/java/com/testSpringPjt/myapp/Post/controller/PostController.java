package com.testSpringPjt.myapp.Post.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.testSpringPjt.myapp.Post.Post;
import com.testSpringPjt.myapp.Post.service.PostService;

@RequestMapping("/post")
@Controller
public class PostController {
	
	PostService service;
	
	@RequestMapping("/newPost")
	public ModelAndView newPost() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("newPostForm");
		return mav;
	}
	
	@RequestMapping("/savePost")
	public ModelAndView savePost(Post post) {
		post.setUpdated(Timestamp.valueOf(LocalDateTime.now()));
		post.setCreated(Timestamp.valueOf(LocalDateTime.now()));
		service.writePost(post);
		
		ModelAndView mav = new ModelAndView();
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/myapp");
		redirectView.setExposeModelAttributes(false);
		mav.setView(redirectView);
		return mav;
	}
	
	@RequestMapping("/content")
	public ModelAndView viewPost(int idx, HttpServletRequest req) {
		Post post = service.getPost(idx);
		ModelAndView mav = new ModelAndView();
		req.setAttribute("post", post);
		mav.setViewName("contents");
		return mav;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyPost(int idx, String uid, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user_ID = (String) session.getAttribute("uid");
		if(user_ID != uid) {
			ModelAndView mav = new ModelAndView();
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl("/myapp");
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);
			return mav;
		}else {
			Post post = service.getPost(idx);
			ModelAndView mav = new ModelAndView();
			req.setAttribute("post", post);
			mav.setViewName("modifyForm");
			return mav;
		}
	}
	
	@RequestMapping(value="/modifyPost", method = RequestMethod.POST)
	public ModelAndView modify(Post post) {
		post.setUpdated(Timestamp.valueOf(LocalDateTime.now()));
		service.modifyPost(post);
		ModelAndView mav = new ModelAndView();
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/myapp");
		redirectView.setExposeModelAttributes(false);
		mav.setView(redirectView);
		return mav;
	}
	
	@RequestMapping(value= "/delete", method = RequestMethod.POST )
	public ModelAndView deletePost(int idx, String uid, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String user_ID = (String) session.getAttribute("uid");
		if(user_ID != uid) {
			ModelAndView mav = new ModelAndView();
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl("/myapp");
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);
			return mav;
		}else {
			service.deletePost(idx);
			ModelAndView mav = new ModelAndView();
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl("/myapp");
			redirectView.setExposeModelAttributes(false);
			mav.setView(redirectView);
			return mav;
		}
	}
//	@RequestMapping(value= "/view", method = RequestMethod.POST )
//	public String updateViews(int post_ID) {
//		String result = service.updateView(post_ID);
//		return result;
//	}
}