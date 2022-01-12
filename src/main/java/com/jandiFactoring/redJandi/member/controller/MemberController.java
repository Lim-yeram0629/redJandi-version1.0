package com.jandiFactoring.redJandi.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;
import com.jandiFactoring.redJandi.member.model.service.MemberService;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember", "isjandi"})
public class MemberController {
	
	private final MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	/**
	 * @author 권순표
	 * 이용 약관 조회
	 */
	@GetMapping("userAgreement")
	public String userAgreement() {
		
		return "join/userAgreement";
	}
	
	/**
	 * @author 권순표
	 * 회원가입 폼 조회
	 */
	@GetMapping("join")
	public String join() {

		return "join/join";
	}
	
	/**
	 * @author 권순표
	 * 이메일 중복 체크
	 * @param member 사용자가 입력한 이메일
	 * @param response 이메일 중복 여부
	 */
	@PostMapping("emailDupCheck")
	public void emailDupCheck(HttpServletResponse response, @ModelAttribute MemberDTO member) throws IOException {
		
		System.out.println("중복체크할 이메일 : " + member.getEmail());
		
		boolean isSsackEmailDup = memberService.isSsackEmailDup(member);
		System.out.println("이메일 중복 체크 결과 : " + isSsackEmailDup);
		
		if(isSsackEmailDup) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
		
	}
		

	/**
	 * @author 임예람
	 * 잔디 닉네임 중복 체크
	 * @param member 사용자가 입력한 닉네임
	 * @param boolean 닉네임 중복 여부
	 */
	@GetMapping("jandiNickNameDupCheck")
	public @ResponseBody boolean emailDupCheck(String nickName) throws IOException {
	
		return (memberService.isJandiNickNameDup(nickName) > 0)? true : false;
	}

	

}
