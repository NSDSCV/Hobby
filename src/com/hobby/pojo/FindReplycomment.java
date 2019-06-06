package com.hobby.pojo;

public class FindReplycomment {

	private User uid;
	private String rid;
	private String info;
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "FindReplycomment [uid=" + uid + ", rid=" + rid + ", info=" + info + "]";
	}
}