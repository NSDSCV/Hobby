package com.hobby.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.pojo.FindThemeCount;
import com.hobby.pojo.Post;
import com.hobby.pojo.Theme;
import com.hobby.service.IndexService;
import com.hobby.service.PostService;
import com.hobby.service.ThemeService;

@Controller
public class IndexController {

	@Resource
	private ThemeService ThemeServiceImpl;
	@Resource
	private PostService PostServiceImpl;
	@Resource
	private IndexService IndexServiceImpl;

	// 首页显示
	@RequestMapping("indexShow.do")
	public ModelAndView index(HttpServletRequest req) {
		List<Theme> themes = ThemeServiceImpl.findAllTheme();
		List<Post> postTime = PostServiceImpl.findAllPostBytimeDown();
		List<Post> postHot = PostServiceImpl.findAllPostByHotDown();
		List<FindThemeCount> map = IndexServiceImpl.findThemeCount();
		ModelAndView view = new ModelAndView();
		view.addObject("themes", themes);
		view.addObject("postTime", postTime);
		view.addObject("postHot", postHot);
		view.addObject("map", map);
		view.setViewName("/index.jsp");
		return view;
	}
}
