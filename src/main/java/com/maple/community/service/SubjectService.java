package com.maple.community.service;

import java.util.List;

import com.maple.community.model.MessageModel;
import com.maple.community.model.SubjectModel;
import com.maple.community.model.Subject_board;

public interface SubjectService {
	public void insertCourse(SubjectModel model);
	public List<Subject_board> selectSubject(String id);
	public void insertMessage(MessageModel model);
	public List<MessageModel> selectMessage(String id);
	public String selectMessageId(String id);
}
