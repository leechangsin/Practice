package com.maple.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.maple.community.model.MessageModel;
import com.maple.community.model.SubjectModel;
import com.maple.community.model.Subject_board;

@Repository
public class SubjectDaoImpl implements SubjectDao{
	private static final String NAMESPACE = "MemberMapper.";

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertCourse(SubjectModel model) {
		sqlSession.insert(NAMESPACE+"insertCourse", model);
		
	}

	@Override
	public List<Subject_board> selectSubject(String id) {
		return sqlSession.selectList(NAMESPACE+"selectSubject", id);
	}

	@Override
	public void insertMessage(MessageModel model) {
		sqlSession.insert(NAMESPACE+"insertMessage", model);
	}

	@Override
	public List<MessageModel> selectMessage(String id) {
		return sqlSession.selectList(NAMESPACE+"selectMessage", id);
	}

	@Override
	public String selectMessageId(String id) {
		return sqlSession.selectOne(NAMESPACE+"selectMessageId", id);
	}

}
