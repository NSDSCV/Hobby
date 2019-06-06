package com.hobby.service;

import java.util.List;

import com.hobby.pojo.ComplaintPost;

public interface ComplaintpostService {

	// 查询所有投诉帖子
	public List<ComplaintPost> findAllComplaint();

	// 审核封号处理
	public int dealBeNameSuccess(String id);

	// 审核未通过
	public int dealBeNameFail(String id);
	
}
