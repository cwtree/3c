package com.cwtree.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cwtree.bean.UserInfo;
import com.cwtree.dao.UserDao;
import com.cwtree.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	
	@Override
	public boolean userLogin(String username, String password) {
		// TODO Auto-generated method stub
		UserInfo ui = this.userDao.getUser(username);
		if(ui!=null&&password.equals(ui.getPassword())) 
			return true;
		return false;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public int updatePwd(String username,String password) {
		// TODO Auto-generated method stub
		Map m = new HashMap();
		m.put("username", username);
		m.put("password", password);
		return this.userDao.updatePwd(m);
	}

}
