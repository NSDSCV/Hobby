package com.hobby.pojo.page;

import java.util.ArrayList;
import java.util.List;


public class PageBean<T> {

	// 每页显示的数据
	private List<T> postList=new ArrayList<T>();
	// 总页数
	private int totalPage;
	// 当前页
	private int currentPage;
	// 总条数
	private int totalCount;
	// 当前页显示的条数
	private int currentCount;
	public List<T> getPostList() {
		return postList;
	}
	public void setPostList(List<T> postList) {
		this.postList = postList;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	@Override
	public String toString() {
		return "PageBean [totalPage=" + totalPage + ", currentPage=" + currentPage + ", totalCount=" + totalCount
				+ ", currentCount=" + currentCount + "]";
	}
	
	
}
