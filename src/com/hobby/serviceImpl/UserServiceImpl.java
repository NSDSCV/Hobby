package com.hobby.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.UserMapper;
import com.hobby.pojo.User;
import com.hobby.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper UserMapper;
	@Override
	public List<User> findAllUser() {
		return UserMapper.findAllUser();
	}
	@Override
	public String editUser(User user) {
		int i = UserMapper.editUser(user);
		if(i!=0) {
			return "成功";
		}
		return null;
	}
	@Override
	public User selByemail(String email) {
		return UserMapper.selByemail(email);
	}
}