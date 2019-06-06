package com.hobby.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hobby.mapper.ThemeMapper;
import com.hobby.pojo.Theme;
import com.hobby.service.ThemeService;
@Service
public class ThemeServiceImpl implements ThemeService {
	@Resource
	private ThemeMapper themeMapper;
	
	@Override
	public List<Theme> findAllTheme() {
		return themeMapper.findAllTheme();
	}

	@Override
	public String editTheme(Theme theme) {
		int result = themeMapper.editTheme(theme);
		if(result!=0) {
			return "成功";
		}
		return null;
	}

}