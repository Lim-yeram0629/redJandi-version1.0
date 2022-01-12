package com.jandiFactoring.redJandi.jandi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jandiFactoring.redJandi.jandi.model.service.JandiService;

@Controller
@RequestMapping("/jandi/*")
@SessionAttributes("loginMember")
public class JandiController {
	
	private JandiService jandiService;
	
	@Autowired
	public JandiController(JandiService jandiService) {
		this.jandiService = jandiService;
	}
	
	@GetMapping("jandiProfile")
	public void jandiProfile(Model model ) {
		/* MemberDTO loginMember = (MemberDTO) model.getAttribute("loginMember"); */
		/* loginMember.setEmail("ram@gmail.com"); */
		
		model.addAttribute("jandiInfo", jandiService.selectJandiInformation("ram@gmail.com"));
		model.addAttribute("jandiClassList", jandiService.selectJandiClassList("ram@gmail.com"));
	}
	
	
}
