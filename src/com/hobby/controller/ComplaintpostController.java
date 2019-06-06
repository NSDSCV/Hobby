package com.hobby.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.pojo.ComplaintPost;
import com.hobby.service.ComplaintpostService;

@Controller
@RequestMapping("complaintPost")
public class ComplaintpostController {
	//后台操作
	@Resource
	private ComplaintpostService complaintpostServiceImpl;
	
	@RequestMapping("findAllComplaint")
	public ModelAndView findAllComplaint() {
		List<ComplaintPost> list = complaintpostServiceImpl.findAllComplaint();
		ModelAndView view = new ModelAndView();
		view.addObject("list", list);
		view.setViewName("../admin/complaint.jsp");
		return view;
	}
	@RequestMapping("dealBeNameSuccess")
	public int dealBeNameSuccess(String id) {
		return complaintpostServiceImpl.dealBeNameSuccess(id);
	}
	@RequestMapping("dealBeNameFail")
	public int dealBeNameFail(String id) {
		return complaintpostServiceImpl.dealBeNameFail(id);
	}
}