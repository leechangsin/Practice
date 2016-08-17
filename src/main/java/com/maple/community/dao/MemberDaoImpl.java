package com.maple.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.maple.community.model.FriendModel;
import com.maple.community.model.MemberModel;
import com.maple.community.model.SearchModel;
import com.maple.community.model.Search_FriendModel;
//DAO(Data Access Object)
//데이터베이스와 연동해서 데이터를 가져오거나 입력수정
//component-scan 자동 자바빈즈 생성(Repository)
//
@Repository
public class MemberDaoImpl implements MemberDao{
	private static final String NAMESPACE = "MemberMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertMember(MemberModel model) {
		sqlSession.insert(NAMESPACE+"insertMember", model);
	}

	@Override
	public int selectMemberById(MemberModel model) {
		return sqlSession.<Integer>selectOne(NAMESPACE+"selectMemberById", model);
	}

	@Override
	public int selectMemberById(String id) {
		return sqlSession.selectOne(NAMESPACE+"selectMemberById",id);
	}

	@Override
	public MemberModel selectMember(MemberModel model) {
		return sqlSession.selectOne(NAMESPACE+"selectMember", model);
	}

	@Override
	public void updateMember(MemberModel model) {
		sqlSession.update(NAMESPACE+"updateMember", model);
	}

	@Override
	public void updateMemberNull(String id) {
		sqlSession.update(NAMESPACE+"updateMemberNull",id);
	}

	@Override
	public void deleteCourse(String id) {
		sqlSession.delete(NAMESPACE+"deleteCourse",id);
	}

	@Override
	public List<MemberModel> selectFriend(Search_FriendModel model) {
		return sqlSession.selectList(NAMESPACE+"selectFriend", model);
	}
	
	@Override
	public List<MemberModel> selectFriendNormajor(Search_FriendModel model) {
		return sqlSession.selectList(NAMESPACE+"selectFriendNormajor", model);
	}

	@Override
	public void addFriendIng(FriendModel model) {
		sqlSession.insert(NAMESPACE+"addFriendIng", model);
	}

	@Override
	public List<MemberModel> selectFriendNosex(Search_FriendModel model) {
		return sqlSession.selectList(NAMESPACE+"selectFriendNosex", model);
	}

	@Override
	public List<MemberModel> selectFriendNo(Search_FriendModel model) {
		return sqlSession.selectList(NAMESPACE+"selectFriendNo", model);
	}

	@Override
	public List<MemberModel> fri_list_ready(String id) {
		return sqlSession.selectList(NAMESPACE+"fri_list_ready", id);
	}

	@Override
	public void deleteFriend(String id) {
		sqlSession.delete(NAMESPACE+"deleteFriend", id);
	}

	@Override
	public void addFriend(FriendModel model) {
		sqlSession.insert(NAMESPACE+"addFriend", model);
	}

	@Override
	public List<MemberModel> select_fri_list(String id) {
		return sqlSession.selectList(NAMESPACE+"select_fri_list", id);
	}

	@Override
	public MemberModel selectName(String id) {
		return sqlSession.selectOne(NAMESPACE+"selectName", id);
	}
}