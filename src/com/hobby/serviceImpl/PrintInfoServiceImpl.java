package com.hobby.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.PrintInfoMapper;
import com.hobby.pojo.Post;
import com.hobby.service.PrintInfoService;

@Service
public class PrintInfoServiceImpl implements PrintInfoService {

	@Resource
	private PrintInfoMapper printInfoMapper;
	
	@Override
	public String insertPost(Post post) {
		int insertPost = printInfoMapper.insertPost(post);
		return insertPost==1?"成功":"";
	}

}
