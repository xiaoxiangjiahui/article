package com.csu.mapper;

import java.util.ArrayList;
import java.util.List;

import com.csu.entity.User;

public interface UserMapper {
	public void add(User user);
	public void delete(String account);
	public User get(String account);
	public Integer[] getGroupIds(String account);
	public void update(User user);
	public void updatePasswd(String passwd,String account);
	public List<User> list();//just for test
	public List<User> getByName(String userName);
	public List<User> getByGroupId(int groupid);
	public void addUserToGroup(int groupid,String account);
	public void deleteUserFromGroup(int groupidm,String account);
}
