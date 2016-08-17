package com.maple.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.maple.community.model.BoardModel;
import com.maple.community.model.Subject_Professor;

@Repository
public class BoardDao {
	
	private static final String NAMESPACE ="MemberMapper.";
			
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardModel> selectBoard(int subnum){
		return sqlSession.selectList(NAMESPACE+"selectBoard",subnum);
	}
	
	//게시판에 뿌려줄 lecture 정보
	public Subject_Professor selectlecture(int subnum){
		return sqlSession.selectOne(NAMESPACE+"selectlecture",subnum);
	}
	
	//게시판 글 등록
	public void insertBoard(BoardModel model){
		sqlSession.insert(NAMESPACE+"insertBoard", model);
	}
	
	

}
