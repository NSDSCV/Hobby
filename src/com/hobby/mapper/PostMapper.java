package com.hobby.mapper;

import java.util.List;

import com.hobby.pojo.Post;
import com.hobby.pojo.Theme;
import com.hobby.pojo.User;

public interface PostMapper {

	//查询主题表
	public List<Theme> findAllTheme();
	
	//查询用户表
	public List<User> findAllUser();

	//查询全部帖子
	public List<Post> findAllPost(); 
	//删除一个选中的帖子
	public void deleById(String id);
	//根据Id查询
	public Post selById(String id);
	//根据时间降序查询（最新按钮）
	public List<Post> findAllPostBytimeDown(); 
	//根据热度降序查询（最热按钮）
	public List<Post> findAllPostByHotDown(); 
	//查询帖子总条数
	public int postCount();
}
