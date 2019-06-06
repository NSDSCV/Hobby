package com.hobby.controller;


import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.hobby.service.HomeService;

@Controller
@RequestMapping("home")
public class HomeController {
	//后台操作
	@Resource
	private HomeService HomeServiceImpl;

	@RequestMapping("AllCount")
	public ModelAndView AllUserCount() {
		int userCount = HomeServiceImpl.AllUserCount();
		int postCount = HomeServiceImpl.AllPostCount();
		ModelAndView view = new ModelAndView();
		view.addObject("userCount", userCount);
		view.addObject("postCount", postCount);
		view.setViewName("../admin/home.jsp");
		return view;
	}
}