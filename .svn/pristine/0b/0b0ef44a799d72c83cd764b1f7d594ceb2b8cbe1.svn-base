package com.csu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.entity.Category;
import com.csu.mapper.CategoryMapper;
import com.csu.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryMapper categoryMapper;
	@Override
	public List<Category> getCategory() {
		// TODO Auto-generated method stub
		return categoryMapper.list();
	}

}
