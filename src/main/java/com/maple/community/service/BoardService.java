package com.maple.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maple.community.dao.BoardDao;
import com.maple.community.model.BoardModel;
import com.maple.community.model.Subject_Professor;


@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	
	//게시판 불러오기
	public List<BoardModel> selectBoard(int subnum){
		return boardDao.selectBoard(subnum);
	}
	 
	public Subject_Professor selectlecture(int subnum){
		return boardDao.selectlecture(subnum);
	}
	
	//게시판 글 등록
	public void insertBoard(BoardModel model){
		boardDao.insertBoard(model);
	}
}
