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
	public void writePost(Post post) {
		
		if(post.getPost_PW() == "") dao.writePost(post); 
		else {
			post.setPost_PW(BCrypt.hashpw(post.getPost_PW(),BCrypt.gensalt()));
			dao.writePost_withPW(post);
		}
	}
	
	@Override
	public Post getPost(int post_ID) {
		Post post = dao.getPost(post_ID);
		return post;
	}

	@Override
	public void modifyPost(Post post) {
		if(post.getPost_PW() == "") dao.updatePost(post); 
		else {
			post.setPost_PW(BCrypt.hashpw(post.getPost_PW(),BCrypt.gensalt()));
			dao.updatePost_withPW(post);
		}
		
	}
	
	@Override
	public void deletePost(int post_ID) {
		int result = dao.deletePost(post_ID);
		if(result==1) {
			System.out.println(post_ID + "삭제 완료");
		}
		
	}

	@Override
	public String updateView(int post_ID) {
		int result = dao.updateView(post_ID);
		if(result==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@Override
	public String check_PW(int post_ID, String post_PW) {
		Post post = dao.getPost(post_ID);
		if(post != null && BCrypt.checkpw(post_PW, post.getPost_PW())) {
			System.out.println("성공");
			return "success";
		}
		else {
			System.out.println("실패");
			return "fail";
		}
	}

}
