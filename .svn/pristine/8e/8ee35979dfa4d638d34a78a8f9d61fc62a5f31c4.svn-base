package com.csu.entity;

public class Page {
	int start = 0;
	int count = 15;
	int last = 0;
	public int getStart(){
		return start;
	}
	public int getCount(){
		return count;
	}
	public int getLast(){
		return last;
	}
	
	public void setStart(int start){
		this.start=start;
	}
	public void setCount(int count){
		this.count=count;
	}
	public void setLast(int last){
		this.last=last;
	}
	
	public void caculateLast(int total){
		if(0 == total % 10)
			last = total - count;
		else 
			last = total - total % 10;
	}

}
