package com.csu.mapper;

import java.util.List;

import com.csu.entity.GroupUser;

public interface GroupUserMapper {
	public void add(GroupUser groupUser);
	public void delete(GroupUser groupUser);
	public GroupUser getPersonal(GroupUser groupUser);//获取私人组ID
	public List<GroupUser> listUser(int groupId);//列出某个组的用户
	public List<GroupUser> listGroup(String userId);//列出耨个用户的组
	public int count(int groupId);
}
