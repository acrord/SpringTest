package com.testSpringPjt.myapp.Post.service;

import java.util.List;

import com.testSpringPjt.myapp.Post.Post;

public interface IPostService {
	public List<Post> getAllPosts();
	
	public void writePost(Post post);

	public Post getPost(int post_ID);

	public void modifyPost(Post post);
	
	public void deletePost(int post_ID);
	
}
