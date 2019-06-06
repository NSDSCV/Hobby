package com.hobby.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.IndexMapper;
import com.hobby.mapper.PostMapper;
import com.hobby.mapper.ThemeInfoMapper;
import com.hobby.pojo.FindThemeCount;
import com.hobby.pojo.Post;
import com.hobby.pojo.Theme;
import com.hobby.pojo.page.PageBean;
import com.hobby.service.IndexService;
import com.hobby.service.ThemeInfoService;

@Service
public class ThemeInfoServiceImpl implements ThemeInfoService {

	@Resource
	private ThemeInfoMapper themeInfoMapper;
	@Resource
	private PostMapper postMapper;
	@Resource
	private IndexService indexserviceImpl;
	
	@Override
	public Theme findBtId(int id) {
		return themeInfoMapper.findBtId(id);
	}

	@Override
	public List<Post> findByTime(int id) {
		return themeInfoMapper.findByTime(id);
	}

	@Override
	public List<Post> findByhot(int id) {
		return themeInfoMapper.findByhot(id);
	}
	
	//分页（最新的）
	@Override
	public PageBean findNewPage(int tid,int currentPage, int currentCount) {
		PageBean<Post> pageBean = new PageBean<>();
		pageBean.setCurrentPage(currentPage);//当前页
		pageBean.setCurrentCount(currentCount);//当前页显示的条数
		FindThemeCount count = indexserviceImpl.findThemeCountById(tid);//相关主题的总条数
		pageBean.setTotalCount(count.getCount());
		int totalPage = (int) Math.ceil(1.0*count.getCount()/currentCount);
		pageBean.setTotalPage(totalPage);//总页数
		int index=(currentPage-1)*currentCount;
		List<Post> postList = themeInfoMapper.findNewPostListForPage(tid,index, currentCount);
		pageBean.setPostList(postList);
		return pageBean;
	}
	//分页（最热的）
	@Override
	public PageBean findHotPage(int tid,int currentPage, int currentCount) {
		PageBean<Post> pageBean = new PageBean<>();
		pageBean.setCurrentPage(currentPage);//当前页
		pageBean.setCurrentCount(currentCount);//当前页显示的条数
		FindThemeCount count = indexserviceImpl.findThemeCountById(tid);//相关主题的总条数
		pageBean.setTotalCount(count.getCount());
		int totalPage = (int) Math.ceil(1.0*count.getCount()/currentCount);
		pageBean.setTotalPage(totalPage);//总页数
		int index=(currentPage-1)*currentCount;
		List<Post> postList = themeInfoMapper.findHotPostListForPage(tid,index, currentCount);
		pageBean.setPostList(postList);
		return pageBean;
	}

}