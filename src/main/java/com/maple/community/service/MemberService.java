package com.maple.community.service;

import java.util.List;

import com.maple.community.model.FriendModel;
import com.maple.community.model.MemberModel;
import com.maple.community.model.SearchModel;
import com.maple.community.model.Search_FriendModel;
import com.maple.community.model.SubjectModel;

public interface MemberService {
	
	public boolean join(MemberModel model);
	public int selectMemberById(String id);
	public MemberModel login(MemberModel model);
	public void updateMember(MemberModel model);
	public void updateMemberNull(String id);
	public void deleteCourse(String id);
	public List<MemberModel> selectFriend(Search_FriendModel model);
	public void addFriendIng(FriendModel model); 
	public List<MemberModel> fri_list_ready(String id);
	public void deleteFriend(String id);
	public void addFriend(FriendModel model);
	public List<MemberModel> select_fri_list(String id);
	public MemberModel selectName(String id);
}