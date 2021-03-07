package com.testSpringPjt.myapp.Post.dao;

import java.util.List;

import com.testSpringPjt.myapp.Post.Post;

public interface IPostDao {
	public List<Post> getAllPost();
	
	public int writePost(Post post);

	public int writePost_withPW(Post post);

	public Post getPost(int post_ID);
	
	public int updatePost(Post post);

	public int updatePost_withPW(Post post);
	
	public int deletePost(int post_ID);

	public int updateView(int post_ID);

}
