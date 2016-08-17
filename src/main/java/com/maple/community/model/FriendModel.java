package com.maple.community.model;

import org.apache.ibatis.type.Alias;


@Alias("Friend")
public class FriendModel {
	private String id;
	private String friend;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}

}
