package com.hobby.mapper;

import java.util.List;

public interface ReplycommentMapper {

	//插入回复
	public int Replycomment(com.hobby.pojo.Replycomment replycomment);
	//查询全部回复
	public List<com.hobby.pojo.Replycomment> findAll();
	
}
