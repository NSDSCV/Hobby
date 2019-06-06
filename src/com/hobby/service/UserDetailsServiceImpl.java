package com.hobby.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import com.hobby.mapper.LoginMapper;
import com.hobby.pojo.Admin;

//认证类
public class UserDetailsServiceImpl implements UserDetailsService {

	@Resource
	private LoginMapper loginMapper; 

	@Override
	public UserDetails loadUserByUsername(String username) {
		//构建一个角色列表
		List<GrantedAuthority> GrantedAuthority = new ArrayList();
		GrantedAuthority.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		Admin findByid = loginMapper.findByid(username);
		if(findByid!=null) {
			return new User(username, findByid.getPassword(), GrantedAuthority);
		}else {
			return null;
		}
	}
}
