package com.hobby.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.hobby.Utils.CommonsUtil;
import com.hobby.Utils.EmailTool;
import com.hobby.pojo.User;
import com.hobby.service.RegisterService;

@Controller
public class RegisterController {

	@Resource
	private RegisterService RegisterServiceImpl;

	// 校验用户名是否存在
	@RequestMapping("checkUserName.do")
	public void checkUserName(String username, HttpServletRequest req, HttpServletResponse res) {
		// 去掉用户名前面和后面的空格
		username = username.trim();
		boolean isExist = RegisterServiceImpl.checkUserName(username);
		// 加入session 为了判断是否注册
		if (isExist == true) {
			req.getSession().setAttribute("usernameInfo", "该用户名已经存在");
		} else {
			req.getSession().setAttribute("usernameInfo", "该用户名可以使用");
		}
		try {
			res.getWriter().write("{\"isExist\":" + isExist + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 校验邮箱是否存在
	@RequestMapping("checkemailName.do")
	public void checkemailName(String email, HttpServletRequest req, HttpServletResponse res) {
		boolean isExist = RegisterServiceImpl.checkemailName(email);
		if (isExist == true) {
			req.getSession().setAttribute("emailnameInfo", "该邮箱已经注册");
		} else {
			req.getSession().setAttribute("emailnameInfo", "该邮箱可以使用");
		}
		try {
			res.getWriter().write("{\"isExist\":" + isExist + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 激活账户（修改状态码）
	@RequestMapping("active.do")
	public String active(String activecode) {
		int editActiveCode = RegisterServiceImpl.editActiveCode(activecode);
		if (editActiveCode != 0) {
			return "/emailSuccess.jsp";
		} else {
			return "/emailFail.jsp";
		}
	}

	// 注册功能
	@RequestMapping("addUser.do")
	public String addUser(String username, String password, String email, MultipartFile images, HttpServletRequest req)
			throws IOException {
		User user = new User();
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setBirthday(new Date());
		user.setUid(CommonsUtil.getUUID());
		user.setStatus(0);
		String activecode = CommonsUtil.getUUID();
		user.setActivecode(activecode);// 设置邮箱激活码
		// 判断用户名是否存在的跳转
		if ("该用户名已经存在".equals(req.getSession().getAttribute("usernameInfo"))) {
			return "/register.jsp";
		}
		// 判断邮箱是否存在的跳转
		if ("该邮箱已经注册".equals(req.getSession().getAttribute("emailnameInfo"))) {
			return "/register.jsp";
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
				user.setImages("userPicture/" + imageName);
			}
		} else {
			// 没有上传图片的话 就选择默认的
			user.setImages("userPicture/1.png");
		}

		// 注册用户信息
		int i = RegisterServiceImpl.addUser(user);
		// 如果注册成功 就发邮件
		if (i != 0) {
			/* 25端口   String emailMsg = "恭喜你注册成功，请点击下面的链接进行账户激活" + "<a href='http://localhost:9998/Hobby/active.do?activecode="
					+ activecode + "'>" + "http://localhost:9998/Hobby/active.do?activecode=" + activecode + "</a>";
			*/
			String emailMsg = "恭喜你注册成功，请点击下面的链接进行账户激活" + "http://47.100.96.17/Hobby/active.do?activecode=" + activecode;
			//  25端口    MailUtils.sendMail(user.getEmail(), "Hobby社区用户激活", emailMsg);
			EmailTool.sendTextMessage(user.getEmail(), emailMsg, "Hobby社区用户激活");
			return "/successregist.jsp";
		} else {
			return "/failRegist.jsp";
		}
	}

}
