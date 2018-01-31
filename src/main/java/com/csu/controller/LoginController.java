package com.csu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.csu.entity.Article;
import com.csu.entity.User;
import com.csu.service.GroupUserService;
import com.csu.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Controller
public class LoginController {
	@Autowired
	UserService userService;
	@Autowired
	GroupUserService groupUserService;
	
	@RequestMapping("login")
	public String login(HttpSession httpSession){
		//个人的文献展示
		if(httpSession.getAttribute("account") == null)
			return "login";
		return "redirect:personal/index";
	}

	@RequestMapping(value="loginSubmit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> loginSubmit(@RequestParam("account")String account,@RequestParam("passwd")String password,
			HttpSession session,Model model){
		Map<String, Boolean> map = new HashMap<>();
		System.out.println(userService.checkUser(account, password));
		if(!userService.checkUser(account, password)){
			model.addAttribute("loginInformation", "对不起，密码或用户名有误");
			map.put("rel", false);
			return map;
		}else{
			User user = userService.getUSer(account);
			session.setAttribute("account", account);
			session.setAttribute("userName",user.getUsername());
			session.setAttribute("role", user.getRole());
			//boolean isSuperAuthority = groupUserService.checkSuperAuthority(account);
			session.setAttribute("groupid", user.getGroupId());
			System.out.println(session.getAttribute("userName"));
			map.put("rel", true);
			return map;	
		}
					
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "login";
	}
}
