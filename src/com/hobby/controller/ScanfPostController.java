package com.hobby.controller;

import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobby.Utils.CommonsUtil;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;
import com.hobby.pojo.User;
import com.hobby.service.PostService;
import com.hobby.service.ScanfPostService;

@Controller
public class ScanfPostController {

	@Resource
	private ScanfPostService scanfPostServiceImpl;
	@Resource
	private PostService postServiceImpl;
	
	//评论帖子
	@RequestMapping("scanfPost.do")
	@ResponseBody
	public String scanfPost(String content,String pid,HttpServletRequest req){
		content = content.replace("<br />", " "); 
		content = content.replace("垃圾", "我是沙雕！"); 
		content = content.replace("垃", "我是沙雕！"); 
		content = content.replace("圾", "我是沙雕！"); 
		content = content.replace("辣鸡", "我是沙雕！");
		HttpSession session = req.getSession();
		 User user = (User) session.getAttribute("user");
		 Post post = postServiceImpl.selById(pid);
		 Reply reply = new Reply();
		 reply.setId(CommonsUtil.getUUID());
		 reply.setInfo(content);
		 reply.setPid(post);
		 reply.setTime(new Date());
		 reply.setUid(user);
		 String message = scanfPostServiceImpl.replyPost(reply);
		if(message=="成功") {
			return post.getId();
		}else {
			return "";
		}
	} 
	
}