package com.maple.community.model;

import org.apache.ibatis.type.Alias;

@Alias("subject_board")
public class Subject_board {
	private String subject;
	private String subnum;

	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSubnum() {
		return subnum;
	}
	public void setSubnum(String subnum) {
		this.subnum = subnum;
	}
}
