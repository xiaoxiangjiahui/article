package com.csu.mapper;

import java.util.List;

import com.csu.entity.Stars;

public interface StarsMapper {
	public void add(Stars stars);
	public void update(Stars stars);
	public  List<Stars>  getStars(int pid);
	public List<Stars> get(int pid);
	public Stars haveRecord(int pid,String account);
	public void delete(int pid);
}
