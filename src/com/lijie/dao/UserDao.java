package com.lijie.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lijie.entity.Users;

/**
 * �־ò�
 * @author lijie
 *
 */
@Component
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	public List<Users> selectByUser(Map<String, String> map){
		/*UserMapper mapper = sqlSessionTemplate.getMapper(UserMapper.class);
		List<Users> userList = mapper.selectByUsers();*/
		List<Users> userList = sqlSessionTemplate.selectList("selectByUsers",map);
		return userList;
	}
	
	/**
	 * ɾ����ѡ�û�
	 * @return
	 */
	public void deleteByUser(List<String> list){
		/*UserMapper mapper = sqlSessionTemplate.getMapper(UserMapper.class);
		List<Users> userList = mapper.selectByUsers();*/
		int row = sqlSessionTemplate.delete("deleteByUsers",list);
	}
	
	/**
	 * �����û�
	 * @return
	 */
	public void insertByUsers(Users user){
		int row = sqlSessionTemplate.insert("insertByUsers",user);
	}
	
	/**
	 * �޸��û�
	 * @return
	 */
	public void updateByUsers(Users user){
		int row = sqlSessionTemplate.update("updateByUsers",user);
	}
	
}
