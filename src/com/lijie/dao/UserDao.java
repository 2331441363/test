package com.lijie.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lijie.entity.Users;

/**
 * 持久层
 * @author lijie
 *
 */
@Component
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<Users> selectByUser(Map<String, String> map){
		/*UserMapper mapper = sqlSessionTemplate.getMapper(UserMapper.class);
		List<Users> userList = mapper.selectByUsers();*/
		List<Users> userList = sqlSessionTemplate.selectList("selectByUsers",map);
		return userList;
	}
	
	/**
	 * 删除所选用户
	 * @return
	 */
	public void deleteByUser(List<String> list){
		/*UserMapper mapper = sqlSessionTemplate.getMapper(UserMapper.class);
		List<Users> userList = mapper.selectByUsers();*/
		int row = sqlSessionTemplate.delete("deleteByUsers",list);
	}
	
	/**
	 * 新增用户
	 * @return
	 */
	public void insertByUsers(Users user){
		int row = sqlSessionTemplate.insert("insertByUsers",user);
	}
	
	/**
	 * 修改用户
	 * @return
	 */
	public void updateByUsers(Users user){
		int row = sqlSessionTemplate.update("updateByUsers",user);
	}
	
}
