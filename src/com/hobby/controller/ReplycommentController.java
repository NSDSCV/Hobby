package com.hobby.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.hobby.Utils.CommonsUtil;
import com.hobby.pojo.Reply;
import com.hobby.pojo.Replycomment;
import com.hobby.pojo.User;
import com.hobby.service.ReplyService;
import com.hobby.service.ReplycommentService;

@Controller
public class ReplycommentController {

	@Resource
	private ReplycommentService ReplycommentServiceImpl;
	@Resource
	private ReplyService ReplyServiceImpl;
	
	//加载评论信息
	@RequestMapping("showReply.do")
	public ModelAndView showReply(String rid) {
		ModelAndView view = new ModelAndView();
		view.addObject("rid",rid);
		view.setViewName("replycomment.jsp");
		return view;
	}
	
	//提交回复
	@RequestMapping("Replycomment.do")
	@ResponseBody
	public String Replycomment(String info,String rid,HttpServletRequest req) {
		info = info.replace("<br />", " "); 
		info = info.replace("垃圾", "我是沙雕！"); 
		info = info.replace("垃", "我是沙雕！"); 
		info = info.replace("圾", "我是沙雕！"); 
		info = info.replace("辣鸡", "我是沙雕！"); 
		Reply reply = ReplyServiceImpl.selById(rid);
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		com.hobby.pojo.Replycomment replycomment = new Replycomment();
		replycomment.setId(CommonsUtil.getUUID());
		replycomment.setInfo(info);
		replycomment.setRid(reply);
		replycomment.setTime(new Date());
		replycomment.setUid(user);
		String result = ReplycommentServiceImpl.Replycomment(replycomment);
		if(result=="成功") {
			return reply.getPid().getId();
		}else {
			return "";
		}
	}
	
}