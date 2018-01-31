package com.csu.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.entity.CommentUserContent;
import com.csu.entity.CommentArticle;
import com.csu.mapper.CommentArticleMapper;
import com.csu.mapper.CommentUserContentMapper;
import com.csu.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	CommentArticleMapper commentArticleMapper;
	@Autowired
	CommentUserContentMapper commentUserContentMapper;
	
	public List<CommentUserContent> listComments(int articleId){
		List<CommentArticle> commentArticles = commentArticleMapper.list(articleId);
		List<Integer> commentIds = new ArrayList<>();
		/*for(CommentArticle commentArticle : commentArticles)
			commentIds.add(commentArticle.getCommentId());*/
		List<CommentUserContent> commentUserContents = commentUserContentMapper.list(commentIds);
		return commentUserContents;
	}

	@Override
	public void saveComment(CommentArticle commentArticle) {
		commentArticleMapper.add(commentArticle);
	}

	@Override
	public List<CommentArticle> getByToUser(String account) {
		// TODO Auto-generated method stub
		return commentArticleMapper.getByToUser(account);
	}

	@Override
	public void deleteElem(int pid) {
		// TODO Auto-generated method stub
		commentArticleMapper.delete(pid);
	}

	@Override
	public List<CommentArticle> getByPid(int pid) {
		// TODO Auto-generated method stub
		return commentArticleMapper.selectByPid(pid);
	}

}
