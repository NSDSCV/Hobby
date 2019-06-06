package com.hobby.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.UserLoginMapper;
import com.hobby.pojo.User;
import com.hobby.service.UserLoginService;
@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Resource
	private UserLoginMapper userLoginMapper;
	
	@Override
	public User userLogin(String email, String password) {
		return userLoginMapper.userLogin(email, password);
	}

	
}
