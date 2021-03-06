package com.testSpringPjt.myapp;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.testSpringPjt.myapp.Post.Post;
import com.testSpringPjt.myapp.Post.service.PostService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	PostService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("loginCheck") == null) {
			session.setAttribute("loginCheck",false);
			session.setAttribute("uid",null);
		}
		logger.info("Welcome home! The client locale is {}.", locale);
		List<Post> posts = service.getAllPosts();
		req.setAttribute("posts", posts);
		
		return "/home";
	}
	
}
