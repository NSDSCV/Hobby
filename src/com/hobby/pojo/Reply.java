package com.hobby.pojo;

import java.util.Date;

public class Reply {

	private String info;
	private Date time;
	private User uid;
	private Post pid;
	private String id;
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	public Post getPid() {
		return pid;
	}
	public void setPid(Post pid) {
		this.pid = pid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Reply [info=" + info + ", time=" + time + ", uid=" + uid + ", pid=" + pid + ", id=" + id + "]";
	}
	


	
}
