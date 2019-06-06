package com.hobby.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.ComplaintpostMapper;
import com.hobby.mapper.UserMapper;
import com.hobby.pojo.ComplaintPost;
import com.hobby.service.ComplaintpostService;

@Service
public class ComplaintpostServiceImpl implements ComplaintpostService {

	@Resource
	private ComplaintpostMapper complaintpostMapper;
	@Resource
	private UserMapper userMapper;
	
	@Override
	public List<ComplaintPost> findAllComplaint() {
		return complaintpostMapper.findAllComplaint();
	}

	@Override
	public int dealBeNameSuccess(String id) {
		ComplaintPost complaintPost = complaintpostMapper.dealBeNameSuccess(id);
		return userMapper.dealStatusSuccess(complaintPost.getBename().getUsername());
	}

	@Override
	public int dealBeNameFail(String id) {
		ComplaintPost complaintPost = complaintpostMapper.dealBeNameSuccess(id);
		return userMapper.dealStatusFail(complaintPost.getBename().getUsername());
	}
	
}
