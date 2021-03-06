package com.testSpringPjt.myapp.Post;

import java.sql.Timestamp;

public class Post {
	private int Post_ID;
	private String User_ID;
	private Timestamp Created;
	private Timestamp Updated;
	private int Public;
	private String Title;
	private String Post_PW;
	private int Read_Cnt;
	private String Content;
	
	public int getPost_ID() {
		return Post_ID;
	}
	
	public void setPost_ID(int post_ID) {
		Post_ID = post_ID;
	}
	
	public String getUser_ID() {
		return User_ID;
	}
	
	public void setUser_ID(String user_ID) {
		User_ID = user_ID;
	}
	
	public Timestamp getCreated() {
		return Created;
	}
	
	public void setCreated(Timestamp timestamp) {
		Created = timestamp;
	}
	
	public Timestamp getUpdated() {
		return Updated;
	}
	
	public void setUpdated(Timestamp updated) {
		Updated = updated;
	}
	
	public int getPublic() {
		return Public;
	}
	
	public void setPublic(int public1) {
		Public = public1;
	}
	
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String title) {
		Title = title;
	}
	
	public String getPost_PW() {
		return Post_PW;
	}
	
	public void setPost_PW(String post_PW) {
		Post_PW = post_PW;
	}
	
	public int getRead_Cnt() {
		return Read_Cnt;
	}
	
	public void setRead_Cnt(int read_Cnt) {
		Read_Cnt = read_Cnt;
	}
	
	public String getContent() {
		return Content;
	}
	
	public void setContent(String content) {
		Content = content;
	}
}
