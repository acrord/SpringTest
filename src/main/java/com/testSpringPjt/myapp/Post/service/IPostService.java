package com.testSpringPjt.myapp.Post.service;

import java.util.List;

import com.testSpringPjt.myapp.Post.Post;

public interface IPostService {
	public List<Post> getAllPosts();
	
	public int writePost(Post post);
	
//	public int checkPW(String post_PW);
	
}
