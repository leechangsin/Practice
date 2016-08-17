package com.maple.community.model;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("search")
public class SearchModel {
	private String sex;
	private String major;
	private List<String> subject;
	private int subnum;
	
	public int getSubnum() {
		return subnum;
	}
	public void setSubnum(int subnum) {
		this.subnum = subnum;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public List<String> getSubject() {
		return subject;
	}
	public void setSubject(List<String> subject) {
		this.subject = subject;
	}
}