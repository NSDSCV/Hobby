package com.hobby.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.pojo.FindReplycomment;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;
import com.hobby.service.EssayInfoService;

@Controller
public class EssayInfoController {

	@Resource
	private EssayInfoService EssayInfoServiceImpl;
	
	@RequestMapping("showessayInfo.do")
	public ModelAndView show(String id) {
		Post postById = EssayInfoServiceImpl.findPostById(id);
		int replyCount = EssayInfoServiceImpl.findPostReplyCount(id);
		List<Reply> allReply = EssayInfoServiceImpl.findAllReply(id);
		List<FindReplycomment> map = EssayInfoServiceImpl.findReplycomment();
		int usePostCountById = EssayInfoServiceImpl.findPostCountById(postById.getUid().getUsername());
		EssayInfoServiceImpl.addPostHot(id);
		ModelAndView view = new ModelAndView();
		view.addObject("postById", postById);
		view.addObject("replyCount", replyCount);
		view.addObject("allReply", allReply);
		view.addObject("map", map);
		view.addObject("usePostCountById", usePostCountById);
		view.setViewName("/essayInfo.jsp");
		return view;
	}
	
}
