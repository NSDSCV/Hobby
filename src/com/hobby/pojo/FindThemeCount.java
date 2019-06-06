package com.hobby.pojo;

public class FindThemeCount {

	private int tid;
	private int count;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "FindThemeCount [tid=" + tid + ", count=" + count + "]";
	}
	
}
