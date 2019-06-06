package com.hobby.mapper;

import java.util.List;

import com.hobby.pojo.Theme;

public interface ThemeMapper {

	//查询全部主题
	public List<Theme> findAllTheme();
	//修改主题
	public int editTheme(Theme theme);
	//根据ID查询
	public Theme selById(int id);
}
