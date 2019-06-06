package com.hobby.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.UserComplaintMapper;
import com.hobby.pojo.ComplaintComment;
import com.hobby.pojo.ComplaintPost;
import com.hobby.service.UserComplaintService;

@Service
public class UserComplaintServiceImpl implements UserComplaintService{

	@Resource
	private UserComplaintMapper userComplaintMapper;
	
	@Override
	public String addComplaintPost(ComplaintPost complaintpost) {
		int result = userComplaintMapper.addComplaintPost(complaintpost);
		return result==1?"成功":"";
	}

	@Override
	public String addComplaintComment(ComplaintComment complaintcomment) {
		int result = userComplaintMapper.addComplaintComment(complaintcomment);
		return result==1?"成功":"";
	}

}