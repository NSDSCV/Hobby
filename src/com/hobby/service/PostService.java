package com.hobby.service;

import java.util.List;

import com.hobby.pojo.Post;

public interface PostService {
	//查询全部帖子
	public List<Post> findAllPost(); 
	//删除一个选中的帖子
	public void deleById(String id);
	//根据时间降序查询（最新按钮）
	public List<Post> findAllPostBytimeDown(); 
	//根据时间升序查询（最热按钮）
	public List<Post> findAllPostByHotDown(); 
	//根据Id查询
	public Post selById(String id);
}
