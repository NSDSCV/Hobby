package com.hobby.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class LoginController {
	//后台操作
	@RequestMapping("/name")
	public ModelAndView name() {
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		ModelAndView view = new ModelAndView();
		view.setViewName("../admin/index.jsp");
		view.addObject("adminName", name);
		view.addObject("loginFlag", 2);
		return view;
	}
}
