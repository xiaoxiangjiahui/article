package com.csu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.csu.entity.User;

import com.csu.mapper.UserMapper;
import com.csu.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	
	public List<User> listAllUsers(){
		return userMapper.list();
	}
	public boolean checkUser(String account,String userPassword){
		User us = userMapper.get(account);
		//System.out.println(us==null || !userPassword.equals(us.getPasswd()));
		if(us==null || !userPassword.equals(us.getPasswd())){
			return false;
		}else{
			System.out.println(userMapper.get(account).getPasswd());//输出密码用于测试
			return true;
		}
	}
	
	
	public void updateUser(User user){
		userMapper.update(user);
	}

	@Override
	public List<String> searchUserName(String userName) {
		// TODO Auto-generated method stub
		List<User> users = userMapper.getByName(userName);
		List<String> userIds = new ArrayList<String>();
		while(!users.isEmpty()){
			userIds.add(users.get(0).getAccount());
			users.remove(0);
		}
		return userIds;
	}
	@Override
	public boolean newUser(User user) {
		// TODO Auto-generated method stub
		if(userMapper.get(user.getAccount())!=null)
			return false;
		else {
			userMapper.add(user);
			return true;
		}
		
	}
	@Override
	public String getUserName(String account) {
		// TODO Auto-generated method stub
		User user = userMapper.get(account);
		return user.getUsername();
	}
	@Override
	public User getUSer(String account) {
		// TODO Auto-generated method stub
		User user = userMapper.get(account);
		return user;
	}
	@Override
	public Integer[] getGroupIds(String account) {
		// TODO Auto-generated method stub
		return userMapper.getGroupIds(account);
	}
	@Override
	public List<User> getUserBygroupid(int groupId) {
		// TODO Auto-generated method stub
		return userMapper.getByGroupId(groupId);
	}
	@Override
	public void addUserToGroup(int groupId,String account) {
		// TODO Auto-generated method stub
		userMapper.addUserToGroup(groupId, account);
	}
	@Override
	public void deleteUserFromGroup(int groupid,String account) {
		// TODO Auto-generated method stub
		userMapper.deleteUserFromGroup(groupid,account);
	}
	@Override
	public void updatePasswd(String passwd,String account) {
		// TODO Auto-generated method stub
		userMapper.updatePasswd(passwd,account);
	}

}