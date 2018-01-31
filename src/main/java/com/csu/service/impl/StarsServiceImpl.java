package com.csu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.entity.Stars;
import com.csu.mapper.StarsMapper;
import com.csu.service.StarsService;

@Service
public class StarsServiceImpl implements StarsService{
	@Autowired
	StarsMapper starMapper;
	@Override
	public void addStars(Stars stars) {
		// TODO Auto-generated method stub
		starMapper.add(stars);
	}

	@Override
	public void updateStars(Stars stars) {
		// TODO Auto-generated method stub
		starMapper.update(stars);
	}

	@Override
	public List<Stars> getStars(int pid) {
		// TODO Auto-generated method stub
		return starMapper.getStars(pid);
	}

	@Override
	public List<Stars> getList(int pid) {
		// TODO Auto-generated method stub
		return starMapper.get(pid);
	}

	@Override
	public Stars getByUser(int pid, String account) {
		// TODO Auto-generated method stub
		return starMapper.haveRecord(pid, account);
	}

	@Override
	public void deleteStars(int pid) {
		// TODO Auto-generated method stub
		starMapper.delete(pid);
	}

}
