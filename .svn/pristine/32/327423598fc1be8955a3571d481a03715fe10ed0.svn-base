package com.csu.controller;

import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csu.entity.Article;
import com.csu.entity.CommentArticle;
import com.csu.service.ArticleService;
import com.csu.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("personal")
@Controller
public class SharedController {
	 @Autowired
	 ArticleService articleService;
	 @Autowired
	 CommentService commentService;
	 @RequestMapping(value="shared")
	 public String shared(HttpSession httpSession,Model model,@RequestParam(required=true,defaultValue="1") int page,
	            @RequestParam(required=false,defaultValue="10") int pageSize){
		 if(httpSession.getAttribute("account") == null)
				return "redirect:../login";
		 PageHelper.startPage(page,pageSize);
		 String account = httpSession.getAttribute("account").toString();
		 List<CommentArticle> comms = commentService.getByToUser(account);
		 PageInfo<CommentArticle> arts = new PageInfo<>(comms);
		 int totalArticles = (int) new PageInfo<>(comms).getTotal();
		 model.addAttribute("page", arts);
		 model.addAttribute("articles", comms);
		 return "shared";
		 
	 }
}
