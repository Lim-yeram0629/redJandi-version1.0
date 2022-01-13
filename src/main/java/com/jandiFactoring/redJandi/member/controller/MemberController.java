package com.jandiFactoring.redJandi.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	 */
	@PostMapping("emailDupCheck")
	public @ResponseBody boolean emailDupCheck(@ModelAttribute MemberDTO member) {
		
		System.out.println("중복체크할 이메일 : " + member.getEmail());
		
		return memberService.isSsackEmailDup(member) > 0? true:false;
		
	}
	
	/**
	 * @author 권순표
	 * 인증번호 확인
	 * @param checkNum 사용자가 입력한 인증 번호
	 */
	@PostMapping("compareCheckNum")
	public @ResponseBody boolean compareCheckNum(@RequestParam("checkNum") String checkNum) {
		
		System.out.println("사용자가 입력한 인증 번호 : " + checkNum);
		
		int trueNumber = memberService.selectTrueNumber();
		System.out.println("사용자가 받은 인증 번호 : " + trueNumber);
		
		int enterNumber = Integer.parseInt(checkNum);
		
		return (enterNumber == trueNumber)? true:false;
		
	}
	
	/** 
	 * @author 권순표
	 * 닉네임 중복 체크
	 * @param nickName 사용자가 입력한 닉네임
	 */
	@PostMapping("nickDupCheck")
	public @ResponseBody boolean nickDupCheck(@ModelAttribute MemberDTO member) {
		
		System.out.println("중복 체크할 닉네임 : " + member.getNickName());
		
		return memberService.isSsackNickNameDup(member) > 0? true:false;
	}
	
	/**
	 * @author 권순표
	 * 회원 정보 등록
	 * @param member 사용자가 입력한 정보
	 * @param checkNum 사용자가 입력한 인증 번호
	 * @return 회원가입 성공 여부
	 */
	@PostMapping("registMember")
	public String registMember(@ModelAttribute MemberDTO member, @RequestParam("checkNum") String checkNum) throws Exception {

		System.out.println("회원가입할 회원의 정보 : " + member);
		System.out.println("회원가입할 회원의 인증번호 : " + checkNum);

		/* 비밀번호 암호화 처리 */
		member.setPassword(memberService.encodingPwd(member.getPassword()));

		/* 성공 실패의 처리 */
		if (memberService.isRegistMember(member)) {
			
			/* 인증번호 이력 테이블 업데이트 */
			Map<String, String> checkNumMap = new HashMap<>();
			checkNumMap.put("email", member.getEmail());
			checkNumMap.put("checkNum", checkNum);
			
			if(memberService.isUpdateCheckHis(checkNumMap)) {
				return "redirect:/";
			} else {
				throw new Exception(); // 오류페이지
			}

		} else {
			
			throw new Exception(); // 오류페이지
			
		}
	}
	
	/**
	 * @author 권순표
	 * 로그인 페이지 조회
	 */
	@GetMapping("login")
	public String login() {

		return "login/login";
	}
	
	/**
	 * @author 권순표 
	 * 사용자 로그인
	 * @param member 사용자 입력 이메일과 패스워드를 담은 DTO
	 */
	@RequestMapping(value = "login" , method = RequestMethod.POST , produces="text/plain;charset=UTF-8")
	public @ResponseBody String login(SessionStatus status, @ModelAttribute MemberDTO member, Model model) {
		
		System.out.println("로그인할 이메일 : " + member.getEmail());
	    System.out.println("로그인할 패스워드 : " + member.getPassword());
	    
	    /* 사용자가 입력한 이메일이 존재하는지 확인 */
	    if(!memberService.isExistEmail(member)) {
	    	
	    	return "emailFasle";
	    
	    /* 해당 이메일의 비밀번호와 사용자가 입력한 비밀번호가 일치하는지 확인 */
	    } else if (!memberService.isMatchesPwd(member)) {
	    	
	    	return "pwdFalse";
	    	
	    /* 회원 정보를 조회 후 세션에 담아준다. */	
	    } else {
	    	MemberDTO loginMember = memberService.loginMember(member);
	    	model.addAttribute("loginMember", loginMember);
	    	
	    	/*
	    	 * 로그인 한 회원 잔디 여부 및 블랙리스 관련 로직
	    	 * 임예람
	    	 * */
	    	if(loginMember.getIsJandi() == 'Y') {
	    		model.addAttribute("isjandi", "Y");
	    	}else {
	    		model.addAttribute("isjandi", "N");
	    	}
	    	
//	    	// 블랙리스트 여부가 Y이면
//	    	if(loginMember.getIsBlack() == 'Y') {
//	    		
//	    		// 해당 멤버의 현재 날짜 - 블랙리스트 해제 날짜를 조회하여 해제 까지 남은 일수를 구한다.
//	    		double blackD_day = memberService.selectBlackDDay(loginMember.getEmail());
//	    		if(blackD_day > 0) { // 남은 일수가 0보다 크면 남은 일수를 반환하고 로그인된 세션 정보를 삭제한다.
//	    			System.out.println((int)blackD_day + "일 남음");
//	    			response.getWriter().write("누적 경고로 인해 블랙리스트 조치되었습니다. 로그인 가능까지 " + (int)blackD_day + "일 남았습니다." );
//	    			status.setComplete();
//	    		}else { // 남은 일 수가 0보다 작으면 블랙리스트를 해제하고 로그인을 성공 시킨다.
//	    			if(memberService.modifyBlackStatus(loginMember.getEmail())) {
//	    				System.out.println("블랙리스트 해제 성공");
//	    			}else {
//	    				System.out.println("블랙리스트 해제 실패");
//	    			}
//	    			response.getWriter().write("true");
//	    		}
//	    	}else {
//	    		response.getWriter().write("true");
//	    	}
	    	return "true";
	    }
	}
	
	/**
	 * @author 권순표
	 * 이메일 찾기 폼 조회
	 */
	@GetMapping("findEmail")
	public String findEmail() {
		
		return "join/findEmail";
	}
	
	/**
	 * @author 권순표
	 * 사용자 이메일 찾기
	 * @param member 사용자가 입력한 이름과 핸드폰 번호를 담은 DTO
	 */
	@PostMapping("findEmail")
	public @ResponseBody String findEmail(@ModelAttribute MemberDTO member) {
		
		System.out.println("이메일 조회할 이름 : " + member.getName());
		System.out.println("이메일 조회할 핸드폰 번호 : " + member.getPhone());
	    
	    String findEmail = memberService.findEmail(member);
	    System.out.println("찾아온 이메일 : " + findEmail);
	    
	    if(findEmail != null) {
	    	return findEmail;
	    } else {
	    	return "";
	    }
	}
	
	/**
	 * @author 권순표
	 * 비밀번호 찾기 폼 조회
	 */
	@GetMapping("findPwd")
	public String findPwd() {
		
		return "join/findPwd";
	}
	
	/**
	 * @author 권순표
	 * 비밀번호 찾기 - 사용자의 이메일 존재 여부 확인
	 * @param member 사용자가 입력한 이름과 이메일을 담은 DTO
	 */
	@PostMapping("findPwd")
	public @ResponseBody Boolean findPwd(@ModelAttribute MemberDTO member) {
		
		System.out.println("비밀번호를 조회할 이름 : " + member.getName());
		System.out.println("비밀번호를 조회할 이메일 : " + member.getEmail());
		
		return memberService.isExistPwd(member) > 0? true:false;
	}
	
	/**
	 * @author 권순표
	 * 비밀번호 찾기 - 인증 번호 전송 페이지 조회
	 * @param email 사용자 입력 이메일
	 */
	@PostMapping("findPwdSendMail")
	public ModelAndView findPwdSendMail(@RequestParam("email") String email, ModelAndView mv) {
		
		mv.addObject("email", email);
		mv.setViewName("join/findPwdSendMail");
		
		return mv;
	}
	
	/**
	 * @author 권순표
	 * 비밀번호 찾기 - 사용자 이메일로 전송한 인증번호와 사용자가 입력한 인증번호 일치 확인
	 * @param checkNum 사용자 입력 인증번호
	 * @param member 사용자가 입력한 이메일이 담긴 DTO
	 */
	@PostMapping("comparePwdCheckNum")
	public @ResponseBody Boolean comparePwdCheckNum(@RequestParam("checkNum") String checkNum, @ModelAttribute MemberDTO member) {
		
		System.out.println("인증번호를 찾을 이메일 : " + member.getEmail());
		System.out.println("사용자가 입력한 인증번호 : " + checkNum);
		
		int enterNumber = Integer.parseInt(checkNum);
		
		int trueNumber = memberService.selectPwdTrueNumber(member);
		
	    return (enterNumber == trueNumber)? true:false;
		
	}
	
	/**
	 * @author 권순표
	 * 사용자 비밀번호 찾기 - 비밀번호 수정 페이지 조회
	 * @param email 사용자 입력 이메일
	 */
	@PostMapping("findPwdModify")
	public ModelAndView findPwdModify(@RequestParam("email") String email, ModelAndView mv) {
		
		mv.addObject("email", email);
		mv.setViewName("join/findPwdModify");
		
		return mv;
	}
	
	/**
	 * @author 권순표
	 * 사용자 비밀번호 수정
	 * @param member 사용자 이메일과 수정될 패스워드를 담은 DTO
	 */
	@PostMapping("updatePwd")
	public @ResponseBody Boolean updatePwd(@ModelAttribute MemberDTO member) {
		
		System.out.println("비밀번호를 수정할 이메일 : " + member.getEmail());
		System.out.println("수정될 패스워드 : " + member.getPassword());
		
		/* 비밀번호 암호화 처리 */
		member.setPassword(memberService.encodingPwd(member.getPassword()));
		System.out.println("암호화된 패스워드 : " + member.getPassword());
		
		return memberService.isUpdatePwd(member) > 0? true:false;
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
