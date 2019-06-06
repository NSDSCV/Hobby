package com.hobby.service;

import java.util.List;

import com.hobby.pojo.Post;
import com.hobby.pojo.Theme;
import com.hobby.pojo.page.PageBean;

public interface ThemeInfoService {
	//通过ID查询一个主题
	public Theme findBtId(int id); 

	//通过主题ID查询帖子表（最新）
		public List<Post> findByTime(int id); 
		//通过主题ID查询帖子表（最热）
		public List<Post> findByhot(int id); 
		//分页操作(最新)
		public <T> PageBean<T> findNewPage(int tid,int currentPage,int currentCount);
		//分页操作(最热)
		public <T> PageBean<T> findHotPage(int tid,int currentPage,int currentCount);
}
