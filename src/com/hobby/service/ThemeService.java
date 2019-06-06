package com.hobby.service;

import java.util.List;

import com.hobby.pojo.Theme;

public interface ThemeService {
	//查询全部主题
	public List<Theme> findAllTheme();
	//修改主题
	public String editTheme(Theme theme);
		
}
