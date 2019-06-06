package com.hobby.mapper;

import java.util.List;

import com.hobby.pojo.ComplaintPost;

public interface ComplaintpostMapper {

	//查询所有投诉帖子
	public List<ComplaintPost> findAllComplaint();
	//审核封号处理
	public ComplaintPost dealBeNameSuccess(String id);
	//审核未通过
	public ComplaintPost dealBeNameFail(String id);
	
}
