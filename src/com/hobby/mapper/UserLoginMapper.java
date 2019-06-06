package com.hobby.mapper;

import com.hobby.pojo.User;

public interface UserLoginMapper {

	//用户登录核对
	public User userLogin(String email,String password);
	
}
