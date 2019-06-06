package com.hobby.pojo;

import java.util.Date;

public class Post {

	private String title;
	private Date time;
	private int hot;
	private String content;
	private User uid;
	private Theme tid;
	private String id;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}


	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	public Theme getTid() {
		return tid;
	}
	public void setTid(Theme tid) {
		this.tid = tid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Post [title=" + title + ", time=" + time + ", hot=" + hot + ", content=" + content + ", uid=" + uid
				+ ", tid=" + tid + ", id=" + id + "]";
	}
	
	
	
}
