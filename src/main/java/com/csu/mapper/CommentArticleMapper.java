package com.csu.mapper;

import java.util.List;

import com.csu.entity.CommentArticle;

public interface CommentArticleMapper {
	public void add(CommentArticle commentArticle);
	public void delete(int articleId);
	public CommentArticle get(int commentId);
	public List<CommentArticle> list(int articleId);
	
	public List<CommentArticle> getByToUser(String account);
	
	public List<CommentArticle> selectByPid(int pid);
}
