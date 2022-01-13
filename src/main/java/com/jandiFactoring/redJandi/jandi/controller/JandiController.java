package com.jandiFactoring.redJandi.jandi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jandiFactoring.redJandi.common.file.FileWrapper;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
import com.jandiFactoring.redJandi.jandi.model.service.JandiService;

@Controller
@RequestMapping("/jandi/*")
@SessionAttributes({"loginMember", "jandi"})
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
	public String modifyJandiNickName(JandiDTO jandiDTO, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("modifyMessage", "닉네임 변경에 실패했습니다.");
		
		if(jandiService.modifyJandiNickName(jandiDTO)) {
			rttr.addFlashAttribute("modifyMessage", "닉네임 변경에 성공했습니다.");
		}
		return "redirect:/jandi/jandiProfile";
	}
	
	@GetMapping("profile")
	public String modifyJandiProfileToDefaultImage(JandiDTO jandiDTO, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("modifyMessage", "프로필 초기화에 실패했습니다.");
		
		if(jandiService.modifyProfile(jandiDTO)) {
			rttr.addFlashAttribute("modifyMessage", "프로필이 초기화 되었습니다."); 
		}
		 
		return "redirect:/jandi/jandiProfile";
	}
	
	@PostMapping("profile")
	public String modifyJandiProfile(JandiDTO jandiDTO, MultipartFile profileImage, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("modifyMessage", "프로필 변경에 실패했습니다.");
		
		FileWrapper fileWrapper = new FileWrapper();
		
		if(jandiService.modifyProfile(jandiDTO)) {
			rttr.addFlashAttribute("modifyMessage", "프로필이 변경 되었습니다."); 
		}
		
		return "redirect:/jandi/jandiProfile";
	}
	
	
}
