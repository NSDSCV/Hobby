package com.hobby.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hobby.pojo.Theme;
import com.hobby.service.ThemeService;

@Controller
@RequestMapping("theme")
public class ThemeController {
	//后台操作
	@Resource
	private ThemeService  themeServiceImpl;

	//查询全部主题
	@RequestMapping("findAllTheme")
	public String findAllTheme(HttpServletRequest req, HttpServletResponse res){
		List<Theme> list = themeServiceImpl.findAllTheme();
		req.setAttribute("list", list);
		return "../admin/theme.jsp";
	}
	//修改主题
	@RequestMapping("editTheme")
	public String editTheme(Theme theme) {
		return themeServiceImpl.editTheme(theme);
	}
	
}