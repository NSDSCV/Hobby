package com.hobby.serviceImpl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.hobby.mapper.IndexMapper;
import com.hobby.mapper.PostMapper;
import com.hobby.pojo.FindThemeCount;
import com.hobby.service.IndexService;

@Service  
public class IndexServiceImpl implements IndexService {

	@Resource
	private IndexMapper indexMapper;
	@Resource
	private PostMapper postMapper;
	
	@Override
	public List<FindThemeCount> findThemeCount() {
		return indexMapper.findThemeCount();
	}

	@Override
	public FindThemeCount findThemeCountById(int id) {
		return indexMapper.findThemeCountById(id);
	}

}
