package com.jandiFactoring.redJandi.jandi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
import com.jandiFactoring.redJandi.jandi.model.service.JandiService;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/jandi/*")
@SessionAttributes({"loginMember", "jandiNickName"})
public class JandiController {
	
	private JandiService jandiService;
	
	@Autowired
	public JandiController(JandiService jandiService) {
		this.jandiService = jandiService;
	}
	
	@GetMapping("jandiProfile")
	public void jandiProfile(Model model) {
		JandiDTO jandi = new JandiDTO();
//		jandi.setEmail(((MemberDTO) model.getAttribute("loginMember")).getEmail());
		jandi.setEmail("ram@gmail.com");
		
		JandiDTO jandiInfo = jandiService.selectJandiInformation(jandi);
		jandi.setNickName(jandiInfo.getNickName());
		
		model.addAttribute("jandi", jandi);
		model.addAttribute("jandiInfo", jandiInfo);
		model.addAttribute("jandiClassList", jandiService.selectJandiClassList(jandi));
	}
	
	@PostMapping("nickName")
	public String modifyJandiNickName(JandiDTO jandi, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("modifyMessage", "닉네임 변경에 실패했습니다.");
		
		if(jandiService.modifyJandiNickName(jandi)) {
			rttr.addFlashAttribute("modifyMessage", "닉네임 변경에 성공했습니다.");
		}
		return "redirect:/jandi/jandiProfile";
	}
	
	
}
