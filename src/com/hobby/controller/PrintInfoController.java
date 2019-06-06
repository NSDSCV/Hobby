package com.hobby.controller;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.Utils.CommonsUtil;
import com.hobby.mapper.ThemeMapper;
import com.hobby.pojo.Post;
import com.hobby.pojo.Theme;
import com.hobby.pojo.User;
import com.hobby.service.PrintInfoService;

@Controller
public class PrintInfoController {

	@Resource
	private ThemeMapper themeMapper;
	@Resource
	private PrintInfoService printInfoServiceImpl;
	
	//首页加载发帖信息
	@RequestMapping("printInfo.do")
	public ModelAndView printInfo(int id) {
		List<Theme> list = themeMapper.findAllTheme();
		ModelAndView view = new ModelAndView();
		view.addObject("list", list);
		view.addObject("id", id);
		view.setViewName("printInfo.jsp");
		return view; 
	}
	
	//主题详情加载发帖信息
	@RequestMapping("themePrintInfo.do")
	public ModelAndView themePrintInfo(int id) {
		ModelAndView view = new ModelAndView();
		Theme theme = themeMapper.selById(id);
		view.addObject("theme", theme);
		view.setViewName("themePrintInfo.jsp");
		return view; 
	}
	
	//提交帖子到数据库
	@RequestMapping("printPost.do")
	@ResponseBody
	public String printPost(String content,int id,String title,HttpServletRequest req) {
		content = content.replace("<br />", " ");
		content = content.replace("垃", "我是沙雕！"); 
		content = content.replace("圾", "我是沙雕！"); 
		content = content.replace("垃圾", "我是沙雕！"); 
		content = content.replace("辣鸡", "我是沙雕！"); 
		title = title.replace("垃圾", "我是沙雕！"); 
		title = title.replace("圾", "我是沙雕！"); 
		title = title.replace("垃", "我是沙雕！"); 
		title = title.replace("辣鸡", "我是沙雕！"); 
		HttpSession session = req.getSession();
		Theme selById = themeMapper.selById(id);
		User user = (User) session.getAttribute("user");
		Post post = new Post();
		post.setContent(content);
		post.setId(CommonsUtil.getUUID());
		post.setTid(selById);
		post.setTime(new Date());
		post.setTitle(title);
		post.setUid(user);
		post.setHot(0);
		String insertPost = printInfoServiceImpl.insertPost(post); 
		if(insertPost=="成功") {
			return post.getId();
		}else {
			return "";
		}
	}
	
}