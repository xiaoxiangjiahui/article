package com.csu.service;

import java.util.ArrayList;
import java.util.List;

import com.csu.entity.User;

public interface UserService {
	public List<User> listAllUsers();//just for test
	public boolean checkUser(String account,String userPasswd);
    public boolean newUser(User user);
	public void updateUser(User user);
	public void updatePasswd(String passwd,String account);
	public List<String> searchUserName(String userName);
	public String getUserName(String account);
	public User getUSer(String account);
	public Integer[] getGroupIds(String account); 
	public List<User> getUserBygroupid(int groupId);
	public void addUserToGroup(int groupId,String account);
	public void deleteUserFromGroup(int groupid,String account);
}
