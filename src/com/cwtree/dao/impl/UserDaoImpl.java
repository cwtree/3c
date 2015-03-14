package com.cwtree.dao.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cwtree.bean.UserInfo;
import com.cwtree.dao.UserDao;

@Service
public class UserDaoImpl implements UserDao {

	Logger log = Logger.getLogger(UserDaoImpl.class);
	
	@Resource
	private SqlSession sqlSession;
	
	@Override
	public UserInfo getUser(String username) {
		return (UserInfo) this.sqlSession.selectOne("userlogin",username);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public int updatePwd(Map m) {
		return this.sqlSession.update("updatepwd", m);
	}

}
