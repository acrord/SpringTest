package com.testSpringPjt.myapp.Post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.testSpringPjt.myapp.Post.service.PostService;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	PostService serivce;
	
	@RequestMapping("/newPost")
	ModelAndView newPost() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("newPostForm");
		return mav;
	}
}
