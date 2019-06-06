package com.hobby.service;

import com.hobby.pojo.ComplaintComment;
import com.hobby.pojo.ComplaintPost;

public interface UserComplaintService {
	//插入投诉帖子
	public String addComplaintPost(ComplaintPost complaintpost);
	//插入投诉帖子
	public String addComplaintComment(ComplaintComment complaintcomment);

}
