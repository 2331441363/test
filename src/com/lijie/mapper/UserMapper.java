package com.lijie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import com.lijie.entity.Users;

@Component
public interface UserMapper {
	/**
	 * 查询所有用户
	 */
	List<Users> selectByUsers();
	
	
	/**
	 * 新增用户
	 * @param user 用户对象
	 * @return 结果行数
	 */
	int insertByUsers(Users user);
	
}
