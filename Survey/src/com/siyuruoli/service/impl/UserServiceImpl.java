package com.siyuruoli.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siyuruoli.mapper.UserMapper;
import com.siyuruoli.model.User;
import com.siyuruoli.po.UserPo;
import com.siyuruoli.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Override
	public User queryUser(User user) {
		User u=userMapper.queryUser(user);
		return u;
	}
	@Override
	public int queryCount() {
		
		return userMapper.queryCount();
	}
	@Override
	public void insertUser(UserPo userPo) {
		userMapper.insertUser(userPo);
		userMapper.insertBirthday(userPo);
		userMapper.insertAddress(userPo);
		
	}

}
