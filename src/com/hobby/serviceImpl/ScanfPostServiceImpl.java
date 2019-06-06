package com.hobby.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.ScanfPostMapper;
import com.hobby.pojo.Reply;
import com.hobby.service.ScanfPostService;

@Service
public class ScanfPostServiceImpl implements ScanfPostService {

	@Resource
	private ScanfPostMapper  scanfPostMapper;
	
	@Override
	public String replyPost(Reply reply) {
		int replyPost = scanfPostMapper.replyPost(reply);
		return replyPost==1?"成功":"";
	}

}
