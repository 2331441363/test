package com.lijie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lijie.biz.UserBiz;
import com.lijie.entity.Users;

@Controller
public class UserController {
	@Autowired
	private UserBiz biz;
	
	/**
	@RequestMapping("selectByUsers")
	public ModelAndView selectByUsers() {
		ModelAndView modelAndView = new ModelAndView();
		List<Users> list = biz.selectByUser();
		modelAndView.addObject("userList",list);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping("deleteByUsers")
	public String deleteByUsers(String[] str) {
		List<String> listUserId = new ArrayList<String>();
		for (String l : str) {
			System.out.println(l+"===========");
			listUserId.add(l);
		}
		biz.deleteByUser(listUserId);
		return "redirect:selectByUsers.do";
	}
	
	@RequestMapping("insertByUsers")
	public String insertByUsers(Users user) {
		biz.insertByUsers(user);
		return "redirect:selectByUsers.do";
	}
	
	@RequestMapping("updateByUsers")
	public String updateByUsers(Users user) {
		biz.updateByUsers(user);
		return "redirect:selectByUsers.do";
	}
	
	*/
	
	@RequestMapping("selectByUsers")
	public @ResponseBody List<Users> selectByUsers(String page,String rows) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("page", page);
		map.put("rows", rows);
		List<Users> list = biz.selectByUser(map);
		return list;
	}
	
	
	@RequestMapping("deleteByUsers")
	public @ResponseBody String deleteByUsers(@RequestBody List<String> userIdList) {
		System.out.println(userIdList.size()+"==========----------");
		biz.deleteByUser(userIdList);
		return "ok";
	}
	
	@RequestMapping("insertByUsers")
	public @ResponseBody String insertByUsers(Users user) {
		biz.insertByUsers(user);
		return "ok";
	}
	
	@RequestMapping("updateByUsers")
	public @ResponseBody String updateByUsers(Users user) {
		biz.updateByUsers(user);
		return "ok";
	}
	
	
	/**
	 * 
	 * 
	 * <!--  查第二页
		每页十条
		
		11 - 20 
		
		11  ------   > 当前页数-1 * 每页显示数
		<= 当前页数*每页显示数-->
	 */
}
