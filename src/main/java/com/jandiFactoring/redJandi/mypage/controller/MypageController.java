package com.jandiFactoring.redJandi.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;
import com.jandiFactoring.redJandi.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
@SessionAttributes("loginMember")
public class MypageController {

	private final MypageService mypageService;
	
	@Autowired
	public MypageController(MypageService mypageService) {
		this.mypageService = mypageService;
	}
	
	@GetMapping("mypagemain")
	public String mypagemain(HttpSession session, Model model) {
		
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
		Map<String, String> map = new HashMap<>();
		map.put("email", member.getEmail());
		
		MemberDTO myInfo = mypageService.myInfo();
		System.out.println("myInfo : "  + myInfo );
		
		model.addAttribute("myInfo", myInfo);
		
		return "mypage/mypagemain";
	}
	
/*	@GetMapping("finishClass")
	public String finishClass() {
		
		return "mypage/finishClass";
	} */
}
