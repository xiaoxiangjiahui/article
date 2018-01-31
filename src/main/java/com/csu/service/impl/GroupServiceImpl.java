package com.csu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.entity.Group;
import com.csu.entity.GroupAdmin;
import com.csu.entity.GroupAndCount;
import com.csu.entity.GroupUser;
import com.csu.mapper.GroupAdminMapper;
import com.csu.mapper.GroupMapper;
import com.csu.mapper.GroupUserMapper;
import com.csu.service.GroupService;

@Service
public class GroupServiceImpl implements GroupService{
	@Autowired
	private GroupMapper groupMapper;
	@Autowired
	private GroupUserMapper groupUserMapper;
	@Autowired
	private GroupAdminMapper groupAdminMapper;
	
	public void newGroup(String groupName,String account){
		//新建组
		Group group = new Group();
		group.setGname(groupName);
		group.setAccount(account);
		//至少有一个成员，即是这个组的创始人
		groupMapper.add(group);
		int groupid = group.getGroupid();
		GroupUser groupUser = new GroupUser();
		groupUser.setAccount(account);
		groupUser.setGroupid(groupid);
		groupUserMapper.add(groupUser);
		//这个组的创始人默认为这个组的管理员
//		GroupAdmin groupAdmin = new GroupAdmin();
//		groupAdmin.setGroupId(group.getGroupId());
//		groupAdmin.setUserId(account);
//		groupAdmin.setAdminFlag(2);//普通管理员
//		groupAdminMapper.add(groupAdmin);
	}
	
	public List<Group> listGroup(String account){
		return groupMapper.getByUser(account);
		/*List<GroupUser> groupUsers = new ArrayList<GroupUser>();
		groupUsers = groupUserMapper.listGroup(account);
		List<Group> groups = new ArrayList<Group>();
		Group group = new Group();
		while(!groupUsers.isEmpty()){
			
				group.setGroupId(groupUsers.get(0).getGroupId());
				group.setGroupName(groupMapper.getById(groupUsers.get(0).getGroupId()).getGroupName());
				groups.add(group);
				//groupUsers.remove(0);
						
		}
		return groups;*/
	}
	
	public Group getGroup(int groupId){
		return groupMapper.getById(groupId);
	}
	
	public List<Group> listAllGroups(){
		return groupMapper.list();
	}

	@Override
	public List<Group> userGroup(Integer[] groupids) {
		// TODO Auto-generated method stub
		return groupMapper.userGroup(groupids);
	}

	@Override
	public int countGroupMembers(int groupid) {
		// TODO Auto-generated method stub
		return groupMapper.count(groupid);
	}

	@Override
	public GroupAndCount getGroupManeger(int groupid) {
		// TODO Auto-generated method stub
		return groupMapper.getGroupManeger(groupid);
	}

	@Override
	public void updateGroup(Group group) {
		// TODO Auto-generated method stub
		groupMapper.update(group);
	}
	
}
