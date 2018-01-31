package com.csu.service;

import java.util.List;

import com.csu.entity.User;

public interface GroupUserService {
	public int getPersonalGroupId(String userId);
	public List<Integer> getGroupIds(String userId);
	public void addUserToGroup(String userId,int groupId);
	public boolean checkAuthority(String userId,int groupId);
	public boolean checkSuperAuthority(String userId);
	public List<User> getUserFromGroup(int groupId);
	public List<User> getAdminFromGroup(int groupId);
	public List<User> getSuperAdmin();
	public void deleteUser(String userId,int groupId);
	public void deleteAdmin(String userId,int groupId);
	public int countGroupMembers(int groupId);
}
