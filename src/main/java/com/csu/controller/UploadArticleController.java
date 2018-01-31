package com.csu.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.lucene.analysis.it.ItalianAnalyzer;
import org.apache.poi.ss.formula.functions.Replace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.csu.cermine.CermineApp;
import com.csu.crawler.BaiduArticleCrawler;
import com.csu.crawler.CrawlerFactory;
import com.csu.crawler.DOIArticleCrawler;
import com.csu.crawler.DoiUtil;
import com.csu.crawler.TikaUtil;
import com.csu.entity.Article;
import com.csu.entity.ArticlePath;
import com.csu.entity.ArticleUserGroup;
import com.csu.entity.Author;
import com.csu.entity.HeaderInfo;
import com.csu.service.ArticleService;
import com.csu.service.CommentService;
import com.csu.service.ElasticsearchService;
import com.csu.service.GroupUserService;
import com.csu.service.MailSenderService;
import com.csu.service.UserService;
import com.csu.service.impl.XmlProcessServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RequestMapping("personal")
@Controller
public class UploadArticleController {
	@Autowired
	ArticleService articleService;
	@Autowired
	GroupUserService groupUserService;
	@Autowired
	CommentService commentService;
	@Autowired
	ElasticsearchService elasticsearchService;
	@Autowired
	MailSenderService mailSenderService;
	@Autowired
	UserService userService;

	@RequestMapping(value = "nav_uploadfile")
	public String nav_uploadfile(HttpSession httpSession, Model model) {
		if (httpSession.getAttribute("account") == null)
			return "redirect:../login";
		return "nav_uploadfile";
	}

