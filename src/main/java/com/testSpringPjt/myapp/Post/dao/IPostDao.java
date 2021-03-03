package com.testSpringPjt.myapp.Post.dao;

import java.util.List;

import com.testSpringPjt.myapp.Post.Post;

public interface IPostDao {
	public List<Post> getAllPost();
	
	public int writePost(Post post);

	public int writePost_withPW(Post post);
	
//	public Post readPost(int pid);
	
//	public int updatePost(int pid, Post post);
//	
//	public int deletePost(int pid);
	
}
