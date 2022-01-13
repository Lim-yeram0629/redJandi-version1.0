package com.jandiFactoring.redJandi.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jandiFactoring.redJandi.member.model.dto.MailDTO;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;
import com.jandiFactoring.redJandi.member.model.service.SendMailService;

@Controller
@RequestMapping("/member/sendMail/*")
@SessionAttributes("loginMember")
public class SendMailController {

	private final SendMailService sendMailService;

	@Autowired
	public SendMailController(SendMailService sendMailService) {
		this.sendMailService = sendMailService;
	}

	/**
	 * @author 권순표
	 * 사용자 이메일로 인증번호 전송 (회원가입)
	 * @param member 사용자가 입력한 이메일을 담은 DTO
	 */
	@PostMapping("emailCheck")
	public @ResponseBody boolean SendMail(@ModelAttribute MemberDTO member) {

		MailDTO mailDTO = new MailDTO();
		
        String authNum = SendMailController.authNum();
		mailDTO.setAddress(member.getEmail());
		mailDTO.setTitle("숨은 잔디 인증 번호입니다.");
		mailDTO.setMessage("인증 번호 ["+ authNum +"]");
		
		System.out.println("메일을 보낼 메일 주소 : " + member.getEmail());
		
		/* 사용자의 인증 번호 존재 여부 확인 */
		if(!sendMailService.isExistCheckNum(member)) {
			
			/* 인증번호 없을 경우(회원가입 단일 경우) DB에 예비 회원의 인증번호 등록 */
			if(sendMailService.isInsertCheckNum(authNum)) {
				
				sendMailService.sendMail(mailDTO);
				
				return true;
			} else {
				return false;
			}
		
		} else {
			
			Map<String, String> CheckNumMap = new HashMap<>();
			CheckNumMap.put("checkNum", authNum);
			CheckNumMap.put("email", member.getEmail());
			
			/* 인증번호 있을 경우(비밀번호 찾기 단일 경우) DB에 회원의 인증번호 수정 */
			if(sendMailService.isUpdateCheckNum(CheckNumMap)) {
				
				sendMailService.sendMail(mailDTO);
				
				return true;
			} else {
				return false;
			}
			
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