	// 涓婁紶鏂囩尞鍒版湇鍔″櫒
	@RequestMapping(value = "uploadSubmit", method = RequestMethod.POST)
	public @ResponseBody Article uploadSubmit(HttpServletRequest request, HttpSession session) throws Exception {
		String userId = session.getAttribute("account").toString();
		int groupId = (int) session.getAttribute("groupid");
		Article article = new Article();

		/**
		 * 1 鐢╰ika瑙ｆ瀽pdf锛屾嬁鍒癲oi 2
		 * 濡傛灉鏈塪oi銆傞�氳繃doi鍜宒oi瀹樼綉鎷垮埌title锛宎uthors锛宲ublish锛宒ate锛岀敤grobid琛ュ厖鎽樿鍜屼綔鑰呭崟浣嶄俊鎭� 3
		 * 濡傛灉娌℃湁doi锛屾垨鑰呰仈缃戝け璐ワ紝鐩存帴閫氳繃grobid鎷垮ご淇℃伅 4 杩斿洖article瀵硅薄
		 */
		if (request instanceof MultipartHttpServletRequest) {

			List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file_upload");
			// 鍙鐞嗕竴涓枃浠朵笂浼�
			if (!files.isEmpty()) {
				// create random file name
				String name = RandomStringUtils.randomAlphanumeric(10);
				String articleName = name + ".pdf";
				// filePath
				String filePath = "C:\\uploadfile\\";
				String fileFullPath = filePath + articleName;
				// fileFullPath=fileFullPath.replace("\\", "\\\\");
				System.out.println("fileFullPath:" + fileFullPath);
				File newFile = new File(fileFullPath);
				// 灏嗚鍒扮殑鏂囦欢娴佸啓鎸囧畾鏂囦欢
				files.get(0).transferTo(newFile);

				// tika澶勭悊鍚庡緱鍒癉OI
				String doi = DoiUtil.getDoiContentByRegex(TikaUtil.getPDFOriginalText(fileFullPath));
				if (doi != null) {
					System.out.println(">>>>doi:" + doi);
					// 鍒涘缓doi鐖櫕鐖彇淇℃伅
					DOIArticleCrawler articleInfoCrawler = CrawlerFactory.createDOiCralwer(doi);
					articleInfoCrawler.setArticle(article);
					articleInfoCrawler.start();
					article.setDoi(doi);
					System.out.println("1" + JSON.toJSON(article));
				}

				/**
				 * grobid澶勭悊鍒嗕笁绉嶆儏鍐碉紝 绗竴绉嶆槸鏂囩珷鏈塪oi锛実robid琛ュ厖鎽樿鍜屼綔鑰呭崟浣�
				 * 绗簩绉嶆槸娌℃湁doi锛屽垯grobid鎻愬彇title锛屽惎鍔ㄧ埇铏� 绗笁绉嶆槸閫氳繃title鐖笉鍒帮紝鍏ㄩ潬grobid鎻愪緵淇℃伅
				 */

				// GrobidService grobidService = new GrobidServiceImpl();
//				String xmlString = grobidService.grobidProcess(fileFullPath);
//				// xml process
//				XmlProcessServiceImpl xmlProcessServiceImpl = new XmlProcessServiceImpl();
//				xmlProcessServiceImpl.process(xmlString);
//				HeaderInfo headerInfo = xmlProcessServiceImpl.getHeaderInfo();
//				String title = headerInfo.getTitle();
//				List<Author> authors = xmlProcessServiceImpl.getAuthors();
//				String abstracts = headerInfo.getAbstracts();
//				String authorsNames = "";
//				String authorAdresses = "";
//				for (Author author : authors) {
//					if ("".equals(authorsNames)) {
//						authorsNames = authorsNames + author.getName();
//					} else {
//						authorsNames = authorsNames + "," + author.getName();
//					}
//					authorAdresses += author.getAuthorsAdressesString();
//				}

				
				CermineApp cermineApp = new CermineApp();
		        Article tempArticle=cermineApp.getArticle(fileFullPath);

		        String title = tempArticle.getPtitle();
		        String abstracts = tempArticle.getPabstract();
		        String authorsNames = tempArticle.getAuthors();
		        String authorAdresses = tempArticle.getAddr();
				// 閫氳繃鏍囬鍜岀櫨搴﹁ˉ鍏呭ご淇℃伅
				if (doi == null) {
					if (title != null && !"".equals(title)) {
						// 鍒涘缓title鐖櫕鐖彇淇℃伅
						BaiduArticleCrawler articleInfoCrawler = CrawlerFactory.createBaiduCrawler(title);
						articleInfoCrawler.setArticle(article);
						articleInfoCrawler.start();
						System.out.println("2" + JSON.toJSON(article));
					}
				}

				if (article.getPtitle() == null) {
					if (title != null) {
						article.setPtitle(title);
					}
				}

				if (article.getAuthors() == null) {
					if (authorsNames != null) {
						article.setAuthors(authorsNames);
					}
				}
				// 鎽樿鍜屼綔鑰呭崟浣嶇敱grobid濉厖
				if (abstracts != null && !"".equals(abstracts)) {
					article.setPabstract(abstracts);
				}
				if (authorAdresses != null && !"".equals(authorAdresses)) {
					article.setAddr(authorAdresses);
				}
				article.setPath(articleName);
				System.out.println("3" + JSON.toJSON(article));

				// SimpleDateFormat sdFormat = new
				// SimpleDateFormat("yyyy-MM-dd");
				// Timestamp articleDate = (Timestamp) new Date();
				// articleDate = articleDate.replaceAll("-", "");
				// article.setCreateTime(articleDate);
			}
		}
		return article;

		/*
		 * article.setEsId("0"); //瀵筸ysql鏁版嵁搴撹繘琛屽鍔� //t_article
		 * articleService.addArticle(article); int mysqlId = article.getPid();
		 * //t_articlePath ArticlePath articlePath = new ArticlePath();
		 * articlePath.setArticlePath(filePath);
		 * articlePath.setArticleId(mysqlId);
		 * articleService.addArticlePath(articlePath); //t_article_user_group
		 * ArticleUserGroup articleUserGroup =new ArticleUserGroup();
		 * articleUserGroup.setArticleId(mysqlId);
		 * articleUserGroup.setGroupId(groupId);
		 * articleUserGroup.setUserId(userId);
		 * articleService.addArticleUserGroup(articleUserGroup); //瀛樺偍鍒癊S
		 * elasticsearchService.addArticleToES(filePath, mysqlId);
		 * files.remove(0); } }
		 */

		// System.out.println(groupId);
		// Article article = articleService.getArticle(1);
		// System.out.println(article.getDoi());

	}

	@RequestMapping(value = "removeArticle", method = RequestMethod.POST)
	public @ResponseBody Map<String, Boolean> removeArticle(HttpServletRequest request, HttpSession session,
			@RequestParam("path") String path) throws Exception {
		Map<String, Boolean> map = new HashMap<>();
		System.out.println("remove..." + path);
		File file = new File("C:\\uploadfile\\" + path);
		Boolean flag = true;
		if (!file.exists()) {
			flag = false;
		} else {
			file.delete();
		}
		map.put("rel", flag);
		// model.addAttribute("recieve", "recieve");
		return map;
	}

	@RequestMapping(value = "saveArticle", method = RequestMethod.POST)
	public @ResponseBody Boolean saveArticle(@RequestParam("article") String articleStr, HttpSession session)
			throws Exception {
		Article article = JSON.parseObject(articleStr, Article.class);
		String account = session.getAttribute("account").toString();
		article.setAccount(account);
		article.setEsid("0");
		System.out.println(article.getUnique_title());
		if (articleService.getByUnique(article.getUnique_title()).size() == 0) {
			articleService.addArticle(article);
			return true;
		} else {
			List<Article> articles = articleService.getByUnique(article.getUnique_title());
			for(Article SingalArticle : articles)
				if(SingalArticle.getAccount() == account)
					return false;
			article.setPath(articles.get(0).getPath());
			articleService.addArticle(article);
			return true;
		}
	}
}
