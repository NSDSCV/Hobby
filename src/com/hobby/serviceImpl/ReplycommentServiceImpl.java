package com.hobby.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.ReplycommentMapper;
import com.hobby.service.ReplycommentService;

@Service
public class ReplycommentServiceImpl implements ReplycommentService {

	@Resource
	private ReplycommentMapper replycommentMapper;
	
	@Override
	public String Replycomment(com.hobby.pojo.Replycomment replycomment) {
		int result = replycommentMapper.Replycomment(replycomment);
		return result==1?"成功":"";
	}

	@Override
	public List<com.hobby.pojo.Replycomment> findAll() {
		return replycommentMapper.findAll();
	}

}
