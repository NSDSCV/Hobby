package com.hobby.service;

import java.util.List;

public interface ReplycommentService {

	// 插入回复
	public String Replycomment(com.hobby.pojo.Replycomment replycomment);

	// 查询全部回复
	public List<com.hobby.pojo.Replycomment> findAll();
}
