package com.hobby.controller;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.hobby.pojo.Post;
import com.hobby.pojo.User;
import com.hobby.service.EssayInfoService;
import com.hobby.service.UserInfoService;
import com.hobby.service.UserService;

@Controller
public class OtherUserController {

	@Resource
	private UserInfoService userInfoServiceImpl;
	@Resource
	private UserService userServiceImpl;
	@Resource
	private EssayInfoService essayInfoServiceImpl;
	
	@RequestMapping("showOtherUserInfo.do")
	public ModelAndView showUserInfo(String email) {
		User user = userServiceImpl.selByemail(email);
		List<Post> findAllOtherPost = userInfoServiceImpl.findAllPost(user.getUsername());
		ModelAndView view = new ModelAndView();
		view.addObject("Otheruser", user);
		view.addObject("findAllOtherPost", findAllOtherPost);
		view.setViewName("/otherInfo.jsp");
		return view;
	}

}
