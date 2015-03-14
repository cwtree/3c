package com.cwtree.dao;

import java.util.Map;

import com.cwtree.bean.UserInfo;

public interface UserDao {

	public UserInfo getUser(String username);
	
	@SuppressWarnings("rawtypes")
	public int updatePwd(Map m);
	
}
