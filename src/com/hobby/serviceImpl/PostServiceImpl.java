package com.hobby.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.PostMapper;
import com.hobby.pojo.Post;
import com.hobby.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Resource
	private PostMapper postMapper;

	@Override
	public List<Post> findAllPost() {
		return postMapper.findAllPost();
	}

	@Override
	public void deleById(String id) {
		postMapper.deleById(id);
	}

	@Override
	public List<Post> findAllPostBytimeDown() {
		return postMapper.findAllPostBytimeDown();
	}

	@Override
	public List<Post> findAllPostByHotDown() {
		return postMapper.findAllPostByHotDown();
	}

	@Override
	public Post selById(String id) {
		return postMapper.selById(id);
	}


}
