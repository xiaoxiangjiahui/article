package com.csu.service;

import java.util.List;

import com.csu.entity.Stars;

public interface StarsService {
	public void addStars(Stars stars);
	public void updateStars(Stars stars);
	public List<Stars> getStars(int pid);
	public List<Stars> getList(int pid);
	public Stars getByUser(int pid,String account);
	public void deleteStars(int pid);
}
