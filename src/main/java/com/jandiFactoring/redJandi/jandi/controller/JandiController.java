package com.jandiFactoring.redJandi.jandi.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
import com.jandiFactoring.redJandi.jandi.model.service.JandiService;
import com.jandiFactoring.redJandi.member.model.dto.MemberDTO;

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
	public void jandiProfile(Model model, HttpSession session) {
		JandiDTO jandi = new JandiDTO();
		jandi.setEmail(((MemberDTO) session.getAttribute("loginMember")).getEmail());
		
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
	@ResponseBody
	public JandiDTO modifyJandiProfile(JandiDTO jandiDTO, MultipartFile profileImage) throws Exception {
		
		System.out.println("modifyProfile Jandi: " + jandiDTO);
		String originFilePath = jandiDTO.getProfile_path();
		
//		FileController fileWrapper = new FileController();
//		String savedName = fileWrapper.uploadSingleFile(profileImage, "/uploadFiles/profile");
//		jandiDTO.setProfile_path(savedName);
//		
//		if(!jandiService.modifyProfile(jandiDTO)) {
//			jandiDTO.setProfile_path(originFilePath);
//		}
		
		return jandiDTO;
	}
	
	@PostMapping("careerAndIntro")
	@ResponseBody
	public String modifyJandiCareerAndIntro(JandiDTO jandiDTO) {
		
		if(!jandiService.modifyJandiCareerAndIntro(jandiDTO)) {
			return "저장에 실패했습니다.";
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String lastSaveDate =  dateFormat.format(new Date(System.currentTimeMillis()));
		
		return lastSaveDate + ", 저장";
	}
	
	
}
