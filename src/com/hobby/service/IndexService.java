package com.hobby.service;

import java.util.List;

import com.hobby.pojo.FindThemeCount;

public interface IndexService {

	public List<FindThemeCount> findThemeCount();
	//根据id查询帖子数
		public FindThemeCount findThemeCountById(int id);
}
