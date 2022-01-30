package com.jandiFactoring.redJandi.findJandi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jandiFactoring.redJandi.common.paging.Pagenation;
import com.jandiFactoring.redJandi.common.paging.dto.SelectCriteria;
import com.jandiFactoring.redJandi.findJandi.model.service.FindJandiService;
import com.jandiFactoring.redJandi.jandi.model.dto.JandiDTO;
import com.jandiFactoring.redJandi.jandi.model.service.JandiService;

@Controller
@RequestMapping("/findJandi/*")
public class FindJandiController {
	
	private FindJandiService findJandiService;
	private JandiService jandiService;
	
	@Autowired
	public FindJandiController(FindJandiService findJandiService, JandiService jandiService) {
		this.findJandiService = findJandiService;
		this.jandiService = jandiService;
	}
	
	/**
	 * @author 임예람
	 * @param model
	 * @param selectCriteria
	 */
	@GetMapping("findAllJandiMain")
	public void findAllJandiMain(Model model, SelectCriteria selectCriteria) {
		
		selectCriteria.setLimit(9);		// 한 페이지에 보여줄 갯수
		selectCriteria.setButtonAmount(5);		// 버튼 갯수
		selectCriteria.setTotalCount(findJandiService.selectFindAllJandiTotalCount(selectCriteria));	// 총 갯수
		selectCriteria = Pagenation.getSelectCriteria(selectCriteria);	// 페이지네이션을 적용 시킨 selectCriteria
		
		model.addAttribute("findJandiList", findJandiService.searchFindAllJandiList(selectCriteria));	
		model.addAttribute("selectCriteria", selectCriteria);
	}
	
	/**
	 * 해당 잔디의 정보를 조회하여 페이지를 요청하는 메소드
	 * @author 임예람
	 * @param model
	 * @param session, email
	 */
	@GetMapping("jandiProfile/{email}")
	public String jandiProfile(Model model, @PathVariable String email) {
		JandiDTO jandi = new JandiDTO();
		jandi.setEmail(email);
		
		// 잔디 정보 조회
		JandiDTO jandiInfo = jandiService.selectJandiInformation(jandi);
		
		model.addAttribute("jandiInfo", jandiInfo);	// 조회한 잔디 정보
		model.addAttribute("jandiClassList", jandiService.selectJandiClassList(jandi));	// 잔디의 클래스 썸네일 리스트(3개)
		
		return "findJandi/jandiProfile";
	}

}
