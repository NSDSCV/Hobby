package com.hobby.mapper;

import com.hobby.pojo.Admin;
import com.hobby.pojo.User;

public interface LoginMapper {

	//通过id查询admin管理员的信息
	public Admin findByid(String username);
	//通过id查询用户的信息
	public User findByName(String username);
	
}
