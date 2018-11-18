package com.siyuruoli.mapper;

import com.siyuruoli.model.Address;
import com.siyuruoli.model.Birthday;
import com.siyuruoli.model.User;
import com.siyuruoli.po.UserPo;
/**
 * 用户
 * @author biao
 *
 */
public interface UserMapper {
    /**
     * 查询用户
     * @param user
     * @return
     */
	User queryUser(User user);
	/**
	 * 查询用户数量
	 * @return
	 */
	int queryCount();
	
	/**
	 * 插入用户
	 * @param userPo
	 */
	void insertUser(UserPo userPo);
	void insertBirthday(UserPo userPo);
	void insertAddress(UserPo userPo);
	
	
}
