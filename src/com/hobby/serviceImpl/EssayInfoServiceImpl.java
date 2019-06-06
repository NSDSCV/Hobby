package com.hobby.serviceImpl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.hobby.mapper.EssayInfoMapper;
import com.hobby.pojo.FindReplycomment;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;
import com.hobby.service.EssayInfoService;

@Service
public class EssayInfoServiceImpl implements EssayInfoService {

	@Resource
	private EssayInfoMapper EssayInfoMapper;
	
	@Override
	public Post findPostById(String id) {
		return EssayInfoMapper.findPostById(id);
	}

	@Override
	public int findPostReplyCount(String pid) {
		return EssayInfoMapper.findPostReplyCount(pid);
	}

	@Override
	public List<Reply> findAllReply(String pid) {
		return EssayInfoMapper.findAllReply(pid);
	}

	@Override
	public int findPostCountById(String uid) {
		return EssayInfoMapper.findPostCountById(uid);
	}

	@Override
	public List<FindReplycomment> findReplycomment() {
		return EssayInfoMapper.findReplycomment();
	}

	@Override
	public void addPostHot(String id) {
		EssayInfoMapper.addPostHot(id);
	}

}
