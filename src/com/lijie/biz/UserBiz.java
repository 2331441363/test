package com.lijie.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lijie.dao.UserDao;
import com.lijie.entity.Users;
@Component
public class UserBiz {
	
	@Autowired
	private UserDao userDao;
	
	
	public UserDao getUserDao() {
		return userDao;
	}


	/**
	 * 查询所有用户
	 * @return
	 */
	public List<Users> selectByUser(Map<String, String> map){
		List<Users> userList = userDao.selectByUser(map);
		return userList;
	}
	
	/**
	 * 删除所选用户
	 * @return
	 */
	public void deleteByUser(List<String> list){
		userDao.deleteByUser(list);
	}
	
	/**
	 * 新增用户
	 * @return
	 */
	public void insertByUsers(Users user){
		userDao.insertByUsers(user);
	}
	
	/**
	 * 修改用户
	 * @return
	 */
	public void updateByUsers(Users user){
		userDao.updateByUsers(user);
	}
	
}
