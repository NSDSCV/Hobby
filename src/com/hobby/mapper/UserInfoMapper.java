package com.hobby.mapper;

import java.util.List;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;

public interface UserInfoMapper {

	//查询他的全部帖子
	public List<Post> findAllPost(String uid);
	//查询他的被评论信息
	public List<Reply> findAllReply(String pid);
	//修改头像
	public void editImages(String images,String email);
	//修改密码
	public void editPasswd(String password,String email);
}
