package com.hobby.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.hobby.pojo.User;
import com.hobby.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	//后台操作
	@Resource
	private UserService userServiceImpl;
	
	@RequestMapping("findAlluser")
	public ModelAndView findAlluser() {
		List<User> findAllUser = userServiceImpl.findAllUser();
		ModelAndView view = new ModelAndView();
		view.addObject("findAllUser",findAllUser);
		view.setViewName("../admin/user.jsp");
		return view;
	}
	@RequestMapping("editUser")
	public String editUser(User user) {
		return userServiceImpl.editUser(user);
	}
	
}