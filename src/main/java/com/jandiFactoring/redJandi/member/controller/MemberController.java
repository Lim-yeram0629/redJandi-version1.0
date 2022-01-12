package com.jandiFactoring.redJandi.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

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
		
		if(memberService.isSsackEmailDup(member)) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	
	/**
	 * @author 권순표
	 * 인증번호 확인
	 * @param response 인증번호 일치 여부
	 * @param checkNum 사용자가 입력한 인증 번호
	 */
	@PostMapping("compareCheckNum")
	public void compareCheckNum(HttpServletResponse response, @RequestParam("checkNum") String checkNum) throws IOException {
		
		System.out.println("사용자가 입력한 인증 번호 : " + checkNum);
		
		int trueNumber = memberService.selectTrueNumber();
		System.out.println("사용자가 받은 인증 번호 : " + trueNumber);
		
		int enterNumber = Integer.parseInt(checkNum);
		
		if(enterNumber == trueNumber) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
		
	}
	
	/** 
	 * @author 권순표
	 * 닉네임 중복 체크
	 * @param response 닉네임 중복 여부
	 * @param nickName 사용자가 입력한 닉네임
	 */
	@PostMapping("nickDupCheck")
	public void nickDupCheck(HttpServletResponse response, @ModelAttribute MemberDTO member) throws IOException {
		
		System.out.println("중복 체크할 닉네임 : " + member.getNickName());
		
		if(memberService.isSsackNickNameDup(member)) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
	}
	
	/**
	 * @author 권순표
	 * 회원 정보 등록
	 * @param member 사용자가 입력한 정보
	 * @param checkNum 사용자가 입력한 인증 번호
	 * @return 회원가입 성공 여부
	 */
	@PostMapping("regist")
	public String registMember(@ModelAttribute MemberDTO member, @RequestParam("checkNum") String checkNum) {

		System.out.println("회원가입할 회원의 정보 : " + member);
		System.out.println("회원가입할 회원의 인증번호 : " + checkNum);

		/* 비밀번호 암호화 처리 */
		member.setPassword(memberService.encodingPwd(member.getPassword()));

		/* 성공 실패의 처리 */
		if (memberService.registMember(member)) {
			
			/* 인증번호 이력 테이블 업데이트 */
			Map<String, String> map = new HashMap<>();
			map.put("email", member.getEmail());
			map.put("checkNum", checkNum);
			
			boolean checkUpdate = memberService.checkUpdate(map);
			
			if(checkUpdate) {
				return "redirect:/";
			} else {
				return "redirect:/"; // 오류페이지
			}

		} else {
			
			return "redirect:/"; // 오류페이지
			
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
