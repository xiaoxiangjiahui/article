package com.csu.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.csu.entity.Article;
import com.csu.entity.ArticlePath;
import com.csu.entity.ArticleUserGroup;
import com.csu.entity.Author;
import com.csu.entity.CommentUserContent;
import com.csu.entity.Group;
import com.csu.entity.GroupAndCount;
import com.csu.entity.HeaderInfo;
import com.csu.entity.User;
import com.csu.service.ArticleService;
import com.csu.service.CommentService;
import com.csu.service.ElasticsearchService;
import com.csu.service.GroupService;
import com.csu.service.GroupUserService;
import com.csu.service.UserService;
import com.csu.service.impl.XmlProcessServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.Field;

@RequestMapping("group")
@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ElasticsearchService elasticsearchService;
	@Autowired
	private GroupUserService groupUserService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("groups")
	public String showGroup(HttpSession session) {
		if(session.getAttribute("account") == null)
			return "redirect:../login";
		return "groups";
	}
	
	@RequestMapping("listGroup")
	public @ResponseBody List<GroupAndCount> listGroup(HttpSession session){
		String account = session.getAttribute("account").toString();
		int userFlag = (int) session.getAttribute("role");
		List<Group> groups = new ArrayList<Group>();
		if(userFlag == 3)
			groups = groupService.listAllGroups();
		else{
			Integer[] groupIds = userService.getGroupIds(account);
			groups = groupService.userGroup(groupIds);
			
		}
		//how many member of this group
		List<GroupAndCount> groupAndCounts = new ArrayList<>();		
		for(Group group:groups) {
			int groupId = group.getGroupid();
			//System.out.println("groupid:"+ groupId);
			GroupAndCount groupAndCount = groupService.getGroupManeger(groupId);
			//System.out.println("groupAndCount:"+groupAndCount);
			int count = groupService.countGroupMembers(groupId);
			//System.out.println("count:"+count);
			groupAndCount.setCount(count+1);
			groupAndCounts.add(groupAndCount);
		}
		return groupAndCounts;
	}
	
	
	@RequestMapping(value="newGroupSubmit",method=RequestMethod.POST)
	public void newGroupSubmit(HttpSession session,@RequestBody @RequestParam("groupName")String newGroupName){
		//一开始一个组至少有一个成员，即是这个组的创始人，而且默认为这个组的管理员
		System.out.println(newGroupName);
		if(newGroupName != null) {
			String account = session.getAttribute("account").toString();
			groupService.newGroup(newGroupName,account);
		}		
	}
	
	//组文献库的主页
	@RequestMapping(value="specificGroup")
	public String specificGroup(Model model,HttpSession session,HttpServletRequest request,@RequestParam int groupId,
			@RequestParam(required=true,defaultValue="1") int page,@RequestParam(required=false,defaultValue="5") int pageSize) {	
		if(session.getAttribute("account") == null)
			return "redirect:../login";
		String userId = session.getAttribute("account").toString();
		String groupName = groupService.getGroup(groupId).getGname();
		model.addAttribute("groupName", groupName);
		model.addAttribute("groupId",  groupId);
		PageHelper.startPage(page,pageSize);
		List<Article> articles = new ArrayList<>();
		articles = articleService.listArticle(groupId);
		PageInfo<Article> arts = new PageInfo<>(articles);
		model.addAttribute("articles", articles);
		//设置inviteMenmber按钮可见属性
		int role = (int) session.getAttribute("role");
		GroupAndCount groupAngCount = groupService.getGroupManeger(groupId);
		String account = groupAngCount.getAccount();
		boolean inviteMemberVisible = false;
		if(account.equals(userId) || role==3)
			inviteMemberVisible = true;
		model.addAttribute("inviteMemberVisible", inviteMemberVisible);
		//show the users and administers
		List<User> users = userService.getUserBygroupid(groupId);
		model.addAttribute("users", users);
		model.addAttribute("manager", groupAngCount);
		boolean deleteUserVisible = false;
		boolean deleteAdminVisible = false;
		if(role==3){
			deleteAdminVisible = true;
			deleteUserVisible = true;
		}			
		if(account.equals(userId))
			deleteUserVisible = true;
		model.addAttribute("deleteAdminVisible", deleteAdminVisible);
		model.addAttribute("deleteUserVisible", deleteUserVisible);
		model.addAttribute("page", arts);
		return "specificGroup";
	}	
	
	//下载文献
	@RequestMapping("downloadFile")
	@ResponseBody
	public Map<String, String> downloadFile(@RequestParam("articleId") int articleId) throws IOException{
		String path = articleService.getArticle(articleId).getPath();
		Map<String, String> map = new HashMap<>();
		if (path != "" || path !=null){
			map.put("path", path);
		}else {
			map.put("path", "0");
		}
		return map;
	}	
	
	//批量上传
	@RequestMapping(value="uploadBatchSubmit", method=RequestMethod.POST)
	public String uploadBatchSubmit(HttpServletRequest request,HttpSession session,int groupId) throws Exception {
		if(request instanceof MultipartHttpServletRequest) {
			List<MultipartFile> files = ((MultipartHttpServletRequest)request).getFiles("file_upload");
			while(!files.isEmpty()) {
				String name = RandomStringUtils.randomAlphanumeric(10);
//				String articleName = name + ".pdf";
//				String filePath = request.getServletContext().getRealPath("/pdf") + articleName;//获得上传文献的绝对路径
//				File newFile = new File(filePath);
//				files.get(0).transferTo(newFile);
//				//grobid处理
//				String xmlString = grobidService.grobidProcess(filePath);
//				//xml process
//				XmlProcessServiceImpl xmlProcessServiceImpl = new XmlProcessServiceImpl();
//		        xmlProcessServiceImpl.process(xmlString);
//		        //stored data process
//		        HeaderInfo headerInfo = xmlProcessServiceImpl.getHeaderInfo();
//		        String title = headerInfo.getTitle();
//		        List<Author> authors = new ArrayList<>();
//		        authors = xmlProcessServiceImpl.getAuthors();
//		        String abstracts = headerInfo.getAbstracts();
//		        String authorName = "";
//		        String authorInstitude = "";
//		        for(Author author : authors) {
//		        	authorName = author.getName()+","+authorName;
//		        	authorInstitude =authorInstitude+"," +author.getAuthorsAdressesString();
//		        }
//		        SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
//		        Timestamp articleDate = (Timestamp) new Date();
//		        //articleDate = articleDate.replaceAll("-", "");
//		        Article article = new Article();
//		        article.setCreatetime(articleDate);
//		        article.setPtitle("unknown");
//		        article.setAddr("unknown");
//		        article.setAuthors("unknown");
//		        article.setPabstract("unknow");
//		        if(!(authorInstitude==null))
//		        	article.setAddr(authorInstitude);      	
//		        if(!(authorName==null))
//		        	article.setAuthors(authorName);
//		        if(!(title==null))
//		        	article.setPtitle(title);
//		        if(!(title==null))
//		        	article.setPabstract(abstracts);
//		        article.setEsid("0");
//				//对mysql数据库进行增加
//				//t_article
//				articleService.addArticle(article);
//		        int mysqlId = article.getPid();
//			    //t_articlePath
//				ArticlePath articlePath = new ArticlePath();
//				articlePath.setArticlePath(filePath);
//				articlePath.setArticleId(mysqlId);
//				articleService.addArticlePath(articlePath);
//				//t_article_user_group
//				ArticleUserGroup articleUserGroup =new ArticleUserGroup();
//				String userId = session.getAttribute("userId").toString();
//				articleUserGroup.setPid(mysqlId);
//				articleUserGroup.setGroupid(groupId);
//				articleUserGroup.setAccount(userId);
//				articleService.addArticleUserGroup(articleUserGroup);
//				//存储到ES
//				elasticsearchService.addArticleToES(filePath, mysqlId);
				files.remove(0);
			}
		}		
		return "redirect:/group/specificGroup?groupId="+groupId+"";
	}
	
	//es的搜索
	@RequestMapping("searchArticles")
	public String searchArticles(String keywords,Model model,HttpSession session,@RequestParam("groupId") int groupId){
		if(keywords != null) {
			List<Integer> articleIds = elasticsearchService.searchForArticleId(keywords);
			System.out.println(articleIds);
			articleIds = articleService.filterArticleFromgroup(articleIds, groupId);
			System.out.println(articleIds);
			int totalArticles = 0;
			PageHelper.startPage(1,10);
			List<Article> searchArticle = new ArrayList<Article>();
			while(!articleIds.isEmpty()){
				searchArticle.add(articleService.getArticle(articleIds.get(0)));
				articleIds.remove(0);
				totalArticles++;
			}
			model.addAttribute("articles",searchArticle);
			model.addAttribute("totalArticles", totalArticles);
			String groupName = groupService.getGroup(groupId).getGname();
			model.addAttribute("groupName", groupName);
			model.addAttribute("groupId",  groupId);
			String userId = session.getAttribute("userId").toString();
			//设置inviteMenmber按钮可见属性
			boolean isSuperAuthority = Boolean.parseBoolean(session.getAttribute("isSuperAuthority").toString());
			boolean isAuthority = groupUserService.checkAuthority(userId, groupId);
			boolean inviteMemberVisible = false;
			if(isAuthority || isSuperAuthority)
				inviteMemberVisible = true;
			model.addAttribute("inviteMemberVisible", inviteMemberVisible);
			//show the users and administers
			List<User> users = groupUserService.getUserFromGroup(groupId);
			List<User> admins = groupUserService.getAdminFromGroup(groupId);
			List<User> superAdmins = groupUserService.getSuperAdmin();
			boolean deleteUserVisible = false;
			boolean deleteAdminVisible = false;
			if(isSuperAuthority){
				deleteAdminVisible = true;
				deleteUserVisible = true;
			}			
			if(isAuthority)
				deleteUserVisible = true;
			model.addAttribute("deleteAdminVisible", deleteAdminVisible);
			model.addAttribute("deleteUserVisible", deleteUserVisible);
			model.addAttribute("users", users);
			model.addAttribute("admins", admins);
			model.addAttribute("superAdmins", superAdmins);
			return "specificGroup";
		}
		return "redirect:/group/specificGroup?groupId="+groupId;
	}
	
	//show the comments about article
	@RequestMapping("showComments")
	public String showComments(int articleId,Model model) {
		List<CommentUserContent> commentUserContents = commentService.listComments(articleId);
		model.addAttribute("commetUserContents", commentUserContents);
		return "redirect:specificGroup";
	}
	
	//write comment
