package com.hobby.mapper;

import java.util.List;

import com.hobby.pojo.ComplaintComment;

public interface ComplaintCommentMapper {

	//查询所有投诉的评论
	public List<ComplaintComment> findAllComplaint();
	//审核封号处理
	public ComplaintComment dealBeNameSuccess(String id);
	//审核未通过
	public ComplaintComment dealBeNameFail(String id);
	
}