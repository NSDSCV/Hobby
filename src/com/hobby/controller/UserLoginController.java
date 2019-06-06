package com.hobby.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hobby.pojo.User;
import com.hobby.service.UserLoginService;

@Controller
public class UserLoginController {

	@Resource
	private UserLoginService UserLoginServiceImpl;

	@RequestMapping("userlogin.do")
	public String userlogin(String email, String password, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = UserLoginServiceImpl.userLogin(email, password);
		if (user != null) {
			session.setAttribute("user", user);
			return "/successlogin.jsp";
		} else {
			req.setAttribute("userLoginInfo", "登录失败！");
			return "/login.jsp";
		}
	}

	//退出登录
	@RequestMapping("exituserlogin.do")
	public String exitlogin(HttpServletRequest req) {
		// 完成退出登录操作 （清除在session域中的"user"）
		HttpSession session = req.getSession();
		// 清除session中的user
		session.removeAttribute("user");
		return "/login.jsp";
	}

}
