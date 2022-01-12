package com.jandiFactoring.redJandi.findJandi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jandiFactoring.redJandi.common.paging.Pagenation;
import com.jandiFactoring.redJandi.common.paging.dto.SelectCriteria;
import com.jandiFactoring.redJandi.findJandi.model.service.FindJandiService;

@Controller
@RequestMapping("/findJandi/*")
public class FindJandiController {
	
	private FindJandiService findJandiService;
	
	@Autowired
	public FindJandiController(FindJandiService findJandiService) {
		this.findJandiService = findJandiService;
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
	

}
