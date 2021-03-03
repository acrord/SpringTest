package com.testSpringPjt.myapp.Post.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.testSpringPjt.myapp.Post.Post;
import com.testSpringPjt.myapp.Post.dao.PostDao;

@Service
public class PostService implements IPostService{
	
	@Autowired 
	PostDao dao;
	
	@Override
	public List<Post> getAllPosts(){
		return dao.getAllPost();
	}
	
	@Override
	public int writePost(Post post) {
		int result = 0;
		
		if(post.getPost_PW() == "") result = dao.writePost(post); 
		else {
			post.setPost_PW(BCrypt.hashpw(post.getPost_PW(),BCrypt.gensalt()));
			result = dao.writePost_withPW(post);
		}
		return result;
	}
}
