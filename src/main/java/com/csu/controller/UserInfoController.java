package com.csu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.enterprise.inject.New;
import javax.servlet.http.HttpSession;

import org.apache.lucene.index.MergePolicyWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.csu.entity.Article;
import com.csu.entity.User;
import com.csu.service.UserService;

@RequestMapping("personal")
@Controller
public class UserInfoController {
	@Autowired
	UserService userService;
	//修改用户信息
	@RequestMapping("userinfo")
	public String userinfo (HttpSession session,Model model){
		 if(session.getAttribute("account") == null)
			return "redirect:../login";
		 String account = session.getAttribute("account").toString();
			User user = userService.getUSer(account);
			model.addAttribute("user",user);
			return "userinfo";
	}
	
	@RequestMapping("editUser")
	@ResponseBody
	public Map<String, Boolean> editUser (HttpSession session,@RequestParam("user") String userStr) throws Exception{
		User user = JSON.parseObject(userStr, User.class);
		String account = session.getAttribute("account").toString();
		user.setAccount(account);
		Map<String, Boolean> map = new HashMap<>();
		try {
			userService.updateUser(user);
			map.put("rel", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("rel", false);
		}
		return map;
	}
	
	@RequestMapping("editPasswd")
	@ResponseBody
	public Map<String, Boolean> editPasswd (HttpSession session,@RequestParam("passwd") String passwd) throws Exception{
		 String account = session.getAttribute("account").toString();
		 Map<String, Boolean> map = new HashMap<>();
		 try {
				userService.updatePasswd(passwd,account);
				session.invalidate();
				map.put("rel", true);
			} catch (Exception e) {
				// TODO: handle exception
				map.put("rel", false);
			}
		return map;	
	}
}
