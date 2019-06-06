package com.hobby.mapper;


import java.util.List;
import com.hobby.pojo.Post;
import com.hobby.pojo.Theme;

public interface ThemeInfoMapper {

	//通过ID查询一个主题
	public Theme findBtId(int id); 
	//通过主题ID查询帖子表（最新）
	public List<Post> findByTime(int id); 
	//通过主题ID查询帖子表（最热）
	public List<Post> findByhot(int id); 
	//获得分页的帖子数据(最新)
	public List<Post> findNewPostListForPage(int tid,int index,int currentCount);
	//获得分页的帖子数据(最新)
	public List<Post> findHotPostListForPage(int tid,int index,int currentCount);

}
