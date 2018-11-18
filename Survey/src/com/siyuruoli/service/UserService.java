package com.siyuruoli.service;

import com.siyuruoli.model.User;
import com.siyuruoli.po.UserPo;
/**
 * 用户
 * @author biao
 *
 */
public interface UserService {

	/**
	 * 查询是否有该用户
	 * @param user
	 * @return
	 */
	User queryUser(User user);
	
	/**
	 * 查询有多少用户
	 * @return
	 */
	int queryCount();
	
	/**
	 * 
	 * 注册时插入用户
	 * @param userPo
	 */
	void insertUser(UserPo userPo);
	
}
