package com.hobby.service;

import java.util.List;

import com.hobby.pojo.User;

public interface UserService {
	// 显示全部用户
	public List<User> findAllUser();

	// 修改用户信息
	public String editUser(User user);
	//根据email查询用户
		public User selByemail(String email);
}
