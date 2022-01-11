package com.jandiFactoring.redJandi.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;
import com.jandiFactoring.redJandi.member.model.service.MemberService;

@Controller
@RequestMapping("/member/sendMail/*")
public class SendMailController {
	
//	private final JavaMailSender mailSender;
//	private final MemberService memberService;
//	
//	@Autowired
//	public SendMailController(JavaMailSender mailSender, MemberService memberService) {
//		this.mailSender = mailSender;
//		this.memberService = memberService;
//	}
//	
//	/**
//	 * @author 권순표
//	 * 사용자 이메일로 인증번호 전송
//	 * @param email 사용자가 입력한 이메일
//	 * @param response 전송 성공 여부
//	 */
//	@PostMapping("emailCheck")
//	public void sendMail(@ModelAttribute MemberDTO member, HttpServletResponse response) {
//
//		String authNum = SendMailController.authNum();
//		String subject = "숨은 잔디 인증 번호입니다.";
//		String content = "인증 번호 ["+ authNum +"]";
//		String from = "tnsvy2004@gmail.com";
//		String to = member.getEmail();
//		
//		System.out.println(to);
//
//		try {
//			MimeMessage mail = mailSender.createMimeMessage();
//			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
//
//			mailHelper.setFrom(from);
//			mailHelper.setTo(to);
//			mailHelper.setSubject(subject);
//			mailHelper.setText(content, true);
//
//			boolean mailCheckInsert = memberService.mailCheckInsert(authNum);
//			if(mailCheckInsert) {
//				/* 이메일 전송 */
//				mailSender.send(mail);
//
//				response.getWriter().write("true");
//			} else {
//				response.getWriter().write("false");
//			}
//
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	
//	// 난수발생 function
//		public static String authNum(){
//			StringBuffer buffer=new StringBuffer();
//			for(int i=0;i<=4;i++){
//				int num=(int)(Math.random()*9+1);
//				buffer.append(num);
//			}
//			return buffer.toString();
//		}

}
