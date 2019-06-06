package com.hobby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommentEssayController {

	//跳转到评论页面
	@RequestMapping("commentEssay.do")
	public ModelAndView commentEssay(String postId){
		ModelAndView view = new ModelAndView();
		view.addObject("postId", postId);
		view.setViewName("/scanfInfo.jsp");
		return view;
	}
	
}
