package com.hobby.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.ReplyMapper;
import com.hobby.pojo.Reply;
import com.hobby.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Resource
	private  ReplyMapper replyMapper;

	@Override
	public Reply selById(String id) {
		return replyMapper.selById(id);
	}

}
