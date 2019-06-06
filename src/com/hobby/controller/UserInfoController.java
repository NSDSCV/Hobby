package com.hobby.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hobby.Utils.CommonsUtil;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;
import com.hobby.pojo.Replycomment;
import com.hobby.pojo.User;
import com.hobby.service.ReplycommentService;
import com.hobby.service.UserInfoService;

@Controller
public class UserInfoController {

	@Resource
	private UserInfoService userInfoServiceImpl;
	@Resource
	private ReplycommentService replycommentServiceImpl;
	
	//加载个人主页
	@RequestMapping("showUserInfo.do")
	public ModelAndView showUserInfo(HttpServletRequest req) {
		
		
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		List<Post> findAllPost = userInfoServiceImpl.findAllPost(user.getUsername());
		List<Replycomment> replycomment = replycommentServiceImpl.findAll();
		List<Reply> list = new ArrayList<Reply>();
		for (Post post : findAllPost) {
			List<Reply> list1 = userInfoServiceImpl.findAllReply(post.getId());
			list.addAll(list1);
		}
		ModelAndView view = new ModelAndView();
		view.addObject("user", user);
		view.addObject("findAllPost", findAllPost);
		view.addObject("list", list);
		view.addObject("replycomment", replycomment);
		view.setViewName("/userInfo.jsp");
		return view;
	}

	//修改头像
	@RequestMapping("editUserImages.do")
	public ModelAndView editUserImages(HttpServletRequest req, MultipartFile images) throws IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		List<Post> findAllPost = userInfoServiceImpl.findAllPost(user.getUsername());
		List<Reply> list = new ArrayList<Reply>();
		for (Post post : findAllPost) {
			List<Reply> list1 = userInfoServiceImpl.findAllReply(post.getId());
			list.addAll(list1);
		}
		// 判断是否上传了图片
		if (images.isEmpty() == false) {
			String filename = images.getOriginalFilename();
			String suffix = filename.substring(filename.lastIndexOf("."));
			if (suffix.equalsIgnoreCase(".png") || suffix.equalsIgnoreCase(".jpg")
					|| suffix.equalsIgnoreCase(".jpeg")) {
				String imagesUUID = CommonsUtil.getUUID();
				// 处理头像名字和路径
				String imageName = imagesUUID + suffix;
				String filePath = req.getSession().getServletContext().getRealPath("userPicture") + "/" + imageName;
				// 保存头像到服务器
				FileUtils.copyInputStreamToFile(images.getInputStream(), new File(filePath));
				userInfoServiceImpl.editImages("userPicture/" + imageName, user.getEmail());
				user.setImages("userPicture/" + imageName);
			}
		}
		ModelAndView view = new ModelAndView();
		view.addObject("user", user);
		view.addObject("findAllPost", findAllPost);
		view.addObject("list", list);
		view.setViewName("/userInfo.jsp");
		return view;
	}
	//显示修改密码界面
	@RequestMapping("editPassword.do")
	public ModelAndView editPassword(HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView view = new ModelAndView();
		view.addObject("user", user);
		view.setViewName("/editpassword.jsp");
		return view;
	}
	
	//修改密码
	@RequestMapping("editNewPassword.do")
	public ModelAndView editNewPassword(String password,HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		userInfoServiceImpl.editPasswd(password, user.getEmail());
		ModelAndView view = new ModelAndView();
		view.setViewName("/successEditPasswd.jsp");
		return view;
	}
}
