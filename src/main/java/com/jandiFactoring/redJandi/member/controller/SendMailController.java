package com.jandiFactoring.redJandi.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jandiFactoring.redJandi.member.model.dto.MailDTO;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;
import com.jandiFactoring.redJandi.member.model.service.SendMailService;

@Controller
@RequestMapping("/member/sendMail/*")
public class SendMailController {

	private final SendMailService sendMailService;

	@Autowired
	public SendMailController(SendMailService sendMailService) {
		this.sendMailService = sendMailService;
	}

	/**
	 * @author 권순표
	 * 사용자 이메일로 인증번호 전송
	 * @param member 사용자가 입력한 이메일을 담은 DTO
	 * @param response 전송 성공 여부
	 * @throws IOException 
	 */
	@PostMapping("emailCheck")
	public void sendMail(@ModelAttribute MemberDTO member, HttpServletResponse response) throws IOException {

		MailDTO mailDTO = new MailDTO();
		
        String authNum = SendMailController.authNum();
		mailDTO.setAddress(member.getEmail());
		mailDTO.setTitle("숨은 잔디 인증 번호입니다.");
		mailDTO.setMessage("인증 번호 ["+ authNum +"]");

		/* DB에 예비 회원의 인증번호 등록 */
		if(sendMailService.isInsertCheckNum(authNum)) {

			sendMailService.sendMail(mailDTO);
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}

	// 난수발생 function
	public static String authNum(){
		StringBuffer buffer=new StringBuffer();
		for(int i=0;i<=4;i++){
			int num=(int)(Math.random()*9+1);
			buffer.append(num);
		}
		return buffer.toString();
	}

}
