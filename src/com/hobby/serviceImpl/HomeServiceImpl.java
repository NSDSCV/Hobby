package com.hobby.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.HomeMapper;
import com.hobby.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService {

	@Resource
	private HomeMapper homeMapper;
	
	@Override
	public int AllUserCount() {
		return homeMapper.AllUserCount();
	}

	@Override
	public int AllPostCount() {
		return homeMapper.AllPostCount();
	}

}
