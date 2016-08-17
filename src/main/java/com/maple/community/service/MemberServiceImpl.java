package com.maple.community.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maple.community.dao.MemberDao;
import com.maple.community.model.FriendModel;
import com.maple.community.model.MemberModel;
import com.maple.community.model.SearchModel;
import com.maple.community.model.Search_FriendModel;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberdao;

	@Override
	public boolean join(MemberModel model) { //회원가입
		int result = memberdao.selectMemberById(model.getId());
		
		//같은 아이디가 하나라도 있으면 false, 아니면 회원가입 insert
		if(result >0){ 
			return false;
		} else{
			memberdao.insertMember(model);
		}
		return true;
	}

	@Override
	public int selectMemberById(String id) {
		return memberdao.selectMemberById(id);
	}
	
	//model 객체를 받아, id , passwd에 맞는 엔티티가 존재하는지 확인후 존재하면 반환 
	//null 값이면 로그인 실패
	@Override
	public MemberModel login(MemberModel model) {
		return memberdao.selectMember(model);
	}

	//profile update
	@Override
	public void updateMember(MemberModel model) {
		memberdao.updateMember(model);
	}

	@Override
	public void updateMemberNull(String id) {
		memberdao.updateMemberNull(id);
	}

	@Override
	public void deleteCourse(String id) {
		memberdao.deleteCourse(id);
	}


	@Override
	public List<MemberModel> selectFriend(Search_FriendModel model) {
		if(model.getMajor().equals("NO")){
			if(model.getSex().equals("NO")){
				return memberdao.selectFriendNo(model);
			}
			else{
				return memberdao.selectFriendNormajor(model);
			}
		}
		else if(model.getSex().equals("NO"))
			return memberdao.selectFriendNosex(model);
		else
			return memberdao.selectFriend(model);
	}

	@Override
	public void addFriendIng(FriendModel model) {
		memberdao.addFriendIng(model);
		
	}

	@Override
	public List<MemberModel> fri_list_ready(String id) {
		return memberdao.fri_list_ready(id);
	}

	@Override
	public void deleteFriend(String id) {
		memberdao.deleteFriend(id);
	}

	@Override
	public void addFriend(FriendModel model) {
		memberdao.addFriend(model);
		String temp;
		temp =model.getId();
		model.setId(model.getFriend());
		model.setFriend(temp);
		memberdao.addFriend(model);
	}

	@Override
	public List<MemberModel> select_fri_list(String id) {
		return memberdao.select_fri_list(id);
	}

	@Override
	public MemberModel selectName(String id) {
		return memberdao.selectName(id);
	}
}
