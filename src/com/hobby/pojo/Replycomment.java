package com.hobby.pojo;

import java.util.Date;

//评论回复实体
public class Replycomment {

	private String id;
	private User uid;
	private Reply rid;
	private String info;
	private Date time;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	public Reply getRid() {
		return rid;
	}
	public void setRid(Reply rid) {
		this.rid = rid;
	}
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
	@Override
	public String toString() {
		return "Replycomment [id=" + id + ", uid=" + uid + ", rid=" + rid + ", info=" + info + ", time=" + time + "]";
	}
	
	
}
