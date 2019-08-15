package com.lijie.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lijie.dao.UserDao;
import com.lijie.entity.Users;
@Component
public class UserBiz {
	/*11*/
	/**
	 * 李杰
	 */
	@Autowired
	private UserDao userDao;
	
	
	public UserDao getUserDao() {
		return userDao;
	}


	/**
	 * ��ѯ�����û�
	 * @return
	 */
	public List<Users> selectByUser(Map<String, String> map){
		List<Users> userList = userDao.selectByUser(map);
		return userList;
	}
	
	/**
	 * ɾ����ѡ�û�
	 * @return
	 */
	public void deleteByUser(List<String> list){
		userDao.deleteByUser(list);
	}
	
	/**
	 * �����û�
	 * @return
	 */
	public void insertByUsers(Users user){
		userDao.insertByUsers(user);
	}
	
	/**
	 * �޸��û�
	 * @return
	 */
	public void updateByUsers(Users user){
		userDao.updateByUsers(user);
	}
	
}
