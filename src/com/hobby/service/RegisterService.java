package com.hobby.service;

import com.hobby.pojo.User;

public interface RegisterService {

	// 核对用户名是否存在
	public boolean checkUserName(String username);

	//核对邮箱是否存在
	public boolean checkemailName(String email);
	
	// 注册用户（但未激活）
	public int addUser(User user);

	// 激活的账号（修改状态码）
	public int editActiveCode(String activecode);

}
