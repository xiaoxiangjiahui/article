package com.csu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.csu.service.MailSenderService;

@Service
public class MailSenderServiceImpl implements MailSenderService{
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	SimpleMailMessage mail;

	@Override
	public void sendEmail(String receiver,String contentText) {
		// TODO Auto-generated method stub
		mail.setTo(receiver);
		mail.setSubject("Article Recommend");
		mail.setText(contentText);
		mailSender.send(mail);
	}

}
