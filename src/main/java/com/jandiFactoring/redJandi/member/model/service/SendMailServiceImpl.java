package com.jandiFactoring.redJandi.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.jandiFactoring.redJandi.member.model.dao.MemberMapper;
import com.jandiFactoring.redJandi.member.model.dto.MailDTO;

@Service
public class SendMailServiceImpl implements SendMailService {
	
	 private JavaMailSender mailSender;
	 private MemberMapper memberMapper;
	 
	 @Autowired
	 public SendMailServiceImpl(JavaMailSender mailSender, MemberMapper memberMapper) {
		 this.mailSender = mailSender;
		 this.memberMapper = memberMapper;
	 }

	@Override
	public void sendMail(MailDTO mail) {
		
		 SimpleMailMessage message = new SimpleMailMessage();
         message.setTo(mail.getAddress());
//	       message.setFrom(""); from 값을 설정하지 않으면 application.yml의 username값이 설정됩니다.
         message.setSubject(mail.getTitle());
         message.setText(mail.getMessage());

         mailSender.send(message);
		
	}

	@Override
	public boolean isInsertCheckNum(String authNum) {
		
		return memberMapper.isInsertCheckNum(authNum) > 0? true:false;
	}

}