/*	@RequestMapping("commentSubmit")
	public String commentSubmit(CommentUserContent commentUserContent,@RequestParam("articleId")int articleId) {
		commentService.saveComment(commentUserContent, articleId);
		return "redirect:/showComments";
	}*/			
	
	//选择要添加的用户并提交
	@RequestMapping("addUser")
	@ResponseBody
	public Map<String, Boolean> addUser(@RequestParam("groupId") int groupId,@RequestParam("userId[]") String[] userId){
		Map<String, Boolean> map = new HashMap<>();
		for(String uid:userId){
			if(userService.getUSer(uid)!=null)
				userService.addUserToGroup(groupId, uid);
		}
		map.put("rel", true);
		return map;
	}
	
	//show the members of this group
	@RequestMapping("showUsers")
	public void showUsers(@RequestParam("groupId") int groupId,HttpSession session,Model model){
		List<User> users = groupUserService.getUserFromGroup(groupId);
		List<User> admins = groupUserService.getAdminFromGroup(groupId);
		List<User> superAdmins = groupUserService.getSuperAdmin();
		String userId = session.getAttribute("userId").toString();
		boolean isSuperAuthority = Boolean.parseBoolean(session.getAttribute("isSuperAuthority").toString());
		boolean isAuthority = groupUserService.checkAuthority(userId, groupId);
		boolean deleteUserVisible = false;
		boolean deleteAdminVisible = false;
		if(isSuperAuthority){
			deleteAdminVisible = true;
			deleteUserVisible = true;
		}			
		if(isAuthority)
			deleteUserVisible = true;
		model.addAttribute("deleteAdminVisible", deleteAdminVisible);
		model.addAttribute("deleteUserVisible", deleteUserVisible);
		model.addAttribute("users", users);
		model.addAttribute("admins", admins);
		model.addAttribute("superAdmins", superAdmins);
	}
	
	//delete common user in this group
	@RequestMapping(value="deleteUserSubmit")
	public String deleteUserSubmit(@RequestParam("groupId") int groupId,@RequestParam("account") String account){
		userService.deleteUserFromGroup(groupId,account);
		return "redirect:/group/specificGroup?groupId="+groupId;
	}
	
	//delete administer in this group 
	@RequestMapping(value="deleteAdminsubmit")
	public String deleteAdminSubmit(@RequestParam("groupId") int groupId,String userId){
		groupUserService.deleteAdmin(userId, groupId);
		return "redirect:/group/specificGroup?groupId="+groupId;
	}
	
	//delete article
	@RequestMapping(value="deleteArticle",method=RequestMethod.POST)
	public @ResponseBody int deleteArticle(@RequestParam("articleId") int articleId,@RequestParam("groupId") int groupId) {	
		articleService.deleteFromGroup(groupId, articleId);
		return 1;
	}		
	
	//editGroup
	@RequestMapping("editGroup")
	public @ResponseBody Group editGroup(@RequestParam("groupId") int groupId,@RequestParam("gname") String gname) {	
		Group g= new Group();
		g.setGroupid(groupId);
		g.setGname(gname);
		System.out.println();
		groupService.updateGroup(g);
		return groupService.getGroup(groupId);
	}	
	
	@RequestMapping("getGroupName")
	public @ResponseBody Map<String, String> getGroupName(@RequestParam("groupId") int groupId) {	
		Map<String, String> map = new HashMap<>();
		map.put("gname", groupService.getGroup(groupId).getGname());
		return map;
	}

}
