package com.hobby.pojo;

public class ComplaintPost {

	private Post  pid; 
	private User bename;
	private User name;
	private String id;
	public Post getPid() {
		return pid;
	}
	public void setPid(Post pid) {
		this.pid = pid;
	}
	public User getBename() {
		return bename;
	}
	public void setBename(User bename) {
		this.bename = bename;
	}
	public User getName() {
		return name;
	}
	public void setName(User name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ComplaintPost [pid=" + pid + ", bename=" + bename + ", name=" + name + ", id=" + id + "]";
	}

	
	
}
