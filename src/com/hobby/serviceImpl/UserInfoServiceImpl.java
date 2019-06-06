package com.hobby.serviceImpl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.hobby.mapper.UserInfoMapper;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;
import com.hobby.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Resource
	private UserInfoMapper userInfoMapper;
	
	@Override
	public List<Post> findAllPost(String uid) {
		return userInfoMapper.findAllPost(uid);
	}

	@Override
	public List<Reply> findAllReply(String pid) {
		return userInfoMapper.findAllReply(pid);
	}

	@Override
	public void editImages(String images, String email) {
		userInfoMapper.editImages(images, email);
	}

	@Override
	public void editPasswd(String password, String email) {
		userInfoMapper.editPasswd(password, email);
	}
	
}
