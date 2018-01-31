package com.csu.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.http.ResponseEntity;

import com.csu.entity.Article;
import com.csu.entity.ArticlePath;
import com.csu.entity.ArticleUserGroup;

public interface ArticleService {
	public List<Article> listArticle(int groupId);
	public Article getArticle(int articleId);
	public ResponseEntity<byte[]> download(String fileName,File file) throws IOException;
    public ArticlePath getArticlePath(int articleId);
    public void saveArticlePath(ArticlePath articlePathName);
    public void deleteBatchArticles(List<Integer> articleIds);
    public void addArticle(Article article);
    public void addArticleUserGroup(ArticleUserGroup articleUserGroup);
    public void deleteArticle(int articleId);
    public void updateArticle(Article article);
    public int countArticle(int groupId);
    public void addArticlePath(ArticlePath articlePath);
    //public ResponseEntity<byte[]> downloadBatch(int[] articleIds) throws IOException, ServletException;
    public String downloadBatch(int[] articleIds) throws IOException, ServletException;
    public List<Integer> filterArticleFromgroup(List<Integer> articleIds, int groupId);
    
    public List<Article> getArticleByuser(String account);
    public void updateGroup(int groupid,int pid);
    public List<Article> getByUnique(String unique_title);
    
    public List<Article> searchByTitle(String keyw);
	public List<Article> searchByAttach(String title,String authors,String pabstract,int cid);
	public List<Article> searchByAttachNoCid(String title,String authors,String pabstract);
	public void addToGroup(int groupid,int pid,String account);
	public void deleteFromGroup(int groupid,int pid);
	public ArticleUserGroup getArticleGroup(int groupid,int pid);
	
}