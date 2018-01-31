package com.csu.entity;

public class GroupUser {
	private int id;
	private String account;
	private int groupid;
	//private int groupFlag;//0代表私人，1代表公共，2代表正常分组
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	

}
