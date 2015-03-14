package com.cwtree.service;


public interface UserService {

	public boolean userLogin(String username,String password);
	
	public int updatePwd(String username,String password);
	
}
