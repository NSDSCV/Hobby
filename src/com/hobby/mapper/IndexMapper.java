package com.hobby.mapper;

import java.util.List;

import com.hobby.pojo.FindThemeCount;

public interface IndexMapper {

	//加载首页主题的帖子数（使用分组GROUP BY查询）
	public List<FindThemeCount> findThemeCount();
	//根据id查询帖子数
	public FindThemeCount findThemeCountById(int id);
	
}
