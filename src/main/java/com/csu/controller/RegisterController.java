package com.csu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.csu.entity.Article;
import com.csu.entity.User;
import com.csu.service.GroupService;
import com.csu.service.UserService;


@Controller
public class RegisterController {
	@Autowired
	private UserService userService;
	@Autowired
	GroupService groupService;
	
	@RequestMapping(value="registerSubmit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> registerSubmit(@RequestParam("user") String userStr,HttpSession session){
		User user = JSON.parseObject(userStr, User.class);
		Map<String, String> map = new HashMap<>();
		if(!userService.newUser(user)){
			map.put("rel", "exist");
			return map;
		}			
		else {
			map.put("rel", "true");
			return map;
		}
	}
	
	@RequestMapping("/register/checkUserId")
	public String checkUserId(HttpServletRequest request,HttpServletResponse response) {
		String userId = request.getParameter("email").toString();
		return "";
	}

}
