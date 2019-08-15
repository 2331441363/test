package com.lijie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import com.lijie.entity.Users;

@Component
public interface UserMapper {
	/**
	 * ��ѯ�����û�
	 */
	List<Users> selectByUsers();
	
	
	/**
	 * �����û�
	 * @param user �û�����
	 * @return �������
	 */
	int insertByUsers(Users user);
	
}
