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
	
	/**
	 * 해당 잔기의 정보를 조회하여 페이지를 요청하는 메소드
	 * @author 임예람
	 * @param model
	 * @param session
	 */
	@GetMapping("jandiProfile")
	public void jandiProfile(Model model, HttpSession session) {
		// 세션에 저장할 잔디 DTO 선언 후, 로그인 멤버의 이메일을 저장
		JandiDTO jandi = new JandiDTO();
//		jandi.setEmail(((MemberDTO) session.getAttribute("loginMember")).getEmail());
		jandi.setEmail("ram@gmail.com");
		
		// 잔디 정보 조회하고 세션에 저장할 잔디 DTO에 닉네임 저장
		JandiDTO jandiInfo = jandiService.selectJandiInformation(jandi);
		jandi.setNickName(jandiInfo.getNickName());
		
		model.addAttribute("jandi", jandi);	// 잔디 DTO 세션에 저장
		model.addAttribute("jandiInfo", jandiInfo);	// 조회한 잔디 정보
		model.addAttribute("jandiClassList", jandiService.selectJandiClassList(jandi));	// 잔디의 클래스 썸네일 리스트(3개)
	}
	
	/**
	 * 잔디의 닉네임을 변경하는 메소드
	 * @author 임예람
	 * @param jandiDTO
	 * @param rttr
	 * @return 성공 혹은 실패 리다이렉트 메세지
	 */
	@PostMapping("nickName")
	public String modifyJandiNickName(JandiDTO jandiDTO, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("modifyMessage", "닉네임 변경에 실패했습니다.");
		
		if(jandiService.modifyJandiNickName(jandiDTO)) {
			rttr.addFlashAttribute("modifyMessage", "닉네임 변경에 성공했습니다.");
		}
		return "redirect:/jandi/jandiProfile";
	}
	
	/**
	 * 잔디의 프로필 사진을 디폴트 사진으로 변경하는 메소드
	 * @author 임예람
	 * @param jandiDTO
	 * @param rttr
	 * @return 성공 또는 실패 리다이렉트 메세지
	 */
	@GetMapping("profile")
	public String modifyJandiProfileToDefaultImage(JandiDTO jandiDTO, RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("modifyMessage", "프로필 초기화에 실패했습니다.");
		
		if(jandiService.modifyProfile(jandiDTO)) {
			rttr.addFlashAttribute("modifyMessage", "프로필이 초기화 되었습니다."); 
		}
		 
		return "redirect:/jandi/jandiProfile";
	}
	
	/**
	 * 잔디의 프로필 사진을 변경하는 메소드
	 * @author 임예람
	 * @param jandiDTO
	 * @return 성공시 jandiDTO, 실패시 null
	 */
	@PostMapping("profile")
	@ResponseBody
	public JandiDTO modifyJandiProfile(JandiDTO jandiDTO){
		
		System.out.println("modifyProfile Jandi: " + jandiDTO);
		if(!jandiService.modifyProfile(jandiDTO)) {
			return null;
		}
		
		return jandiDTO;
	}
	
	/**
	 * 잔디의 정보를 변경하는 메소드
	 * @author 임예람
	 * @param jandiDTO
	 * @return 성공시 수정 시간 반환, 실패시 실패 메세지 반환
	 */
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
