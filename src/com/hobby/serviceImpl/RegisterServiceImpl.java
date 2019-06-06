package com.hobby.serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.RegisterMapper;
import com.hobby.pojo.User;
import com.hobby.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Resource
	private RegisterMapper RegisterMapper;

	@Override
	public boolean checkUserName(String username) {
		Long isExist = RegisterMapper.checkUserName(username);
		return isExist > 0 ? true : false;
	}

	@Override
	public int addUser(User user) {
		return RegisterMapper.addUser(user);
	}

	@Override
	public int editActiveCode(String activecode) {
		return RegisterMapper.editActiveCode(activecode);
	}

	@Override
	public boolean checkemailName(String email) {
		 Long isExist = RegisterMapper.checkemailName(email);
		 return isExist > 0 ? true : false; 
	}

}
