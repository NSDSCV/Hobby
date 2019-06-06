package com.hobby.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.pojo.ComplaintComment;
import com.hobby.service.ComplaintCommentService;

@Controller
@RequestMapping("complaintComment")
public class ComplaintCommentController {
	//后台操作
	@Resource
	private ComplaintCommentService complaintCommentServiceImpl;

	@RequestMapping("findAllComplaint")
	public ModelAndView findAllComplaint() {
		List<ComplaintComment> Commlist = complaintCommentServiceImpl.findAllComplaint();
		ModelAndView view = new ModelAndView();
		view.addObject("Commlist", Commlist);
		view.setViewName("../admin/complaintReply.jsp");
		return view;
	}

	@RequestMapping("dealbeNameSuccess")
	public int dealBeNameSuccess(String id) {
		return complaintCommentServiceImpl.dealBeNameSuccess(id);
	}

	@RequestMapping("dealbeNameFail")
	public int dealBeNameFail(String id) {
		return complaintCommentServiceImpl.dealBeNameFail(id);
	}
}