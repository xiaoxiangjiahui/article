package com.csu.mapper;

import java.util.List;

import com.csu.entity.Group;
import com.csu.entity.GroupAndCount;

public interface GroupMapper {
	public void add(Group group);
	public void delete(int groupId);//t_group_user,t_group_admin,t_article_user_group
	public Group getById(int groupId);
	public List<Group> getByUser(String account);
	public List<Group> userGroup(Integer[] groupids);
	public void update(Group group);
	public List<Group> list();
	public int count(int groupid);
	public GroupAndCount getGroupManeger(int groupid);
}
