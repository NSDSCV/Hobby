package com.hobby.mapper;

import java.util.List;

import com.hobby.pojo.User;

public interface UserMapper {

	//显示全部用户
	public List<User> findAllUser();
	//修改用户信息
	public int editUser(User user);
	//通过id查找某条数据
	public User selById(String username);
	//通过用户名修改他的status=1（封号处理）
	public int dealStatusSuccess(String username);
	//通过用户名修改他的status=0（未通过）
	public int dealStatusFail(String username);
	
	//根据email查询用户
	public User selByemail(String email);
}