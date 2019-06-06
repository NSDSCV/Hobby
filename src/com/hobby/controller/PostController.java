package com.hobby.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.pojo.Post;
import com.hobby.service.PostService;

@Controller
@RequestMapping("post")
public class PostController {
	//后台操作
	@Resource
	private PostService postServiceImpl;

	@RequestMapping("findAllPost")
	public ModelAndView findAllPost() {
		List<Post> list = postServiceImpl.findAllPost();
		ModelAndView view = new ModelAndView();
		view.addObject("list", list);
		view.setViewName("../admin/essay.jsp");
		return view;
	}

	// 删除一个选中的帖子
	@RequestMapping("deleById")
	public void deleById(String id) {
		postServiceImpl.deleById(id);
	}

}
