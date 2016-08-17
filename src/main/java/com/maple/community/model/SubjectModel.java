package com.maple.community.model;

import java.util.ArrayList;

import org.apache.ibatis.type.Alias;

@Alias("subject")
public class SubjectModel {
	private String subject;
	private String id;
	private ArrayList<Integer> subnum;
	private int subnum_origin;
	

	public int getSubnum_origin() {
		return subnum_origin;
	}
	public void setSubnum_origin(int i) {
		this.subnum_origin = i;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public ArrayList<Integer> getSubnum() {
		return subnum;
	}
	public void setSubnum(ArrayList<Integer> subnum) {
		this.subnum = subnum;
	}
}
