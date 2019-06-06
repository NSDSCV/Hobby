package com.hobby.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.pojo.FindThemeCount;
import com.hobby.pojo.Post;
import com.hobby.pojo.Theme;
import com.hobby.pojo.page.PageBean;
import com.hobby.service.IndexService;
import com.hobby.service.ThemeInfoService;

@Controller
public class ThemeInfoController {

	@Resource
	private ThemeInfoService themeInfoServiceImpl;
	@Resource
	private IndexService IndexServiceImpl;

	@RequestMapping("themeInfo.do")
	public ModelAndView themeInfo(String currentPageNew, String currentPageHot, int id, HttpServletRequest req) {
		// 最新
		String currentPageNewStr = currentPageNew;
		if (currentPageNewStr == null) {
			currentPageNewStr = "1";
		}
		int currentPageNewInt = Integer.parseInt(currentPageNewStr);
		// 认为每页显示10条
		int currentCount = 10;
		// 最新帖子
		PageBean<Post> pageNewBean = themeInfoServiceImpl.findNewPage(id, currentPageNewInt, currentCount);
		req.setAttribute("pageNewBean", pageNewBean);
		
		// 最热
		String currentPageHotStr = currentPageHot;
		if (currentPageHotStr == null) {
			currentPageHotStr = "1";
		}
		int currentPageHotInt = Integer.parseInt(currentPageHotStr);
		// 最热帖子
		PageBean<Post> pageHotBean = themeInfoServiceImpl.findHotPage(id, currentPageHotInt, currentCount);
		req.setAttribute("pageHotBean", pageHotBean);

		Theme theme = themeInfoServiceImpl.findBtId(id);
		FindThemeCount count = IndexServiceImpl.findThemeCountById(id);
		ModelAndView view = new ModelAndView();
		view.addObject("theme", theme);
		view.addObject("count", count);
		view.setViewName("/themeInfo.jsp");
		return view;
	}
}
