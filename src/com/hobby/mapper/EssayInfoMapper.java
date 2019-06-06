package com.hobby.mapper;

import java.util.List;

import com.hobby.pojo.FindReplycomment;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;

//查询相应帖子的详情
public interface EssayInfoMapper {

	//通过ID查询帖该子
	public Post findPostById(String id);
	//查询此帖子的评论数
	public int findPostReplyCount(String pid);
	//查询此帖子的全部评论
	public List<Reply> findAllReply(String pid);
	//查询用户的帖子数
	public int findPostCountById(String uid);
	//加载评论回复的内容（使用分组GROUP BY查询）
	public List<FindReplycomment> findReplycomment();
	//点击帖子热度加一
	public void addPostHot(String id);
	
 }
