package com.csu.service;

import java.util.List;

import com.csu.entity.CommentArticle;
import com.csu.entity.CommentUserContent;

public interface CommentService {
	public List<CommentUserContent> listComments(int articleId);
	public void saveComment(CommentArticle commentArticle);
	public List<CommentArticle> getByToUser(String account);
	public void deleteElem(int pid);
	public List<CommentArticle> getByPid(int pid);
}
