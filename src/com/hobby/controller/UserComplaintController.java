package com.hobby.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hobby.Utils.CommonsUtil;
import com.hobby.pojo.ComplaintComment;
import com.hobby.pojo.ComplaintPost;
import com.hobby.pojo.Post;
import com.hobby.pojo.Reply;
import com.hobby.pojo.User;
import com.hobby.service.PostService;
import com.hobby.service.ReplyService;
import com.hobby.service.UserComplaintService;
import com.hobby.service.UserService;

@Controller
public class UserComplaintController {

	@Resource
	private PostService postServiceImpl;
	@Resource
	private UserService userServiceImpl;
	@Resource
	private UserComplaintService userComplaintServiceImpl;
	@Resource
	private ReplyService replyServiceImpl;

	// 前台 用户举报帖子
	@RequestMapping("userComplaintPost.do")
	public String complaintPost(String pid, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Post post = postServiceImpl.selById(pid);
		User bename = userServiceImpl.selByemail(post.getUid().getEmail());
		ComplaintPost complaintPost = new ComplaintPost();// 创建投诉帖子
		complaintPost.setId(CommonsUtil.getUUID());
		complaintPost.setPid(post);
		complaintPost.setName(user);
		complaintPost.setBename(bename);
		String result = userComplaintServiceImpl.addComplaintPost(complaintPost);
		req.setAttribute("id", pid);
		if (result == "成功") {
			return "successComplaint.jsp";
		} else {
			return "failComplaint.jsp";
		}
	}

	// 前台 用户举报评论
	@RequestMapping("userComplaintComment.do")
	public String complaintComment(String rid, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Reply reply = replyServiceImpl.selById(rid);
		User bename = userServiceImpl.selByemail(reply.getUid().getEmail());
		ComplaintComment comment = new ComplaintComment();
		comment.setBename(bename);
		comment.setId(CommonsUtil.getUUID());
		comment.setName(user);
		comment.setPid(reply.getPid());
		comment.setRid(reply);
		String result = userComplaintServiceImpl.addComplaintComment(comment);
		req.setAttribute("id", reply.getPid().getId());
		if (result == "成功") {
			return "successComplaint.jsp";
		} else {
			return "failComplaint.jsp";
		}
	}

}
