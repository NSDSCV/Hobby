package com.hobby.serviceImpl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.hobby.mapper.ComplaintCommentMapper;
import com.hobby.mapper.UserMapper;
import com.hobby.pojo.ComplaintComment;
import com.hobby.service.ComplaintCommentService;

@Service
public class ComplaintCommentServiceImpl implements ComplaintCommentService {

	@Resource
	private ComplaintCommentMapper complaintCommentMapper;
	@Resource
	private UserMapper userMapper;
	
	@Override
	public List<ComplaintComment> findAllComplaint() {
		return complaintCommentMapper.findAllComplaint();
	}

	@Override
	public int dealBeNameSuccess(String id) {
		ComplaintComment complaintComment = complaintCommentMapper.dealBeNameSuccess(id);
		return userMapper.dealStatusSuccess(complaintComment.getBename().getUsername());
	}

	@Override
	public int dealBeNameFail(String id) {
		ComplaintComment complaintComment = complaintCommentMapper.dealBeNameSuccess(id);
		return userMapper.dealStatusFail(complaintComment.getBename().getUsername());
	}
	
}
