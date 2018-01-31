package com.csu.entity;

import java.sql.Timestamp;

public class GroupAndCount {
	private String account;
	private String username;
	private int groupId;
	private String gname;
	private int count;
	private String groupCreater;
	private Timestamp createtime;
	
	
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getGroupId() {
		return groupId;
	}
	public int getCount() {
		return count;
	}
	public String getGroupCreater() {
		return groupCreater;
	}
	public void setGroupCreater(String groupCreater) {
		this.groupCreater = groupCreater;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
}
