package com.csu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.entity.Group;
import com.csu.entity.GroupAdmin;
import com.csu.entity.GroupUser;
import com.csu.entity.User;
import com.csu.mapper.GroupAdminMapper;
import com.csu.mapper.GroupMapper;
import com.csu.mapper.GroupUserMapper;
import com.csu.mapper.UserMapper;
import com.csu.service.GroupUserService;
@Service
public class GroupUserServiceImpl implements GroupUserService{
	@Autowired
	GroupUserMapper groupUserMapper;
	@Autowired
	GroupAdminMapper groupAdminMapper;
	@Autowired
	UserMapper userMapper;
	
	public int getPersonalGroupId(String userId){
		GroupUser groupUser = new GroupUser();
		//groupUser.setGroupFlag(3);
		groupUser.setAccount(userId);
		return groupUserMapper.getPersonal(groupUser).getGroupid();	
	}

	@Override
	public List<Integer> getGroupIds(String userId) {
		// TODO Auto-generated method stub
		List<Integer> lIntegers = new ArrayList<Integer>();
		List<GroupUser> groupUsers = groupUserMapper.listGroup(userId);
		while(!groupUsers.isEmpty()){
			lIntegers.add(groupUsers.get(0).getGroupid());
			groupUsers.remove(0);
		}
		return lIntegers;
	}

	@Override
	public void addUserToGroup(String userId, int groupId) {
		// TODO Auto-generated method stub
		GroupUser groupUser = new GroupUser();
		//groupUser.setGroupFlag(2);
		groupUser.setGroupid(groupId);
		groupUser.setAccount(userId);
		groupUserMapper.add(groupUser);
	}

	@Override
	public boolean checkAuthority(String userId, int groupId) {
		// TODO Auto-generated method stub
		boolean flag = false;
		List<GroupAdmin> groupAdmins = groupAdminMapper.listAdmin(groupId);
		for(GroupAdmin groupAdmin : groupAdmins)
			if(userId.equals(groupAdmin.getUserId())){
				flag = true;
				break;
			}			
		return flag;
	}

	@Override
	public boolean checkSuperAuthority(String userId){
		GroupAdmin groupAdmin = new GroupAdmin();
		groupAdmin.setAdminFlag(1);
		groupAdmin.setGroupId(1);
		List<GroupAdmin> superAdmins = groupAdminMapper.listSuperAdmin(groupAdmin);
		boolean flag = false;
		for(GroupAdmin superAdmin:superAdmins)
			if(userId.equals(superAdmin.getGroupId())){
				flag = true;
				break;
			}	
		return flag;
	}

	@Override
	public List<User> getUserFromGroup(int groupId) {
		// TODO Auto-generated method stub		
		List<GroupUser> groupUsers = groupUserMapper.listUser(groupId);
		List<User> users = new ArrayList<User>();
		for(GroupUser groupUser: groupUsers){
			String userId = groupUser.getAccount();
			users.add(userMapper.get(userId));
		}
		return users;
	}

	@Override
	public List<User> getAdminFromGroup(int groupId) {
		// TODO Auto-generated method stub
		List<GroupAdmin> groupAdmins = groupAdminMapper.listAdmin(groupId);
		List<User> admins = new ArrayList<User>();
		for(GroupAdmin groupAdmin : groupAdmins){
			String userId = groupAdmin.getUserId();
			admins.add(userMapper.get(userId));
		}
		return admins;
	}

	@Override
	public List<User> getSuperAdmin() {
		// TODO Auto-generated method stub
		GroupAdmin groupAdmin = new GroupAdmin();
		groupAdmin.setAdminFlag(1);
		groupAdmin.setGroupId(1);
		List<GroupAdmin> groupAdmins = groupAdminMapper.listSuperAdmin(groupAdmin);
		List<User> superAdmins = new ArrayList<User>();
		for(GroupAdmin groupAdmin_1 : groupAdmins){
			String userId = groupAdmin_1.getUserId();
			superAdmins.add(userMapper.get(userId));
		}
		return superAdmins;
	}
	
	public void deleteUser(String userId,int groupId){
		GroupUser groupUser = new GroupUser();
		groupUser.setAccount(userId);
		groupUser.setGroupid(groupId);
		groupUserMapper.delete(groupUser);
	}
	
	public void deleteAdmin(String userId,int groupId){
		GroupAdmin groupAdmin = new GroupAdmin();
		groupAdmin.setAdminFlag(1);
		groupAdmin.setGroupId(groupId);
		groupAdmin.setUserId(userId);
		groupAdminMapper.delete(groupAdmin);
	}

	@Override
	public int countGroupMembers(int groupId) {
		// TODO Auto-generated method stub
		return groupUserMapper.count(groupId)+groupAdminMapper.count(groupId);
	}
	

}

