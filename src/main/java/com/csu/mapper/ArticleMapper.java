package com.csu.mapper;

import java.util.List;

import com.csu.entity.Article;

public interface ArticleMapper {
	public void add(Article article);
	public void delete(int articleId);//t_article_user_group
	public Article get(int articleId);
	public List<Article> getByUnique(String unique_title);
	public List<Article> getByGroup(int gid);
	public void update(Article article);
	public List<Article> list(List<Integer> articleIds);
	public List<Article> getArticleByuser(String account);
	public void updateGroup(int groupid,int pid);
	
	public List<Article> searchByTitle(String keyw);
	public List<Article> searchByAttach(String title,String authors,String pabstract,int cid);
	public List<Article> searchByAttachNoCid(String title,String authors,String pabstract);
	
	public void addToGroup(int groupid,int pid,String account);
	public void deleteFromGroup(int groupid,int pid);
	

}
