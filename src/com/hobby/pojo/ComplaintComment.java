package com.hobby.pojo;

public class ComplaintComment {
	private Post pid;
	private User bename;
	private User name;
	private Reply rid;
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
	public Reply getRid() {
		return rid;
	}
	public void setRid(Reply rid) {
		this.rid = rid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ComplaintComment [pid=" + pid + ", bename=" + bename + ", name=" + name + ", rid=" + rid + ", id=" + id
				+ "]";
	}

	
	
	
}
