package com.testSpringPjt.myapp.Post.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.testSpringPjt.myapp.Post.Post;

@Repository
public class PostDao implements IPostDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Post> getAllPost(){
		List<Post> allPost = sqlSession.selectList("getList");
		
		return allPost;
	}
	
	@Override
	public int writePost(Post post) {
		int result = 0;
		result = sqlSession.insert("writePost", post);
		return result;
	}
	
	@Override
	public int writePost_withPW(Post post) {
		
		int result = sqlSession.insert("writePost_withPW", post);
		return result;
	}
}
