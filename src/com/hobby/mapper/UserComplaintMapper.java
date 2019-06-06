package com.hobby.mapper;

import com.hobby.pojo.ComplaintComment;
import com.hobby.pojo.ComplaintPost;

public interface UserComplaintMapper {

	//插入投诉帖子
	public int addComplaintPost(ComplaintPost complaintpost);
	//插入投诉帖子
	public int addComplaintComment(ComplaintComment complaintcomment);
		
}
