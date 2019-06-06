package com.hobby.service;

import com.hobby.pojo.User;

public interface UserLoginService {

	// 用户登录核对
	public User userLogin(String email, String password);
}
